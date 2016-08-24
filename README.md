# DefaceDetectionBot

This bot monitors websites and notifies the operator via command line and telegram about the change in the websites greater than a predefined threshold.

1- Fill urls.list with the urls you want to monitor with the following syntax

    url localfile_name.html

2- Run getsites.sh once to get a clean snapshot of websites.

3- Running diffsites.sh gets the current state of websites and compares them with the baseline

4- notify.sh Sends an alarm over telegram (Setup the tokens for the telegram bot)

5- Running nohup scheduler.sh & runs the script in the background every 5 minutes

For more information please refer to https://www.silverf0x00.com/website-deface-detection-script/
