#!/bin/bash
#  X of X's
#  Copyright (C) 2018 Carlos Colón <espacio.sideral@gmail.com>
#
#  x_of_x is free software: you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by the
#  Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  x_of_x is distributed in the hope that it will be useful, but
#  WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#  See the GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License along
#  with this program.  If not, see <http://www.gnu.org/licenses/>.

if [ ! -f $1 ]; then
    echo Missing Common File
    exit 1
fi

. $1

x_size=-1
while [ $x_size -ne 0 ]; do
    printf "\n\tEnter the size of X (0 to quit): "
    read x_size

    is_number $x_size
    validate=$?

    if [[ $validate -eq 0 ]]; then
        echo " "
        for line in `seq 0 $[x_size - 1]`;
        do
            for column in `seq 0 $[x_size - 1]`;
            do
                if [[ $line -eq $column ]]; then
                    printf "\e[31mX\e[0m"
                elif [[ $column -eq $[x_size - line - 1] ]]; then
                    printf "\e[92mX\e[0m"
                else
                    printf " "
                fi
            done
            printf "\n"
        done
    else
        printf "\t\e[31mPlease type a \e[5mpositive integer value\e[25m\e[0m\n"
    fi
done