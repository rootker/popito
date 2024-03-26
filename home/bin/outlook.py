import os
import datetime
import smtplib
import subprocess
now =  datetime.datetime.now()
# username = input("What is your username? ")
# password = input("What is your password? ")
password = subprocess.run(["pass", "show", "email/hotmail_mohamed5ik"], capture_output=True).stdout
username_password = [
    ("user@hotmail.cmo","password"),
    ("user2@gmail.com","password"),
    ("mohamed5ik@hotmail.com",password.decode()),
]
invalid_pass = 'Invalid login credentials'
server_url = 'outlook.office365.com'

for email, password in username_password: 
    print(email,password)
    try:
        server = smtplib.SMTP(server_url, 587)
        server.starttls()
        server.login(email,password)
        print(f'Login successful -> email : {email} {password}')
        with open(f'log-{now.year}-{now.month}-{now.day}.txt', 'w') as f:
            f.write(f'{now.year}-{now.month}-{now.day} {email} {password} Status: working')
    except smtplib.SMTPAuthenticationError as e:
        print(invalid_pass)
        continue
        # os._exit(1)
    finally:
        server.quit()
