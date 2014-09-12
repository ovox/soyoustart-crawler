#!/bin/bash
curl -silent https://eu.soyoustart.com/en/cgi-bin/newOrder/order.cgi?hard=143sys13 > /tmp/143sys13 &&

curl -silent https://eu.soyoustart.com/en/cgi-bin/newOrder/order.cgi?hard=143sys10 > /tmp/143sys10 &&

curl -silent https://eu.soyoustart.com/en/cgi-bin/newOrder/order.cgi?hard=143sys11 > /tmp/143sys11 &&

UNAVAILABLE=`grep -i "invalide" /tmp/143sys13`

UNAVAILABLE2=`grep -i "invalide" /tmp/143sys10`

UNAVAILABLE3=`grep -i "invalide" /tmp/143sys11`

echo $UNAVAILABLE

if [ -z "$UNAVAILABLE" ]; then
                echo "E3-SSD-1 is now available!" | mail -s E3-SSD-1 adamkennethdean@me.com

elif [ -z "$UNAVAILABLE2" ]; then
                echo "E3-SSD-2 is now available!" | mail -s E3-SSD-2 adamkennethdean@me.com

elif [ -z "$UNAVAILABLE3" ]; then
                echo "E3-SSD-3 is now available!" | mail -s E3-SSD-3 adamkennethdean@me.com

else
                echo "Lame, None of the monitored servers are available." 

fi

rm /tmp/143*

exit 0
