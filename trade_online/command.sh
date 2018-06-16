#!/bin/sh
## EPITECH PROJECT, 2018
## 
## File description:
## 
##

#terminal
cols=$(tput cols)
rows=$(tput lines)

#profil
connect="false"
msgname=""
eur=10000
usd=0
btc=0
placement="BTC USD OLD ETC"
amount="300 200 600 ETC"
start=$SECONDS

#program

httpGet()
{
    case "$configuredClient" in
	curl)  curl -A curl -s "$@" ;;
	wget)  wget -qO- "$@" ;;
	httpie) http -b GET "$@" ;;
	fetch) fetch -q "$@" ;;
    esac
}


if  command -v curl &>/dev/null; then
    configuredClient="curl"
elif command -v wget &>/dev/null; then
    configuredClient="wget"
elif command -v http &>/dev/null; then
    configuredClient="httpie"
elif command -v fetch &>/dev/null; then
    configuredClient="fetch"
else
    echo "Error: This tool reqires either curl, wget, httpie or fetch to be installed." >&2
    return 1
fi

#echo $amount | grep -Eo "^[0-9]*"


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
    echo -e "\e[1;38;5;220mHours:00:00\e[0m"
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
    read login
    middle=$((($rows/2) - 7))
    lenAscii=$((( (($cols/2) - (${#tmp}/2)))))
    tput cup $middle $lenAscii
    echo -e "\e[1;38;5;123mPASS  :\e[0m"
    middle=$((($rows/2) - 7))
    lenAscii=$((( (($cols/2) + (${#tmp}/2)))))
    tput cup $middle $lenAscii
    echo -en "( •_•)"
    tput cup $middle $lenAscii
    read -s pass
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
    printf "\e[38;5;109m│\e[0m      \e[38;5;113mEUR:      \e[3;38;5;112m%-5s €\e[0m     \e[38;5;109m│\e[0m" ${eur}
    y=10
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-28s\e[38;5;109m│\e[0m"
    y=11
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m      \e[38;5;113mUSD:      \e[3;38;5;112m%-5s $\e[0m     \e[38;5;109m│\e[0m" ${usd}
    y=12
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-28s\e[38;5;109m│\e[0m"
    y=13
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m      \e[38;5;113mBTC:      \e[3;38;5;112m%-5s B\e[0m     \e[38;5;109m│\e[0m" ${btc}
    y=14
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-28s\e[38;5;109m│\e[0m"
    y=15
    tput cup $y $x
    echo -e "\e[38;5;109m└────────────────────────────┘\e[0m"
}

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
    aarray=( $amount )
    while [ $i -ne $nb ]
    do
	tput cup $y $x
	printf "\e[38;5;109m│\e[0m\e[0m      %-19s\e[38;5;109m│\e[0m" "${parray[${i}]}:     ${aarray[${i}]}"
	y=$(( ($y + 1) ))
	i=$(( ($i + 1) ))
    done
    tput cup $y $x
    printf "\e[38;5;109m│\e[0m%-25s\e[38;5;109m│\e[0m"
    y=$(( $y + 1 ))
    tput cup $y $x
    echo -e "\e[38;5;109m└─────────────────────────┘\e[0m"
}

placename()
{
    box_top="┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
    name_bx="                         BTC                     ETH                     XRP                     BCH                     LTC            "
    explcation="PRICE_EUR . CHANGE_24 . CHANGE_1H .  MarketCap"
    array=( $explcation )
    echo $rows
    x=$(( (($cols / 2) - (((${#box_top} / 3) + (${#box_top}/7)))  )))
    y=5
#    tput cup $y $x
 #   echo -e "\e[38;5;109m${box_top}\e[0m"
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
    tput cup $y $x
    printf "\e[38;5;109m%-$(( (${#box_top} - 2) ))s\e[0m"
    for i in {0..10}
    do
	y=$(( ($y + 1) ))
	tput cup $y $x
	printf "\e[38;5;109m%-$(( (${#box_top} - 2) ))s\e[0m" "${array[${i}]}"
	i=$(( ($i + 1) ))
    done
#    tput cup $y $x
#    echo -e "\e[38;5;109m└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘\e[0m"
}

setbtcvalue()
{
    box_top="╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮"
    btcprice=$(httpGet "https://api.coinmarketcap.com/v1/ticker/bitcoin/?convert=eur" | grep -Eo "\"price_eur\": \"[+-]?[0-9 .]*" | sed s/"\"price_eur\": \""//g) > /dev/null
    change24h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/bitcoin/?convert=eur" | grep -Po "\"percent_change_24h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_24h\": \""//g) > /dev/null
    change1h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/bitcoin/?convert=eur" | grep -Po "\"percent_change_1h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_1h\": \""//g) > /dev/null
    market_cap=$(httpGet "https://api.coinmarketcap.com/v1/ticker/bitcoin/?convert=eur" | grep -Eo "\"market_cap_eur\": \"[+-]?[0-9 .]*" | sed s/"\"market_cap_eur\": \""//g) > /dev/null
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
    ethprice=$(httpGet "https://api.coinmarketcap.com/v1/ticker/ethereum/?convert=eur" | grep -Eo "\"price_eur\": \"[+-]?[0-9 .]*" | sed s/"\"price_eur\": \""//g) > /dev/null
    change24h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/ethereum/?convert=eur" | grep -Po "\"percent_change_24h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_24h\": \""//g) > /dev/null
    change1h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/ethereum/?convert=eur" | grep -Po "\"percent_change_1h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_1h\": \""//g) > /dev/null
    market_cap=$(httpGet "https://api.coinmarketcap.com/v1/ticker/ethereum/?convert=eur" | grep -Eo "\"market_cap_eur\": \"[+-]?[0-9 .]*" | sed s/"\"market_cap_eur\": \""//g) > /dev/null
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
    xrpprice=$(httpGet "https://api.coinmarketcap.com/v1/ticker/ripple/?convert=eur" | grep -Eo "\"price_eur\": \"[+-]?[0-9 .]*" | sed s/"\"price_eur\": \""//g) > /dev/null
    change24h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/ripple/?convert=eur" | grep -Po "\"percent_change_24h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_24h\": \""//g) > /dev/null
    change1h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/ripple/?convert=eur" | grep -Po "\"percent_change_1h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_1h\": \""//g) > /dev/null
    market_cap=$(httpGet "https://api.coinmarketcap.com/v1/ticker/ripple/?convert=eur" | grep -Eo "\"market_cap_eur\": \"[+-]?[0-9 .]*" | sed s/"\"market_cap_eur\": \""//g) > /dev/null
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
    bchprice=$(httpGet "https://api.coinmarketcap.com/v1/ticker/bitcoin-cash/?convert=eur" | grep -Eo "\"price_eur\": \"[+-]?[0-9 .]*" | sed s/"\"price_eur\": \""//g) > /dev/null
    change24h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/bitcoin-cash/?convert=eur" | grep -Po "\"percent_change_24h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_24h\": \""//g) > /dev/null
    change1h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/bitcoin-cash/?convert=eur" | grep -Po "\"percent_change_1h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_1h\": \""//g) > /dev/null
    market_cap=$(httpGet "https://api.coinmarketcap.com/v1/ticker/bitcoin-cash/?convert=eur" | grep -Eo "\"market_cap_eur\": \"[+-]?[0-9 .]*" | sed s/"\"market_cap_eur\": \""//g) > /dev/null
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
    ltcprice=$(httpGet "https://api.coinmarketcap.com/v1/ticker/litecoin/?convert=eur" | grep -Eo "\"price_eur\": \"[+-]?[0-9 .]*" | sed s/"\"price_eur\": \""//g) > /dev/null
    change24h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/litecoin/?convert=eur" | grep -Po "\"percent_change_24h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_24h\": \""//g) > /dev/null
    change1h=$(httpGet "https://api.coinmarketcap.com/v1/ticker/litecoin/?convert=eur" | grep -Po "\"percent_change_1h\": \"[+-]?[0-9 .]*" | sed s/"\"percent_change_1h\": \""//g) > /dev/null
    market_cap=$(httpGet "https://api.coinmarketcap.com/v1/ticker/litecoin/?convert=eur" | grep -Eo "\"market_cap_eur\": \"[+-]?[0-9 .]*" | sed s/"\"market_cap_eur\": \""//g) > /dev/null
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

Themsgbox()
{
    size=145
    x=$(( ( ($cols / 2) - (${size} / 2)  ) ))
    y=$(( ( ($rows) - ($rows / 9)) ))
    tput cup $y $x
    printf "\e[38;5;155mYOUR ORDER    ⫷⫶%-${size}s⫶⫸\e[0m"
#    tput cup $y $x
#    read -rsn1 hehe
#    echo $hehe >> test
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

value()
{
    setbtcvalue
    setethvalue
    setxrpvalue
    setbchvalue
    setltcvalue
}
#======================================================================================================================================================================================================================================
#														BOT ACTION

getCurrentTrend()
{
    filetrend=`cat .filtrend $>/dev/null`
    echo filetrend
    exit
}

InitBot()
{
    getCurrentTrend
}

bot()
{
    InitBot
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
    while true;
    do
	current=$(( $SECONDS - $old ))
	if [ $current -gt 30 ]
	then
	    value
	    old=$current
	fi
	runtime
	Themsgbox
#	bot
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

echo "Type your name"
read msgname
#setleds -D +caps
init
run
#bot
