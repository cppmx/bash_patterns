#!/bin/bash
#  Bash Pattern
#  Copyright (C) 2018 Carlos Colón <espacio.sideral@gmail.com>
#
#  Bash Pattern is free software: you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by the
#  Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  Bash Pattern is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#  See the GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License along
#  with this program.  If not, see <http://www.gnu.org/licenses/>.

CommonFile=$(pwd)/common.sh

if [ ! -f $CommonFile ]; then
    echo Missing Common File
    exit 1
fi

. $CommonFile

declare -a Options=()
ExitValue=0
SelectedOption=-1

function welcome_banner()
{
    Char1="\e[31m:"
    Char2="\e[33m+"
    Char3="\e[91m#"

    printf "      $Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1      $Char1$Char1$Char1      $Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1  $Char1$Char1$Char1    $Char1$Char1$Char1          $Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1     $Char1$Char1$Char1 $Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1 $Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1 $Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1 $Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1$Char1  $Char1$Char1$Char1$Char1    $Char1$Char1$Char1 \n"
    printf "     $Char1$Char2$Char1    $Char1$Char2$Char1   $Char1$Char2$Char1 $Char1$Char2$Char1   $Char1$Char2$Char1    $Char1$Char2$Char1 $Char1$Char2$Char1    $Char1$Char2$Char1          $Char1$Char2$Char1    $Char1$Char2$Char1  $Char1$Char2$Char1 $Char1$Char2$Char1   $Char1$Char2$Char1         $Char1$Char2$Char1     $Char1$Char2$Char1        $Char1$Char2$Char1    $Char1$Char2$Char1 $Char1$Char2$Char1$Char2$Char1   $Char1$Char2$Char1  \n"
    printf "    $Char2$Char1$Char2    $Char2$Char1$Char2  $Char2$Char1$Char2   $Char2$Char1$Char2  $Char2$Char1$Char2        $Char2$Char1$Char2    $Char2$Char1$Char2          $Char2$Char1$Char2    $Char2$Char1$Char2 $Char2$Char1$Char2   $Char2$Char1$Char2  $Char2$Char1$Char2         $Char2$Char1$Char2     $Char2$Char1$Char2        $Char2$Char1$Char2    $Char2$Char1$Char2 $Char1$Char2$Char1$Char2$Char1$Char2  $Char2$Char1$Char2   \n"
    printf "   $Char2$Char3$Char2$Char2$Char1$Char2$Char2$Char3$Char2  $Char2$Char3$Char2$Char2$Char1$Char2$Char2$Char3$Char2$Char2$Char1 $Char2$Char3$Char2$Char2$Char1$Char2$Char2$Char3$Char2$Char2 $Char2$Char3$Char2$Char2$Char1$Char2$Char2$Char3$Char2$Char2          $Char2$Char3$Char2$Char2$Char1$Char2$Char2$Char3$Char2 $Char2$Char3$Char2$Char2$Char1$Char2$Char2$Char3$Char2$Char2$Char1 $Char2$Char3$Char2         $Char2$Char3$Char2     $Char2$Char3$Char2$Char2$Char1$Char2$Char2$Char3   $Char2$Char3$Char2$Char2$Char1$Char2$Char2$Char3$Char1  $Char2$Char3$Char2 $Char2$Char1$Char2 $Char2$Char3$Char2    \n"
    printf "  $Char2$Char3$Char2    $Char2$Char3$Char2 $Char2$Char3$Char2     $Char2$Char3$Char2        $Char2$Char3$Char2 $Char2$Char3$Char2    $Char2$Char3$Char2          $Char2$Char3$Char2       $Char2$Char3$Char2     $Char2$Char3$Char2 $Char2$Char3$Char2         $Char2$Char3$Char2     $Char2$Char3$Char2        $Char2$Char3$Char2    $Char2$Char3$Char2 $Char2$Char3$Char2  $Char2$Char3$Char2$Char3$Char2$Char3     \n"
    printf " $Char3$Char2$Char3    $Char3$Char2$Char3 $Char3$Char2$Char3     $Char3$Char2$Char3 $Char3$Char2$Char3    $Char3$Char2$Char3 $Char3$Char2$Char3    $Char3$Char2$Char3          $Char3$Char2$Char3       $Char3$Char2$Char3     $Char3$Char2$Char3 $Char3$Char2$Char3         $Char3$Char2$Char3     $Char3$Char2$Char3        $Char3$Char2$Char3    $Char3$Char2$Char3 $Char3$Char2$Char3   $Char3$Char2$Char3$Char2$Char3      \n"
    printf "$Char3$Char3$Char3$Char3$Char3$Char3$Char3$Char3$Char3  $Char3$Char3$Char3     $Char3$Char3$Char3  $Char3$Char3$Char3$Char3$Char3$Char3$Char3$Char3  $Char3$Char3$Char3    $Char3$Char3$Char3          $Char3$Char3$Char3       $Char3$Char3$Char3     $Char3$Char3$Char3 $Char3$Char3$Char3         $Char3$Char3$Char3     $Char3$Char3$Char3$Char3$Char3$Char3$Char3$Char3$Char3$Char3 $Char3$Char3$Char3    $Char3$Char3$Char3 $Char3$Char3$Char3    $Char3$Char3$Char3$Char3       \e[0m\n\n"
}

function bye_banner()
{
    printf "\n\tFinishing ...\n\n"
    printf "\t.------..------..------.\n"
    printf "\t|\e[91mB\e[0m.--. ||\e[97mY\e[0m.--. ||\e[92mE\e[0m.--. |\n"
    printf "\t| :(): || (\/) || (\/) |\n"
    printf "\t| ()() || :\/: || :\/: |\n"
    printf "\t| '--'\e[91mB\e[0m|| '--'\e[97mY\e[0m|| '--'\e[92mE\e[0m|\n"
    printf "\t\`------'\`------'\`------'\n"
}

function list_options()
{
    Counter=1
    printf "\n"
    for i in $(ls -d */);
    do
        printf "\t\e[96m$Counter.- \e[0m${i%%/}\n"
        Options[$[Counter-1]]=${i%%/}
        let Counter+=1
    done
    printf "\t\e[96m$Counter.- \e[0mExit\n"
    ExitValue=$Counter
}

function loop()
{
    while [ $SelectedOption -ne $ExitValue ]; do
        printf "\n\t\e[0mSelect a pattern (0 to list options again): "
        read SelectedOption

        is_number $SelectedOption
        validate=$?

        if [[ $validate -eq 1 ]]; then
            printf "\t\e[31mPlease type a \e[5mpositive integer value\e[25m\e[0m\n"
            SelectedOption=-1
        elif [[ $SelectedOption -eq 0 ]]; then
            list_options
        elif [[ $SelectedOption -gt 0 && $SelectedOption -le ${#Options[@]} ]]; then
            printf "\n\t\e[34mExecuting ${Options[$[SelectedOption - 1]]} \e[0m...\n"
            source ${Options[$[SelectedOption - 1]]}/main.sh $CommonFile
        elif [[ $SelectedOption -ne $ExitValue ]]; then
            printf "\t\e[31mInvalid option, please try again\e[0m\n"
        fi
    done
}

function main()
{
    welcome_banner
    list_options
    loop
    bye_banner
}

main