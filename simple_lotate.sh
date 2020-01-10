#/bin/bash
# 
# 更新日順にローテート
#
# 引数1 対象ディレクトリ
# 引数2 ローテート数

dir=$1
locateCount=$2

fileCount=`ls $dir | wc -l`

# 規定ファイル以内ならReturn
if [ $locateCount -ge $fileCount ] ; then 
  echo "not rotate"
  exit 0
fi

# 対象ファイルを取得
targetFile=`ls -tr ${dir}* | awk 'NR == 1'`

echo "削除対象 : $targetFile"
rm $targetFile
echo "削除しました。"

