SOMETHING NOT WORKING - not plotting old data from new stations

NDBC: https://www.ndbc.noaa.gov
Station 42060 - Caribbean Valley: https://www.ndbc.noaa.gov/station_page.php?station=42060
Station 41040 - NORTH EQUATORIAL ONE: https://www.ndbc.noaa.gov/station_page.php?station=41040
Station 41044 - NE ST MARTIN: https://www.ndbc.noaa.gov/station_page.php?station=41044
For data description: https://www.ndbc.noaa.gov/measdes.shtml

Real-time data: 
https://www.ndbc.noaa.gov/station_realtime.php?station=42060
https://www.ndbc.noaa.gov/station_realtime.php?station=41040
https://www.ndbc.noaa.gov/station_realtime.php?station=41044

Updating files at MVO

New yearly and monthly files have to be updated manually from:
https://www.ndbc.noaa.gov/station_history.php?station=42060
https://www.ndbc.noaa.gov/station_history.php?station=41040
https://www.ndbc.noaa.gov/station_history.php?station=41044

./getAll.sh then gets latest real-time data and updates:
all42060.txt
all41040.txt
all41044.txt

./getRealTime.sh gets latest real time data (hourly cron job) and updates:
rt42060.txt
rt41040.txt
rt41044.txt

Plotting
Use MATLAB software in STUFF/projectsMVO/noise-swell



