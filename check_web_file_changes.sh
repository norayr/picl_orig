#set -x

urls=`cat list.txt`
files=""
for i in $urllist
do
file=`echo "${i##*/}"`
files="$files $i"
done


