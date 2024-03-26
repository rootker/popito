#!/usr/bin/env python3
import os
import threading
import concurrent.futures
import time
import argparse
import sys
from datetime import datetime, timezone
from collections import namedtuple


FILE_FULLDATE = namedtuple('FILE_FULLDATE', 'date filename')
DEFAULT_EXCLUSIONS = [ "/sys", "/dev", "/snap", "/proc", "/run" ]
FS_ROOT = "/"

# The modicification of these files usually are due to recent activity by a user - this list
# will expand over time.
INDICATORS_OF_USER_ACTIVITY = [ ".swp", ".bash_history", ".python_history", ".viminfo", ".mysql_history" ]

C_WHITE = '\033[1;37m'
C_BLUE = '\033[1;34m'
C_GREEN = '\033[1;32m'
C_YELLOW = '\033[1;33m'
C_RED = '\033[1;31m'
C_RESET = '\033[0m'
DIV_STRING = "-------------------------------------------"

YELLOW_EX = C_YELLOW + "[!]" + C_RESET
RED_MINUS = C_RED + "[-]" + C_RESET
GREEN_PLUS = C_GREEN + "[+]" + C_RESET

def groupByDate(fileList):

	dateDict = {}
	for fileData in fileList:
		day = str(fileData.date.month) + "-" + str(fileData.date.day) + "-" + str(fileData.date.year)
		if day not in dateDict.keys():
			dateDict[day] = [ fileData ]
		else:
			dateDict[day].append(fileData)

	return dateDict
		

def fullFsWalk(rootDirs, allIgnores):

	fileList = []	

	for directory in rootDirs:
		for root,dirs,filenames in os.walk(directory):
			if root in allIgnores:
				break

			for fn in filenames:
				full = os.path.join(root, fn)
				try:
					utc_time = datetime.fromtimestamp(os.path.getmtime(full))
					local_time = utc_time.astimezone()
					fileList.append(FILE_FULLDATE(date=local_time, filename=full))


				# we just pass common exceptions because real men power through errors			

				# this can happen if the file is removed as we are trying to get the date.
				except FileNotFoundError:
					pass
	
				# permission denied errors are ignored.
				except PermissionError:
					pass
	return fileList


def checkUserDirs(dirs):

	areValid = True
	for i in dirs:
		if not os.path.isdir(i.strip()):
			print(i + " Does not appear to be a valid directory.")
			areValid = False


	if not areValid:
		print("Please specify valid directories . . .")	
		sys.exit(1)
			

def outputData(dataset, logFile):

	for key, val in dataset.items():
		dayDateTime = datetime.strptime(key, "%m-%d-%Y")
		weekday = dayDateTime.strftime("%A")

		# this just adds filler zero's; there's way more efficient ways to handle these dates, I know.
		reconvertedDate = dayDateTime.strftime("%m-%d-%Y")
		print(C_WHITE + weekday.upper() + ", " + reconvertedDate + C_RESET)
		print(DIV_STRING)

		if logFile:
			with open(logFile, "a") as f:
				f.write(weekday.upper() + ", " + reconvertedDate + "\n")
				f.write(DIV_STRING + "\n")

		for i in val:
			
			dateString = str(i.date).split(".")[0]

			iouaFile = False			
			# checks if the specified file is an "Indicator of User Activity"
			for string in INDICATORS_OF_USER_ACTIVITY:
				if string in i.filename:
					iouaFile = True

			if iouaFile:
				print("[" + C_WHITE + dateString + C_RESET + "]> " + C_RED + i.filename + C_RESET)
				if logFile:
					with open(logFile, "a")  as f:
						f.write( "[" + dateString + "]> " + i.filename + " (IND OF USER ACTIVITY)\n" )
			else:
				print("[" + C_WHITE + dateString + C_RESET + "]> " + C_BLUE + i.filename + C_RESET)
				if logFile:
					with open(logFile, "a")  as f:
						f.write( "[" + dateString + "]> " + i.filename + "\n" )

		print(DIV_STRING)
		print(" ")
		
		if logFile:
			with open(logFile, "a")  as f:
				f.write(DIV_STRING + "\n")
				f.write("\n")


	if logFile:
		print(GREEN_PLUS + " Results have also been written to " + logFile)
	


	


def main():

	parser = argparse.ArgumentParser(description="Chronologizes files on the system by modification time to analyze system activity.")
	parser.add_argument('-o', nargs='?', metavar="output file", help="Direct output to a specified file in addition to stdout.")
	parser.add_argument('-i', nargs='?', metavar="dir list", help="Specifies a comma separated list of directories to ignore. (Example: -i /usr,/lib)")
	parser.add_argument('-e', nargs='?', metavar="dir list", help="Specified a comma separted list of directories to check, ignoring all other directories. (Example: -e /home,/tmp)")
	
	args = parser.parse_args()

	logFile = ""
	if args.o:
		logFile = args.o

	userIgnores = []
	if args.i:
		userIgnores = (args.i).split(",")
		checkUserDirs(userIgnores)

	
	ignores = DEFAULT_EXCLUSIONS
	if len(userIgnores) > 0:
		for ignoredDir in userIgnores:
			ignores.append(ignoredDir)

	
	userExclusives = []
	if args.e:
		userExclusives = (args.e).split(",")
		checkUserDirs(userExclusives)
		rootDirs = userExclusives
	
	else:

		rootDirs = []
		for root, dirs, filenames in os.walk(FS_ROOT):
			for dirname in dirs:
				rootDirs.append(FS_ROOT + dirname)
			break


	print(YELLOW_EX + " Scraping filesystem info. Depending on your scope this could take some time . . .")
	print(YELLOW_EX + " If it starts taking too long, you may want to reduce your scope (maybe ignore /usr or /lib?)")
	fullList = fullFsWalk(rootDirs,ignores)

	fullList.sort()

	if len(fullList) == 0:
		print(RED_MINUS + " No output. You may not have permission to access your specified directories.")
	else:
		groupedDataSet = groupByDate(fullList)
		outputData(groupedDataSet, logFile)
	
main()
