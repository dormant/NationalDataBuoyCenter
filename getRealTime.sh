#!/usr/bin/bash
# 
# getRealTime
#
# Fetches real-time data for NDBC buoy 42060 and updates local text files
# Designed to be run as a cron job
#
# R.C. Stewart, 2023-03-14

cd dataNDBC

wget -O temp.txt https://www.ndbc.noaa.gov/data/5day2/42060_5day.txt
cat temp.txt | grep -v ^# | sort -u | sed -e 's/ MM/999/g' > rt42060-last5days.txt

wget -O temp.txt https://www.ndbc.noaa.gov/data/5day2/41040_5day.txt
cat temp.txt | grep -v ^# | sort -u | sed -e 's/ MM/999/g' > rt41040-last5days.txt

wget -O temp.txt https://www.ndbc.noaa.gov/data/5day2/41044_5day.txt
cat temp.txt | grep -v ^# | sort -u | sed -e 's/ MM/999/g' > rt41044-last5days.txt

cd ..
