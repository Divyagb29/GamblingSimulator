#!/bin/bash

echo "Welcome to Gambler Simulator"
STAKE=100
BET=1
NO_OF_DAYS=20
calculateWinOrLose()
{
	while [ $STAKE -lt '100' &&  $STAKE -gt '50' ] 
	do
	if [ $((RANDOM%2)) -eq '0'  ]
	then
		STAKE=$((STAKE-BET))
	else
		STAKE=$((STAKE+BET))
	fi
	done

		wins[((WIN_COUNT++))]=$WIN 
		loses[((LOSE_COUNT++))]=$LOSE	
}

calculateAmountWinOrLose()
{
	for (( i = 1 ; i<= $NO_OF_DAYS ;i++ ))
	do
		if [[ ${wins[i]} -gt ${loses[i]} ]]
		then
			NO_OF_WINS=$((NO_OF_WINS +1))
		else
			NO_OF_LOSES=$((NO_OF_LOSES +1))
		fi
	done
	if [[ $NO_OF_WINS -gt $NO_OF_LOSES ]]
	then
		amountWon=$((NO_OF_WINS * 50))
	else
		amountLost=$((NO_OF_LOSES * 50))
	fi
}
for (( i = 1;i <= $NO_OF_DAYS ; i++  )) 
do
	STAKE=100
	WIN=0
	LOSE=0
	calculateWinOrLose 
done

calculateAmountWinOrLose