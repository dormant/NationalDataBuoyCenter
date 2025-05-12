#!/usr/bin/bash
# 
# getAll
#
# Fetches data for NDBC buoy 42060 and updates local text files
#
# R.C. Stewart, 2023-03-14

cd dataNDBC

wget -O 42060-last45days.txt https://www.ndbc.noaa.gov/data/realtime2/42060.txt
cat head.txt > all42060.txt
cat 42060*.txt | grep -v ^# | sort -u | sed -e 's/ MM/999/g' >> all42060.txt

wget -O 41040-last45days.txt https://www.ndbc.noaa.gov/data/realtime2/41040.txt
cat head.txt > all41040.txt
cat 41040*.txt | grep -v ^# | sort -u | sed -e 's/ MM/999/g' >> all41040.txt

wget -O 41044-last45days.txt https://www.ndbc.noaa.gov/data/realtime2/41044.txt
cat head.txt > all41044.txt
cat 41044*.txt | grep -v ^# | sort -u | sed -e 's/ MM/999/g' >> all41044.txt

cd ..
