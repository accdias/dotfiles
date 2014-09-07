#!/usr/bin/awk -f
BEGIN {
	FS="\""
	days["Sun"] = 1
	days["Mon"] = 2
	days["Tue"] = 3
	days["Wed"] = 4
	days["Thu"] = 5
	days["Fri"] = 6
	days["Sat"] = 7

	db = "/home/accdias/.cache/conky/weather.db"

	# 44139 = Santo Andre, SP, BRAZIL
	city = "449139"

	# c = Metric, f = Imperial
	units = "c"

	# Yahoo! Weather api
	url = sprintf("/usr/bin/curl -s \'http://weather.yahooapis.com/forecastrss?w=%s&u=%s\' -o-", city, units)

    while ((url | getline) > 0) {
		if (/^<yweather:location/) {
			location["city"] = $2
			location["region"] = $4
			location["country"] = $6
		}
		if (/^<yweather:location/) {
			location["city"] = $2
			location["region"] = $4
			location["country"] = $6
		}
		if (/^<yweather:wind/) {
			wind["chill"] = $2
			wind["direction"] = $4
			wind["speed"] = $6
		}
		if (/^<yweather:units/) {
			temperature["units"] = $2
			distance["units"] = $4
			pressure["units"] = $6
			wind["units"] = $8
		}
		if (/^<yweather:atmosphere/) {
			atmosphere["humidity"] = $2
			atmosphere["visibility"] = $4
			atmosphere["pressure"] = $6
			atmosphere["rising"] = $8
		}
		if (/^<yweather:astronomy/) {
			astronomy["sunrise"] = $2
			gsub(":","h", astronomy["sunrise"])
			astronomy["sunset"] = $4
			gsub(":","h", astronomy["sunset"])
		}
		if (/^<yweather:condition/) {
			condition["text"] = $2
			condition["code"] = $4
			condition["temperature"] = $6
		}
		if (/^<yweather:forecast/) {
			forecast[days[$2]]["day"] = $2
			forecast[days[$2]]["low"] = $6
			forecast[days[$2]]["high"] = $8
			forecast[days[$2]]["text"] = $10
			forecast[days[$2]]["code"] = $12
		}
	}
	close(xml)

	# Location
	printf("%s:%s:%s", location["city"], location["region"], location["country"]) >db
	# Pressure
	printf(":%s %s", atmosphere["pressure"], pressure["units"]) >>db
	# Humidity
	printf(":%s%%", atmosphere["humidity"]) >>db
	# Wind
	printf(":%s %s", wind["speed"], wind["units"]) >>db
	# Sunrise
	printf(":%s", astronomy["sunrise"]) >>db
	# Sunset
	printf(":%s", astronomy["sunset"]) >>db
	# Current temperature
	#printf(":%s°%s:%s:%s", condition["temperature"], temperature["units"], condition["text"], condition["code"]) >>db
	printf(":%s°:%s:%s", condition["temperature"], condition["text"], condition["code"]) >>db
	# Forecast
	for (i=1; i<8; i++) {
		if (forecast[i]["code"] != 0) {
			# Day of the week
			printf(":%s", forecast[i]["day"]) >>db
			# Lowest
			#printf(":%s°%s", forecast[i]["low"], temperature["units"]) >>db
			#printf(":%s°↓", forecast[i]["low"]) >>db
			printf(":%s°", forecast[i]["low"]) >>db
			# Highest
			#printf(":%s°%s", forecast[i]["high"], temperature["units"]) >>db
			#printf(":%s°↑", forecast[i]["high"]) >>db
			printf(":%s°", forecast[i]["high"]) >>db
			# Text
			printf(":%s", forecast[i]["text"]) >>db
			# Code
			printf(":%s", forecast[i]["code"]) >>db
		}
	}
	printf("\n") >>db
}
