#!/bin/bash
curl -silent https://eu.soyoustart.com/en/cgi-bin/newOrder/order.cgi?hard=143sys6 > /tmp/143sys13 &&

UNAVAILABLE=`grep -i "invalide" /tmp/143sys13`

echo $UNAVAILABLE

if [ -z "$UNAVAILABLE" ]; then
		echo "Sys 5 is available!!" | curl -u <YOUR-PUSHBULLET-TOKEN>: -X POST https://api.pushbullet.com/v2/pushes --header 'Content-Type: application/json' --data-binary '{"type": "note", "title": "Quick, buy server", "body": "Sys 5 is available"}'
else
		echo "Sys 5 is not available :("
fi

rm /tmp/143*

exit 0
