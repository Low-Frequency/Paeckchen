#!/bin/bash

KEEP=1
SIDE=0
PREV=0
DRINK=0
COMBINED=0

RED='\033[0;31m'        # error color
GREEN='\033[0;32m'      # success color
NONE='\033[0m'          # default

echo "Willkommen zu Paeckchen!"
echo ""
read -p 'Druecke Enter zum Spielen'
echo ""

while [[ "$KEEP" -eq 1 ]]
do
	RAND=$((1+$RANDOM%101))

	if [[ "$RAND" -eq 101 ]]
	then
		echo -e "${RED}AUF EX!"
		echo ""
	elif [[ "$RAND" -le 51 ]]
	then
		SIDE=1
	elif [[ "$RAND" -gt 50 && "$RAND" -lt 91 ]]
	then
		SIDE=2
	else
		SIDE=3
	fi

	if [[ "$SIDE" -eq 1 && "$PREV" -gt 1 ]]
	then
		echo -e "${RED}Das Paeckchen ist auf Seite 1 gelandet."
		echo -e "Trink $DRINK Schluecke!${NONE}"
		echo ""
		PREV=0
		COMBINED=$(($COMBINED+$DRINK))
		DRINK=0
	elif [[ "$SIDE" -eq 1 ]]
	then
		echo -e "${GREEN}Das Paeckchen ist auf Seite 1 gelandet.${NONE}"
		echo ""
		PREV=1
		DRINK=$(($DRINK+1))
	elif [[ "$SIDE" -eq 2 && "$PREV" -gt 2 ]]
	then
		echo -e "${RED}Das Paeckchen ist auf Seite 2 gelandet."
		echo -e "Trink $DRINK Schluecke!${NONE}"
		echo ""
		PREV=0
		COMBINED=$(($COMBINED+$DRINK))
		DRINK=0
	elif [[ "$SIDE" -eq 2 ]]
	then
		echo -e "${GREEN}Das Paeckchen ist auf Seite 2 gelandet.${NONE}"
		echo ""
		PREV=2
		DRINK=$(($DRINK+2))
	elif [[ "$SIDE" -eq 3 ]]
	then
		echo -e "${GREEN}Das Paeckchen ist auf Seite 3 gelandet.${NONE}"
		echo ""
		PREV=3
		DRINK=$(($DRINK+3))
	fi

	echo "Weiterspielen?"
	echo "1: Ja (Default)"
	echo "0: Nein"
	read -p 'Weiterspielen? ' KEEP
	KEEP=${KEEP:-1}
	echo ""
	echo ""
done

echo "Insgesamt wurden $COMBINED Schluecke verteilt"
