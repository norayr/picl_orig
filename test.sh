#set -x
picl="PICL.Mod"
pics="PICS.Mod"
picl_url="https://www.inf.ethz.ch/personal/wirth/PICL/Sources/PICL.Mod.txt"
pics_url="https://www.inf.ethz.ch/personal/wirth/PICL/Sources/PICS.Mod.txt"

if [ -f "${picl}.txt" ]
then
 rm -f "${picl}.txt"
fi

if [ -f "${pics}.txt" ]
then
 rm -f "${pics}.txt"
fi


wget  $picl_url
wget $pics_url

picl_md5=`md5sum ${picl}.txt | awk '{print $1}'`
pics_md5=`md5sum ${pics}.txt | awk '{print $1}'`

old_picl_md5=`md5sum $picl | awk '{print $1}'`
old_pics_md5=`md5sum $pics | awk '{print $1}'`

printf "%-15s | %-35s |\n" "$picl" "$old_picl_md5"
printf "%-15s | %-35s |\n" "${picl}.txt" "$picl_md5"

printf "%-15s | %-35s |\n" "$pics" "$old_pics_md5"
printf "%-15s | %-35s |\n" "${pics}.txt" "$pics_md5"

echo ""

if [[ "$picl_md5" != "$old_picl_md5" ]]
then
 echo "$picl changed"
 diff $picl ${picl}.txt
else
 echo "$picl unchanged"
fi

if [[ "$pics_md5" != "$old_pics_md5" ]]
then
 echo "$pics changed"
 diff $pics ${pics}.txt
else
  echo "$pics unchanged"
fi


