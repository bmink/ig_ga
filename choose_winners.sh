#!/bin/bash

COMMENTERS_FILEN=commenters
PRIZES_FILEN=prizes

if [[ ! -s "$PRIZES_FILEN" ]]; then
	echo "$PRIZES_FILEN must be present and nonzero"
	exit -1
fi

PRIZE_CNT=`cat "$PRIZES_FILEN" | wc -l`

if [[ ! -s "$COMMENTERS_FILEN" ]]; then
	echo "$COMMENTERS_FILEN must be present and nonzero"
	exit -1
fi

COUNTD_SEC=5

for i in $(seq "$COUNTD_SEC" -1 1); do
	echo "$i"
	sleep 1
done


echo "========================================="
echo "Choosing $PRIZE_CNT winners!"
echo "-----------------------------------------"

shuf -n "$PRIZE_CNT" "$COMMENTERS_FILEN" | paste "$PRIZES_FILEN" -

echo "========================================="
