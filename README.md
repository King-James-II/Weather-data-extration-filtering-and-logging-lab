# Weather Data Extraction Project

This project script automates the process of extracting weather data for Casablanca using the `wttr.in` service, storing the data in a log file, and setting up a cron job for daily automation.

## Tasks Accomplished

- **Download Weather Report**: The script downloads today's weather report from `wttr.in` for Casablanca.
- **Extract Temperature Data**: It extracts the observed current temperature and the forecasted temperature for noon tomorrow.
- **Create Record**: A tab-delimited record is created with the year, month, day, observed temperature, and forecasted temperature.
- **Log Data**: The generated record is appended to `rx_poc.log` for logging purposes.

## Automation with Cron Job

A cron job has been set up to automatically run this script daily to fetch weather data using crontab -e