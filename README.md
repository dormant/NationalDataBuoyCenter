# NationalDataBuoyCenter

Collect NOAA ocean buoy data, for as long as Trump allows it.

## Description

* Data and scripts are in */home/seisan/data/weather/NationalDataBuoyCenter*.
* Data description: https://www.ndbc.noaa.gov/measdes.shtml

We use data from three NDBC buoys.

* Station 42060 - Caribbean Valley: https://www.ndbc.noaa.gov/station_page.php?station=42060
* Station 41040 - NORTH EQUATORIAL ONE: https://www.ndbc.noaa.gov/station_page.php?station=41040
* Station 41044 - NE ST MARTIN: https://www.ndbc.noaa.gov/station_page.php?station=41044

The wave direction and height data appear to have missing values compared to the wind direction and speed data and can be seen in the one-day plots (eg http://webobs.mvo.ms:8080/mvofls2/monitoring_data/weather_plots/NDBC_41040-last_1_days.png). The reason for this is not known.

## Updating data

### File Names

* Yearly files have an 'h' in the file name, eg *41044h2024.txt*.
* Monthly files use one or two characters for the month, eg *4104012025.txt* and *41040112025.txt*.

### Automatic updates

Recent data is downloaded and plotted automatically by cronjobs running on *opsproc3*.
```
# Update NDBC buoy data and plot
9 * * * * cd /home/seisan/data/weather/NationalDataBuoyCenter; ./getRealTime.sh; ./getAll.sh  > /home/seisan/log/getNDBC.log  2>&1
19 * * * * /usr/local/bin/matlab -sd /home/seisan/data/weather/NationalDataBuoyCenter -batch plot_sea_state_RealTime > /home/seisan/log/plotNDBC.log 2>&1
```

### Manual updates

New yearly and monthly files have to be updated manually from:
* https://www.ndbc.noaa.gov/station_history.php?station=42060
* https://www.ndbc.noaa.gov/station_history.php?station=41040
* https://www.ndbc.noaa.gov/station_history.php?station=41044

* This must be done if you notice gaps in plotted data.
* Download yearly and monthly files not in *./data* from the **Standard meteorological data** links.
* All but one of the files can be uncompressed and moved to *./data*.
* The most recent monthly file has to be downloaded using *Save As* in your browser. It should then be renamed by adding the numerical month and year to the end of the file name.
```
$ mv 41040.txt 4104032025.txt
```
* Once a yearly file is present, all monthly files for that year should be deleted.


## Scripts (run as cron)

| Script       | Function |
| -------------| -------------------|
| *getAll.sh*   | Fetches last 45 days of data and updates local *all\*.txt* text files.|
| *getRealTime.sh*   | Fetches real-time data (last 5 days) and updates local *rt\*.txt* text files.|
| *plot_sea_state_RealTime.m* | Creates plots of last day and last 5 days for each buoy.|


## Author

Roderick Stewart, Dormant Services Ltd

rod@dormant.org

https://services.dormant.org/


## License

This project is owned by Montserrat Volcano Observatory.
