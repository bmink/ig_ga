#!/bin/bash

COMMENTERS_FILEN=commenters
GIVEAWAYS_FILEN=giveaways

if [[ ! -s "$GIVEAWAYS_FILEN" ]]; then
	echo "$GIVEAWAYS_FILEN must be present and nonzero"
	exit -1
fi

GIVEAWAY_CNT=`cat "$GIVEAWAYS_FILEN" | wc -l`

if [[ ! -s "$COMMENTERS_FILEN" ]]; then
	echo "$COMMENTERS_FILEN must be present and nonzero"
	exit -1
fi

echo "========================================="
echo "Choosing $GIVEAWAY_CNT winners!"
echo "-----------------------------------------"

shuf -n "$GIVEAWAY_CNT" "$COMMENTERS_FILEN" | paste "$GIVEAWAYS_FILEN" -

echo "========================================="
