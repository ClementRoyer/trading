#!/bin/sh
## EPITECH PROJECT, 2018
## 
## File description:
## 
##


# 0.0 SOMMAIRE
#	1.0 Déclerationd de variables globals
#	2.0 statubar //bar du haut avec date , login et prenom
#	3.0 loginscreen

#	1.0
#======================================================================================================================================================================================================================================
#														DÉCLERATION de variables globals
cols=$(tput cols)
rows=$(tput lines)

#profil
connect="false"
msgname=""
eur_=10000
btc_=0
raw_=0
stock_=0
forex_=0
placement="crypto raw_ma stock_ forex_"
amountcrypto=0
amountraw=0
amountstock=0
amountforex=0
start=$SECONDS
sx=$(( ( ($cols / 2) - 60) ))
sy=$(( ( ($rows / 2) - 4 ) ))

#	2.0
#======================================================================================================================================================================================================================================
#	       														STATUBAR

statubar()
{
    nco="You are not connected. Type /login to connect."
    co="You have been properly connected"
    if [ ${#msgname} -eq 0 ]
    then
	msgname="Unknow"
    fi
    msgcols=$((( ($cols - ${#msgname}) - 2)))
    ncocols=$((( (($cols/2) - (${#nco}/2)))))
    cocols=$((( (($cols/2) - (${#co}/2)))))
    tput reset
    tput cup 0 2
    echo -e "\e[1;38;5;220m$(date +"%d-%m-%Y")\e[0m"
    if [ $connect == "false" ]
    then
	tput cup 0 $ncocols
	echo -e "\e[1;91m${nco}\e[0m"
    else
	tput cup 0 $cocols
	echo -e "\e[1;92m${co}\e[0m"
    fi
    tput cup 0 $msgcols
    echo -e "\e[1;38;5;220m$msgname\e[0m"
}

#	3.0
#======================================================================================================================================================================================================================================
#														LOGIN SCREEN

Thelogin()
{
    tmp="LOGIN : "
    txt="N U C L E A R CRYPTO BOT"
    middle=$(( (($rows/2) - 10) ))
    lenAscii=$(( ((($cols/2) - (${#txt}/2)) - 10) ))
    tput cup $middle $lenAscii
    echo -e "\e[1;38;5;45m\033#6N U C L E A R CRYPTO BOT\e[0m"
    lenAscii=$((( (($cols/2) - (${#tmp}/2)))))
    middle=$((($rows/2) - 10))
    middle=$((($rows/2) - 8))
    tput cup $middle $lenAscii
    echo -e "\e[1;38;5;123mLOGIN :\e[1;33m\033#5"
    lenAscii=$((( (($cols/2) + (${#tmp}/2)))))
    tput cup $middle $lenAscii
    read -u 2 login
    middle=$((($rows/2) - 7))
    lenAscii=$((( (($cols/2) - (${#tmp}/2)))))
    tput cup $middle $lenAscii
    echo -e "\e[1;38;5;123mPASS  :\e[0m"
    middle=$((($rows/2) - 7))
    lenAscii=$((( (($cols/2) + (${#tmp}/2)))))
    tput cup $middle $lenAscii
    echo -en "( •_•)"
    tput cup $middle $lenAscii
    read -u 2 -s pass
    tput cup $middle $lenAscii
    echo  -e "(⌐■_■)"
}

Thewait()
{
    i=${#login}

    while [ $i -ne 0 ]
    do
	middle=$(( ($rows/2) - 8 ))
	lenAscii=$(( ((($cols/2) + (${#tmp}/2) + $i)) ))
	tput cup $middle $lenAscii
	printf "\e[38;5;173m%*s\e[0m" ${#login} "ヾ('〇')ﾉ"
	sleep .50
	middle=$(( ($rows/2) - 8 ))
	lenAscii=$(( (($cols/2) + ((${#tmp}/2) + $i)) ))
	tput cup $middle $lenAscii
	printf "\e[38;5;173m%*s\e[0m" ${#login} "ヾ(-_- )ゞ"
	sleep .50
	i=$(( $i - 1 ))
    done
}

veriflogin()
{
    connect="true"
}

#	4.0
#======================================================================================================================================================================================================================================
#														DISPLAY INFORMATION

#	4.1
#		BANQ

banq()
{
    #1/3 shell for banq (1/3) / 2
    box_top="          ╭────────╮"
    x=$(( ((($rows / 2) / 2) - ((${#box_top} / 2)/2) ) ))
    y=5
    tput cup $y $x
    echo -e "\e[38;5;109m${box_top}\e[0m"
    x=$(( ((($rows / 2) / 2) - ((${#box_top} / 2)/2) ) ))
    y=6
    tput cup $y $x
    echo -e "\e[38;5;109m┌─────────┤\e[1;38;5;79m BANQUE \e[0m\e[38;5;109m├─────────┐\e[0m"
    y=7
    tput cup $y $x
    echo -e "\e[38;5;109m│         └────────┘         │\e[0m"
    y=8
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-28s\e[38;5;109m│\e[0m"
    y=9
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m      \e[38;5;113mEUR: \e[3;38;5;112m%-19s\e[0m\e[38;5;109m│\e[0m" "`echo "scale=3; ${eur_} / 1" | bc -l`€"
    y=10
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-28s\e[38;5;109m│\e[0m"
    y=11
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m      \e[38;5;113mCRYPTO: \e[3;38;5;112m%-14s\e[0m\e[38;5;109m│\e[0m" `echo "scale=6; ${btc_} / 1" | bc -l`
    y=12
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-28s\e[38;5;109m│\e[0m"
    y=13
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m      \e[38;5;113mRAW: \e[3;38;5;112m%-17s\e[0m\e[38;5;109m│\e[0m" `echo "scale=6; ${raw_} / 1" | bc -l`
    y=14
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-28s\e[38;5;109m│\e[0m"
    y=15
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m      \e[38;5;113mSTOCK: \e[3;38;5;112m%-15s\e[0m\e[38;5;109m│\e[0m" `echo "scale=6; ${stock_} / 1" | bc -l`
    y=16
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-28s\e[38;5;109m│\e[0m"
    y=17
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m      \e[38;5;113mFOREX: \e[3;38;5;112m%-15s\e[0m\e[38;5;109m│\e[0m" `echo "scale=6; ${forex_} / 1" | bc -l`
    y=18
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-28s\e[38;5;109m│\e[0m"
    y=19
    tput cup $y $x
    echo -e "\e[38;5;109m└────────────────────────────┘\e[0m"
}

#	4.2
#		RUNTIME

runtime()
{
    box_top="╭──┤ RUNNING TIME ├──────────╮"
    time=$(( SECONDS - start ))
    x=$(( ((($rows / 2) / 2) - ((${#box_top} / 2)/2) ) ))
    y=20
    tput cup $y $x
    echo -e "   \e[38;5;109m╭──────────────╮\e[0m"
    x=$(( ((($rows / 2) / 2) - ((${#box_top} / 2)/2) ) ))
    y=21
    tput cup $y $x
    echo -e "\e[38;5;109m┌──┤ \e[1;38;5;220mRUNNING TIME\e[0m \e[38;5;109m├──────────┐\e[0m"
    y=22
    tput cup $y $x
    printf "\e[38;5;109m│  └──────────────┘   \e[1;38;5;109m%5s\e[0m  \e[38;5;109m│\e[0m" "$time"
    y=23
    tput cup $y $x
    echo -e "\e[38;5;109m└────────────────────────────┘\e[0m"
}

#	4.3
#		CURRPLACEMENT

currplacement()
{
    box_top="   ╭───────────────────╮"
    txt="CURRENT PLACEMENT"
    x=$(( ((($rows / 2) / 2) - ((${#box_top} / 2)/2) ) ))
    y=27
    tput cup $y $x
    echo -e "\e[38;5;109m${box_top}\e[0m"
    x=$(( ((($rows / 2) / 2) - ((${#box_top}/2 / 2)) ) ))
    y=28
    tput cup $y $x
    echo -e "\e[38;5;109m┌──┤ \e[1;38;5;220m$txt\e[0m\e[38;5;109m ├──┐\e[0m"
    y=29
    tput cup $y $x
    echo -e "\e[38;5;109m│  └───────────────────┘  │\e[0m"
    y=30
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-25s\e[38;5;109m│\e[0m"
    nb=`echo "$placement" | wc -w`
    y=31
    i=0
    parray=( $placement )
#   while [ $i -ne $nb ]
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m\e[0m      %-19s\e[38;5;109m│\e[0m" "${parray[0]}:    ????"
    y=$(( ($y + 1) ))
    i=$(( ($i + 1) ))
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m\e[0m      %-19s\e[38;5;109m│\e[0m" "${parray[1]}:    ????"
    #$amountraw"
    y=$(( ($y + 1) ))
    i=$(( ($i + 1) ))
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m\e[0m      %-19s\e[38;5;109m│\e[0m" "${parray[2]}:     ????"
    #$amountstock
    y=$(( ($y + 1) ))
    i=$(( ($i + 1) ))
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m\e[0m      %-19s\e[38;5;109m│\e[0m" "${parray[3]}:     ????"
    #$amountcrypto"
    y=$(( ($y + 1) ))
    i=$(( ($i + 1) ))
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-25s\e[38;5;109m│\e[0m"
    y=$(( $y + 1 ))
    tput cup $y $x
    echo -e "\e[38;5;109m└─────────────────────────┘\e[0m"
}

#	4.4
#		PLACENAME

placename()
{
    box_top="┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
    name_bx="                         crypto                   raw_ma                 stock_                 forex_"
    explcation="PRICE_€ . MOYENNE . LOWER_B .  HIGHT_B"
    array=( $explcation )
    x=$(( (($cols / 2) - (((${#box_top} / 3) + (${#box_top}/7)))  )))
    y=6
    tput cup $y $x
    echo -e "\e[38;5;109m\e[1;38;5;229m${name_bx}\e[0;38;5;109m\e[0m"
    y=7
    tput cup $y $x
    printf "\e[38;5;109m%-$(( (${#box_top} - 2) ))s\e[0m"
    y=8
    tput cup $y $x
    printf "\e[38;5;109m%-$(( (${#box_top} - 2) ))s\e[0m"
    y=9
    for i in {0..10}
    do
	y=$(( ($y + 1) ))
	tput cup $y $x
	printf "\e[38;5;109m%-$(( (${#box_top} - 2) ))s\e[0m" "${array[${i}]}"
	i=$(( ($i + 1) ))
    done
}


Themsgbox()
{
    size=145
    x=$(( ( ($cols / 2) - (${size} / 2)  ) ))
    y=$(( ( ($rows) - ($rows / 9)) ))
    tput cup $y $x
    printf "\e[38;5;155mYOUR ORDER    ⫷⫶%-${size}s⫶⫸\e[0m"
}

botaction()
{
    box_top="┌───────────────────────────────────────────────┤ N U C L E A R BOT ACTION ├───────────┐"
    x=$(( ( ($cols / 2) - ((${#box_top} / 2) + 18)  ) ))
    y=$(( ( ($rows / 2) - 6 ) ))
    tput cup $y $x
    printf "\e[38;5;75m%-$(( ((${#box_top}/2) + 7) ))s╭──────────────────────────╮"
    y=$(( ( ($rows / 2) - 5 ) ))
    tput cup $y $x
    echo -e "\e[38;5;75m┌──────────────────────────────────────────────────┤ \e[1;38;5;220mN U C L E A R\e[0;38;5;220m BOT ACTION \e[38;5;75m├────────┐\e[0m"
    y=$(( $y + 1 ))
    tput cup $y $x
    printf "\e[38;5;75m│%-$(( ((${#box_top}/2) + 6) ))s└──────────────────────────┘        │\e[0m"
    for i in {0..20}
    do
	y=$(( $y + 1 ))
	tput cup $y $x
	printf "\e[38;5;75m│%-$(( ${#box_top} - 2 ))s│\e[0m"
    done
    y=$(( $y + 1 ))
    tput cup $y $x
    echo -e "\e[38;5;75m└──────────────────────────────────────────────────────────────────────────────────────┘\e[0m"
}

resum()
{
    box_top="┌───────────┤ FINAL POSITION ├───────────┐"
    x=$(( ( ($cols / 2) + ((${#box_top} / 2) + 33)  ) ))
    y=$(( ( ($rows / 2) - 6 ) ))
    tput cup $y $x
    printf "%-12s\e[38;5;75m┌────────────────╮\e[0m"
    y=$(( ($y + 1) ))
    tput cup $y $x
    echo -e "\e[38;5;75m┌───────────┤ \e[1;38;5;220mFINAL POSITION \e[0;38;5;75m├───────────┐\e[0m"
    y=$(( ($y + 1) ))
    tput cup $y $x
    printf "\e[38;5;75m│%-11s\e[38;5;75m└────────────────┘           │\e[0m"
    for i in {0..20}
    do
	y=$(( $y + 1 ))
	tput cup $y $x
	printf "\e[38;5;75m│%-$(( ${#box_top} - 2 ))s│\e[0m"
    done
    y=$(( $y + 1 ))
    tput cup $y $x
    echo -e "\e[38;5;75m└────────────────────────────────────────┘\e[0m"
}

#	5.0
#======================================================================================================================================================================================================================================
#														SETVALUE

setbtcvalue()
{
    box_top="╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮"
    btcprice=$crypto
    getbtcMA
    getlowcrypto
    getuppercrypto
    change24h=$Cryptomoy
    change1h=$lowCrypto
    market_cap=$upCrypto
    x=$(( (($cols / 2) - (((${#box_top} / 3) + ((${#box_top}/7)) - 22))  )))
    y=10
    tput cup $y $x
    echo -e "\e[38;5;214m${btcprice}\e[0m"
    y=12
    tput cup $y $x
    if [[ $change24h == *"-"* ]]
    then
	echo -e "\e[1;91m${change24h}\e[0m"
    else
	echo -e "\e[1;92m${change24h}\e[0m"
    fi
    y=14
    tput cup $y $x
    if [[ $change1h == *"-"* ]]
    then
	echo -e "\e[1;91m${change1h}\e[0m"
    else
	echo -e "\e[1;92m${change1h}\e[0m"
    fi
    y=16
    tput cup $y $x
    echo -e "\e[38;5;214m${market_cap}\e[0m"
}

setethvalue()
{
    box_top="┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
    ethprice=$raw
    getrawMA
    getlowraw
    getupperraw
    change24h=$Rawmoy
    change1h=$lowRaw
    market_cap=$upRaw
    x=$(( (($cols / 2) - (((${#box_top} / 3) + ((${#box_top}/11)) - 39))  )))
    y=10
    tput cup $y $x
    echo -e "\e[38;5;214m${ethprice}\e[0m"
    y=12
    tput cup $y $x
    if [[ $change24h == *"-"* ]]
    then
	echo -e "\e[1;91m${change24h}\e[0m"
    else
	echo -e "\e[1;92m${change24h}\e[0m"
    fi
    y=14
    tput cup $y $x
    if [[ $change1h == *"-"* ]]
    then
	echo -e "\e[1;91m${change1h}\e[0m"
    else
	echo -e "\e[1;92m${change1h}\e[0m"
    fi
    y=16
    tput cup $y $x
    echo -e "\e[38;5;214m${market_cap}\e[0m"
}

setxrpvalue()
{
    box_top="┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
    xrpprice=$stock
    getstockMA
    getlowstock
    getupperstock

    change24h=$Stockmoy
    change1h=$lowStock
    market_cap=$upStock
    x=$(( (($cols / 2) - (((${#box_top} / 3) + ((${#box_top}/11)) - 63))  )))
    y=10
    tput cup $y $x
    echo -e "\e[38;5;214m${xrpprice}\e[0m"
    y=12
    tput cup $y $x
    if [[ $change24h == *"-"* ]]
    then
	echo -e "\e[1;91m${change24h}\e[0m"
    else
	echo -e "\e[1;92m${change24h}\e[0m"
    fi
    y=14
    tput cup $y $x
    if [[ $change1h == *"-"* ]]
    then
	echo -e "\e[1;91m${change1h}\e[0m"
    else
	echo -e "\e[1;92m${change1h}\e[0m"
    fi
    y=16
    tput cup $y $x
    echo -e "\e[38;5;214m${market_cap}\e[0m"
}

setbchvalue()
{
    box_top="┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
    bchprice=$forex
    getforexMA
    getlowforex
    getupperforex

    change24h=$Forexmoy
    change1h=$lowForex
    market_cap=$upForex
    x=$(( ( ($cols / 2) - ((${#box_top} / 3) - 74)  ) ))
    y=10
    tput cup $y $x
    echo -e "\e[38;5;214m${bchprice}\e[0m"
    y=12
    tput cup $y $x
    if [[ $change24h == *"-"* ]]
    then
	echo -e "\e[1;91m${change24h}\e[0m"
    else
	echo -e "\e[1;92m${change24h}\e[0m"
    fi
    y=14
    tput cup $y $x
    if [[ $change1h == *"-"* ]]
    then
	echo -e "\e[1;91m${change1h}\e[0m"
    else
	echo -e "\e[1;92m${change1h}\e[0m"
    fi
    y=16
    tput cup $y $x
    echo -e "\e[38;5;214m${market_cap}\e[0m"
}

setltcvalue()
{
    box_top="┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
    ltcprice=$forex
    change24h="????"
    change1h="????"
    market_cap="????"
    x=$(( ( ($cols / 2) - ((${#box_top} / 3) - 98)  ) ))
    y=10
    tput cup $y $x
    echo -e "\e[38;5;214m${ltcprice}\e[0m"
    y=12
    tput cup $y $x
    if [[ $change24h == *"-"* ]]
    then
	echo -e "\e[1;91m${change24h}\e[0m"
    else
	echo -e "\e[1;92m${change24h}\e[0m"
    fi
    y=14
    tput cup $y $x
    if [[ $change1h == *"-"* ]]
    then
	echo -e "\e[1;91m${change1h}\e[0m"
    else
	echo -e "\e[1;92m${change1h}\e[0m"
    fi
    y=16
    tput cup $y $x
    echo -e "\e[38;5;214m${market_cap}\e[0m"
}

msgcrypto()
{
    tput cup $sy $sx
    echo -e "\e[0;92mBought\e[0m $buyCR\e[0;38;5;220m crypto\e[0m at \e[0m$crypto\e[0m"
    echo -e "Bought $buyCR crypto at $crypto." >> log.buy
    echo -e "Bought $buyCR crypto at $crypto." >> log
    sy=`echo "$sy + 1" | bc -l`
    if [ $sy -eq 46 ]
    then
        sy=$(( ( ($rows / 2) - 4 ) ))
    fi
    tput cup $sy $sx
    echo -e "                                                                     "
}

msgraw()
{
    tput cup $sy $sx
    echo -e "\e[0;92mBought\e[0m $buyRA\e[0;38;5;220m raw\e[0m at \e[0m$raw\e[0m"
    echo -e "Bought $buyRA raw at $raw" >> log.buy
    echo -e "Bought $buyRA raw at $raw" >> log
    sy=`echo "$sy + 1" | bc -l`
    if [ $sy -eq 46 ]
    then
        sy=$(( ( ($rows / 2) - 4 ) ))
    fi
    tput cup $sy $sx
    echo -e "                                                                     "
}

msgstock()
{
    tput cup $sy $sx
    echo -e "\e[0;92mBought\e[0m $buyST\e[0;38;5;220m stock\e[0m at \e[0m$stock\e[0m"
    echo -e "Bought $buyST stock at $stock" >> log.buy
    echo -e "Bought $buyST stock at $stock" >> log
    sy=`echo "$sy + 1" | bc -l`
    if [ $sy -eq 46 ]
    then
         sy=$(( ( ($rows / 2) - 4 ) ))
    fi
    tput cup $sy $sx
    echo -e "                                                                     "
}

msgforex()
{
    tput cup $sy $sx
    echo -e "\e[0;92mBought\e[0m $buyFO\e[0;38;5;220m forex\e[0m at \e[0m$forex\e[0m"
    echo -e "Bought $buyFO forex at $forex" >> log.buy
    echo -e "Bought $buyFO forex at $forex" >> log
    sy=`echo "$sy + 1" | bc -l`
    if [ $sy -eq 46 ]
    then
        sy=$(( ( ($rows / 2) - 4 ) ))
    fi
    tput cup $sy $sx
    echo -e "                                                                     "
}

msgsellcrypto()
{
    tput cup $sy $sx
    echo -e "\e[0;91mSold\e[0m $sellCR\e[0;38;5;220m crypto\e[0m at \e[0m$crypto\e[0m"
    echo -e "Sold $sellCR crypto at $crypto." >> log.sell
    echo -e "Sold $sellCR crypto at $crypto." >> log
    sy=`echo "$sy + 1" | bc -l`
    if [ $sy -eq 46 ]
    then
        sy=$(( ( ($rows / 2) - 4 ) ))
    fi
    tput cup $sy $sx
    echo -e "                                                                     "
}

msgsellraw()
{
    tput cup $sy $sx
    echo -e "\e[0;91mSold\e[0m $buyRA\e[0;38;5;220m raw\e[0m at \e[0m$raw\e[0m"
    echo -e "Sold $sellRA raw at $raw" >> log.sell
    echo -e "Sold $sellRA raw at $raw" >> log
    sy=`echo "$sy + 1" | bc -l`
    if [ $sy -eq 46 ]
    then
        sy=$(( ( ($rows / 2) - 4 ) ))
    fi
    tput cup $sy $sx
    echo -e "                                                                     "
}

msgsellstock()
{
    tput cup $sy $sx
    echo -e "\e[0;91mSold\e[0m $sellST\e[0;38;5;220m stock\e[0m at \e[0m$stock\e[0m"
    echo -e "Sold $sellST stock at $stock" >> log.sell
    echo -e "Sold $sellST stock at $stock" >> log
    sy=`echo "$sy + 1" | bc -l`
    if [ $sy -eq 46 ]
    then
         sy=$(( ( ($rows / 2) - 4 ) ))
    fi
    tput cup $sy $sx
    echo -e "                                                                     "
}

msgsellforex()
{
    tput cup $sy $sx
    echo -e "\e[0;91mSold\e[0m $sellFO\e[0;38;5;220m forex\e[0m at \e[0m$forex\e[0m"
    echo -e "Sold $sellFO forex at $forex" >> log.sell
    echo -e "Sold $sellFO forex at $forex" >> log
    sy=`echo "$sy + 1" | bc -l`
    if [ $sy -eq 46 ]
    then
        sy=$(( ( ($rows / 2) - 4 ) ))
    fi
    tput cup $sy $sx
    echo -e "                                                                     "
}

#	6.0
#======================================================================================================================================================================================================================================
#														BOT ACTION

value()
{
    listen
    setbtcvalue
    setethvalue
    setxrpvalue
    setbchvalue
#    setltcvalue
}

listen()
{
    read crypto
    crypto=${crypto#*:}
    arrCrypto+=($crypto)
    read raw
    raw=${raw#*:}
    arrRaw+=($raw)
    read stock
    stock=${stock#*:}
    arrStock+=($stock)
    read forex
    forex=${forex#*:}
    arrForex+=($forex)
}

InitBot()
{
    hehe=0
}

botCrypto()
{
    low=`echo "$lowCrypto * 1.13" | bc -l`
    iif=`echo $crypto "<=" $low | bc -l`
    aif=`echo "$crypto >= ($upCrypto * 0.95) && $btc_ > 0" | bc -l`
    if [ $iif -eq 1 ] && [ $aif -eq 1 ]
    then
        return 1
    fi
    if [ $iif -eq 1 ]
    then
	    amountcrypto=`echo "$amountcrypto + 1" | bc -l`
	    tmp=`echo "(($eur_ - ($eur_ * 0.2)) >= 0) && (($eur_ - ($eur_ * 0.2)) >= 0.10) && (($eur_ * 0.2) >= 0.10)" | bc -l`
	    if [ $tmp -eq 1 ]
	    then
	        buyCR=`echo "($eur_ * 0.2) / $crypto" | bc -l`
    	    eur_=`echo "$eur_ - ($eur_ * 0.2)" | bc -l`
    	    btc_=`echo "$btc_ + $buyCR" | bc -l`
    	    msgcrypto
        fi
    fi
    if [ $aif -eq 1 ]
    then
        amountcrypto=`echo "$amountcrypto - ($amountcrypto * 0.90)" | bc -l`
        tmp=`echo "$btc_ - ($btc_ * 0.90) >= 0.0000010" | bc -l`
        if [ $tmp -eq 1 ]
        then
            sellCR=`echo "($btc_ * 0.90) * $crypto" | bc -l`
            eur_=`echo "$eur_ + $sellCR" | bc -l`
            btc_=`echo "$btc_ - ($btc_ * 0.90)" | bc -l`
    	    msgsellcrypto
        fi
    fi
}

botRaw()
{
    #low=`echo "$lowRaw * 1.13" | bc -l`
    #iif=`echo $raw "<=" $low | bc -l`
    iif=0
    aif=`echo "$raw >= ($upRaw * 0.95) && $raw_ > 0" | bc -l`
    if [ $iif -eq 1 ] && [ $aif -eq 1 ]
    then
        return 1
    fi
    if [ $iif -eq 1 ]
    then
 	    amountraw=`echo "$amountraw + 1" | bc -l`
  	    tmp=`echo "(($eur_ - ($eur_ * 0.2)) >= 0) && (($eur_ - ($eur_ * 0.2)) >= 0.10) && (($eur_ * 0.2) >= 0.10)" | bc -l`
   	    if [ $tmp -eq 1 ]
   	    then
   	        buyRA=`echo "($eur_ * 0.2) / $raw" | bc -l`
       	    eur_=`echo "$eur_ - ($eur_ * 0.2)" | bc -l`
       	    raw_=`echo "$raw_ + $buyRA" | bc -l`
       	    msgraw
        fi
    fi
    if [ $aif -eq 1 ]
    then
        amountraw=`echo "$amountraw - ($amountraw * 0.90)" | bc -l`
        tmp=`echo "$raw_ - ($raw_ * 0.90) >= 0.0000010" | bc -l`
        if [ $tmp -eq 1 ]
        then
            sellRA=`echo "($raw_ * 0.90) * $raw" | bc -l`
            eur_=`echo "$eur_ + $sellRA" | bc -l`
            raw_=`echo "$raw_ - ($raw_ * 0.90)" | bc -l`
       	    msgsellraw
        fi
    fi
}

botStock()
{
    low=`echo "$lowStock * 1.13" | bc -l`
    iif=`echo "$stock <= $low" | bc -l`
    aif=`echo "$stock >= ($upStock * 0.95) && $stock_ > 0" | bc -l`
    if [ $iif -eq 1 ] && [ $aif -eq 1 ]
    then
        return 1
    fi
    if [ $iif -eq 1 ]
    then
 	    amountstock=`echo "$amountstock + 1" | bc -l`
  	    tmp=`echo "(($eur_ - ($eur_ * 0.2)) >= 0) && (($eur_ - ($eur_ * 0.2)) >= 0.10) && (($eur_ * 0.2) >= 0.10)" | bc -l`
   	    if [ $tmp -eq 1 ]
   	    then
   	        buyST=`echo "($eur_ * 0.2) / $stock" | bc -l`
       	    eur_=`echo "$eur_ - ($eur_ * 0.2)" | bc -l`
       	    stock_=`echo "$stock_ + $buyST" | bc -l`
       	    msgstock
        fi
    fi
    if [ $aif -eq 1 ]
    then
        amountstock=`echo "$amountstock - ($amountstock * 0.90)" | bc -l`
        tmp=`echo "$stock_ - ($stock_ * 0.90) >= 0.0000010" | bc -l`
        if [ $tmp -eq 1 ]
        then
            sellST=`echo "($stock_ * 0.90) * $stock" | bc -l`
            #echo $sellST
            eur_=`echo "$eur_ + $sellST" | bc -l`
            stock_=`echo "$stock_ - ($stock_ * 0.90)" | bc -l`
            msgsellstock
        fi
    fi
}

botForex()
{
    low=`echo "$lowForex * 1.20" | bc -l`
    iif=`echo "$forex <= $low" | bc -l`
    aif=`echo "$forex >= ($upForex * 0.99) && $forex_ > 0" | bc -l`
    if [ $iif -eq 1 ] && [ $aif -eq 1 ]
    then
        tmp=`echo "$forex_ > 0" | bc -l`
        if [ $tmp -eq 1 ]
        then
            sellFO=`echo "$forex_ * $forex" | bc -l`
            eur_=`echo "$eur_ + $sellFO" | bc -l`
            forex_=0
            msgsellforex
        fi
        return 1
    fi
    if [ $iif -eq 1 ]
    then
 	    amountforex=`echo "$amountforex + 1" | bc -l`
  	    tmp=`echo "(($eur_ - ($eur_ * 0.2)) >= 0) && (($eur_ - ($eur_ * 0.2)) >= 0.10) && (($eur_ * 0.2) >= 0.10)" | bc -l`
   	    if [ $tmp -eq 1 ]
   	    then
   	        buyFO=`echo "($eur_ * 0.2) / $forex" | bc -l`
       	    eur_=`echo "$eur_ - ($eur_ * 0.2)" | bc -l`
       	    forex_=`echo "$forex_ + $buyFO" | bc -l`
            msgforex
        fi
    fi
    if [ $aif -eq 1 ]
    then
        amountforex=`echo "$amountforex - ($amountforex * 0.90)" | bc -l`
        tmp=`echo "$forex_ - ($forex_ * 0.90) >= 0.0000010" | bc -l`
        if [ $tmp -eq 1 ]
        then
           sellFO=`echo "($forex_ * 0.90) * $forex" | bc -l`
           eur_=`echo "$eur_ + $sellFO" | bc -l`
           forex_=`echo "$forex_ - ($forex_ * 0.90)" | bc -l`
           msgsellforex
        fi
    fi
}

allprice()
{
    tmp=`echo "scale=5; ($forex_ * $forex + $btc_ * $crypto + $raw_ * $raw + $stock_ * $stock) / 1" | bc -l`
    x=$(( ( ($cols / 2) + 60) ))
    y=$(( ( ($rows / 2) + 10) ))
    tput cup $y $x
    echo "                                "
    tput cup $y $x
    printf "Total : \e[0;92m$tmp\e[0m €\e[0m"

}

bot()
{
    botCrypto
    botRaw
    botStock
    botForex
    allprice
}

#======================================================================================================================================================================================================================================
#														CALCULS MOY

getbtcMA()
{
    moy=0
    index=0
    for index in ${!arrCrypto[@]}
    do
	moy=`echo "$moy + ${arrCrypto[index]}" | bc -l`
    done
    if [ $index -ne 0 ]
    then
	Cryptomoy=`echo "scale=5; $moy / $index" | bc -l`
    else
	Cryptomoy="???"
    fi
}

getrawMA()
{
    moy=0
    index=0
    for index in ${!arrRaw[@]}
    do
	moy=`echo "$moy + ${arrRaw[index]}" | bc -l`
    done
    if [ $index -ne 0 ]
    then
	Rawmoy=`echo "scale=5; $moy / $index" | bc -l`
    else
	Rawmoy="???"
    fi
}

getstockMA()
{
    moy=0
    index=0
    for index in ${!arrStock[@]}
    do
	moy=`echo "$moy + ${arrStock[index]}" | bc -l`
    done
    if [ $index -ne 0 ]
    then
	Stockmoy=`echo "scale=5; $moy / $index" | bc -l`
    else
	Stockmoy="???"
    fi
}

getforexMA()
{
    moy=0
    index=0
    for index in ${!arrForex[@]}
    do
	moy=`echo "$moy + ${arrForex[index]}" | bc -l`
    done
    if [ $index -ne 0 ]
    then
	Forexmoy=`echo "scale=5; $moy / $index" | bc -l`
    else
	Forexmoy="???"
    fi
}

#======================================================================================================================================================================================================================================

getcryptoAverage()
{
    standardDeviation=$( echo "${arrCrypto[@]}" | tr " " "\n" | awk '{sum+=$1; sumsq+=$1*$1}END{print sqrt(sumsq/NR - (sum/NR)**2)}' )
}

getrawAverage()
{
    standardDeviation=$( echo "${arrRaw[@]}" | tr " " "\n" | awk '{sum+=$1; sumsq+=$1*$1}END{print sqrt(sumsq/NR - (sum/NR)**2)}' )
}

getstockAverage()
{
    standardDeviation=$( echo "${arrStock[@]}" | tr " " "\n" | awk '{sum+=$1; sumsq+=$1*$1}END{print sqrt(sumsq/NR - (sum/NR)**2)}' )
}

getforexAverage()
{
    standardDeviation=$( echo "${arrForex[@]}" | tr " " "\n" | awk '{sum+=$1; sumsq+=$1*$1}END{print sqrt(sumsq/NR - (sum/NR)**2)}' )
}


getlowcrypto()
{
    getcryptoAverage
    if [ $index -ne 0 ]
    then
	lowCrypto=`echo "$Cryptomoy - ($standardDeviation * 2)" | bc -l`
    else
	lowCrypto="???"
    fi
}

getuppercrypto()
{
    getcryptoAverage
    if [ $index -ne 0 ]
    then
	upCrypto=`echo "$Cryptomoy + ($standardDeviation * 2)" | bc -l`
    else
	upCrypto="???"
    fi
}

getlowraw()
{
    getrawAverage 
    if [ $index -ne 0 ]
    then
	lowRaw=`echo "$Rawmoy - ($standardDeviation * 2)" | bc -l`
    else
	lowRaw="???"
    fi
}

getupperraw()
{
    getrawAverage
    if [ $index -ne 0 ]
    then
	upRaw=`echo "$Rawmoy + ($standardDeviation * 2)" | bc -l`
    else
	upRaw="???"
    fi
}

getlowstock()
{
    getstockAverage 
    if [ $index -ne 0 ]
    then
	lowStock=`echo "$Stockmoy - ($standardDeviation * 2)" | bc -l`
    else
	lowStock="???"
    fi
}

getupperstock()
{
    getstockAverage
    if [ $index -ne 0 ]
    then
	upStock=`echo "$Stockmoy + ($standardDeviation * 2)" | bc -l`
    else
	upStock="???"
    fi
}

getlowforex()
{
    getforexAverage 
    if [ $index -ne 0 ]
    then
	lowForex=`echo "$Forexmoy - ($standardDeviation * 2)" | bc -l`
    else
	lowForex="???"
    fi
}

getupperforex()
{
    getforexAverage
    if [ $index -ne 0 ]
    then
	upForex=`echo "$Forexmoy + ($standardDeviation * 2)" | bc -l`
    else
	upForex="???"
    fi
}

#======================================================================================================================================================================================================================================

run()
{
    statubar
    banq
    runtime
    currplacement
    placename
    resum
    botaction

    value
    old=$SECONDS
    botact=0
    while true;
    do
	    current=$(( $SECONDS - $old ))
	    if [ $current -gt 2 ]
	    then
    	    value
    	    old=$current
    	    botact=$(( $botact + 1))
    	fi
    	if [ $botact -ge 10 ]
    	then
    	    bot
    	fi
    	runtime
    	currplacement
    	banq
        Themsgbox
    done
}

init()
{
    clear
    statubar
    Thelogin
    veriflogin
    if [ $connect == false ]
    then
	txt="Input error. Try again"
	middle=$(( (($rows/2) - 9) ))
	len=$((($cols/2) - (((${#txt})/2) - 1)))
	tput cup $middle $len
	echo -e "\e[1;3;91m\033#6${txt}\e[0m"
	Thewait
	init
    fi
}

arrCrypto=()
arrStock=()
arrRaw=()
arrForex=()

echo "Type your name"
read -u 2 msgname
#setleds -D +caps
init
run
