#!/bin/bash

# Create a datestamped filename for the raw wttr data:
today=$(date +%Y%m%d)
weather_report="raw_data_$today"

# Download today's weather report from wttr.in with core data:
city="Casablanca"
curl wttr.in/$city?T -o $weather_report

grep °C $weather_report > temperatures.txt

obs_tmp=$(head -1 temperatures.txt | tr -s " " | xargs | rev | cut -d " " -f2 | rev)
fc_temp=$(head -3 temperatures.txt | tail -1 | tr -s " " | xargs | cut -d "C" -f2 | rev | cut -d " " -f2 | rev)

hour=$(TZ='Morocco/Casablanca' date -u +%H) 
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)

record=$(echo -e "$year\t$month\t$day\t$hour\t$obs_tmp\t$fc_temp")
echo $record>>rx_poc.log
