#!/bin/sh
FILE="/app/speedtest/test_connection.log"

while true 
do 
	TIMESTAMP=$(date +%Y-%m-%dT%H:%M:%S)

	speedtest-cli > $FILE

	DOWNLOAD=$(cat $FILE | grep "Download:" | awk -F " " '{print $2}')
	UPLOAD=$(cat $FILE | grep "Upload:" | awk -F " " '{print $2}')
	echo "$TIMESTAMP   Download: $DOWNLOAD Upload: $UPLOAD"
	
	postDataJson="{\"download\":$DOWNLOAD,\"upload\":$UPLOAD,\"@timestamp\":\"$TIMESTAMP\"}"

	curl -X POST $HOST/speedtest-`date +%Y.%m.%d`/_doc \
	--header 'Content-Type: application/json' \
	-d ${postDataJson}

	sleep $INTERVAL

done