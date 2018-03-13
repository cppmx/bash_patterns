#!/bin/bash

# Name: is_number
#
# Description: Check if a value is a number or not
#
# Params: It expects one value
#
# Return:
#        0 if param is a number
#        1 Otherwise
function is_number()
{
    result=1
    testValue='^[0-9]+$'

    if [[ $1 =~ $testValue ]]; then
        result=0
    fi

    return $result
}

is_number $1