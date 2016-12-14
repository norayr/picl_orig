#set -x

urls=`cat list.txt`

remote_files=""
local_files=""

for i in $urls
do
  file=`echo "${i##*/}"`
  remote_files="$remote_files $file"
  
  file="${file%.*}"
  local_files="$local_files $file"
done

echo $urls
echo $remote_files
echo $local_files


