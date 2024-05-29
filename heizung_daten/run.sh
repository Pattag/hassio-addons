#!/bin/sh

#get
wget http://192.168.178.88/GRAFIK1.htm -O /home/files/GRAFIK1.htm
wget http://192.168.178.88/580E16.htm -O /home/files/580E16.htm
wget http://192.168.178.88/580E17.htm -O /home/files/580E17.htm
wget http://192.168.178.88/580E09.htm -O /home/files/580E09.htm
wget http://192.168.178.88/580E06.htm -O /home/files/580E06.htm
wget http://192.168.178.88/580E08.htm -O /home/files/580E08.htm
wget http://192.168.178.88/580E14.htm -O /home/files/580E14.htm
#ftp
cd /home/files
DATE=`date +%y%m%d`
HOST='*********'
USER='*********'
PASSWD='*******'
FILE1='GRAFIK1.htm'
FILE1NEW=GRAFIK1-$DATE.htm
FILE2='580E16.htm'
FILE2NEW=580E16-$DATE.htm
FILE3='580E16.htm'
FILE3NEW=580E16-$DATE.htm
FILE4='580E17.htm'
FILE4NEW=580E17-$DATE.htm
FILE5='580E06.htm'
FILE5NEW=580E06-$DATE.htm
FILE6='580E08.htm'
FILE6NEW=580E08-$DATE.htm
FILE7='580E09.htm'
FILE7NEW=580E09-$DATE.htm
FILE8='580E14.htm'
FILE8NEW=580E14-$DATE.htm
lftp -d -u $USER,$PASSWD $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
cd /html/pellet/daten
passive
binary
put $FILE1 -o $FILE1NEW
put $FILE2 -o $FILE2NEW
put $FILE3 -o $FILE3NEW
put $FILE4 -o $FILE4NEW
put $FILE5 -o $FILE5NEW
put $FILE6 -o $FILE6NEW
put $FILE7 -o $FILE7NEW
put $FILE8 -o $FILE8NEW
quit
END_SCRIPT
#clean
rm GRAFIK1.htm
rm 580E16.htm
rm 580E17.htm
rm 580E06.htm
rm 580E08.htm
rm 580E09.htm
rm 580E14.htm