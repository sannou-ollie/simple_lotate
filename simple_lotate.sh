#/bin/bash
# 
# 更新日順にローテート
#
# 引数1 対象ファイルパターン
# 引数2 ローテート数

#echo $1
#echo $2
#exit

filePattern=$1
locateCount=$2

fileCount=`ls $filePattern | wc -l`

# 規定ファイル以内ならReturn
if [ $locateCount -ge $fileCount ] ; then 
  echo "not rotate"
  exit 0
fi

# 対象ファイルを取得
targetFile=`ls -tr ${filePattern} | awk 'NR == 1'`

echo "削除対象 : $targetFile"
sudo rm $targetFile
echo "削除しました。"

