#!/bin/bash
#
#

get_log() {
    git log --format='%aN' |sort -u |while read name; do 
        #echo -en "$name\t"
        #git log --author="$name" --pretty=tformat: --numstat |awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "add: %s, remove: %s, total: %s\n", add, subs, loc }'
        lines=$(git log --author="$name" --pretty=tformat: --numstat |awk '{add += $1; subs += $2; loc += $1 - $2} END {print add,subs,loc}')
        echo $name $lines
    done
}

printf "%-17s %-14s %-14s %-15s\n" '名字' '增加行数' '减少行数' '统计行数'
get_log |while read name add subs loc; do
    printf "%-15s %-10d %-10d %-10d\n" $name $add $subs $loc
done 

exit 0
