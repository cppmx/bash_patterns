#!/bin/bash
#  Pyramid
#  Copyright (C) 2018 Carlos Colón <espacio.sideral@gmail.com>
#
#  pyramid free software: you can redistribute it and/or modify it
#  under the terms of the GNU General Public License as published by the
#  Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  pyramid distributed in the hope that it will be useful, but
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

p_height=-1
while [ $p_height -ne 0 ]; do
    printf "\n\tEnter the height of the pyramid (0 to quit): "
    read p_height

    is_number $p_height
    validate=$?

    if [[ $validate -eq 0 ]]; then
        echo " "
        p_space=$[p_height-1]
        num_stars=1
        for line in `seq 0 $[p_height - 1]`;
        do
            space=$p_space
            while [[ $space -gt $line ]]; do
                printf " "
                let space-=1
            done
            for star in `seq 0 $[num_stars - 1]`;
            do
                printf "\e[31m*\e[0m"
            done
            let num_stars+=2
            printf "\n"
        done
    else
        printf "\t\e[31mPlease type a \e[5mpositive integer value\e[25m\e[0m\n"
    fi
done