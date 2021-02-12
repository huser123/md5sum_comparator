#!/bin/bash

### md5 összehasonlító 2021.02.12

i=0 # index nullázás
n=0 # index nullázás
m=0 # index nullázás

# fájlista tulajdonságok beolvasása
while read line
do
    fajlok[ $i ]="${line:33}"        # fájlok neveinek beolvasása (a 33. karaktertől)
    fajlokmd[ $i ]="${line:0:32}"    # fájlok md5 összegének beolvasása (az első 32. karakter)    
    (( i++ ))                        # index növelése
done < <(md5sum *)                   # az md5 összegek generálása

    #echo ${fajlokmd[*]}             # az eddigi működést ellenőrző sor

    elemek=${#fajlokmd[@]}           # az elemszám változóba mentése
    ((elemek--))                     # a változó értékének egyel csökkentése

for n in $(seq 0 $elemek)           # első elemtől az utolsóig
do

    for m in $(seq $elemek -1 $n)   # utolsótól az első elemig
    do
        if [[ $n != $m ]]           # csak akkor, ha a két index nem egyelő
        then
            if [[ ${fajlokmd[$n]} = ${fajlokmd[$m]} ]] # megvizsgálni a két elem relációját
            then
                echo -e "Megegyezik" "\e[1;31m" ${fajlok[$n]} "\e[0m" és "\e[1;31m" ${fajlok[$m]} "\e[0m"  # ha egyezik, akkor jelezni a fájlok nevének kiírásával
            fi
        fi
        done

done