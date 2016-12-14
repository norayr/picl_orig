set -x
picl="PICL.Mod"
pics="PICS.Mod"
picl_url="https://www.inf.ethz.ch/personal/wirth/PICL/Sources/PICL.Mod.txt"
pics_url="https://www.inf.ethz.ch/personal/wirth/PICL/Sources/PICS.Mod.txt"

wget $picl_url
wget $pics_url

picl_md5=`md5sum ${picl}.txt`
pics_md5=`md5sum ${pics}.txt`

echo "$picl $picl_md5"
echo "$pics $pics_md5"

old_picl_md5=`md5sum $picl`
old_pics_md5=`md5sum $pics`

if [ "$picl_md5" != "$old_picl_md5" ]
then
 echo "$picl changed"
 diff $picl ${picl}.txt
else
 echo "$picl unchanged"
fi

if [ "$pics_md5" != "$old_pics_md5" ]
then
 echo "$pics changed"
 diff $pics ${pics}.txt
else
  eche "$pics unchanged"
fi


