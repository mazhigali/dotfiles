#!/bin/bash
#сначала надо настроить rclone создать профиль с названием ya
projectName=nnname
sitedirectory=/var/www/www-root/data/www/her.ru
mysqluser=userdb
mysqlpasswd=passdb
dbname=dbname

Y=`date "+%Y"`
M=`date "+%m"`
D=`date "+%d"`

/usr/bin/mysqldump -u $mysqluser -p$mysqlpasswd $dbname > /tmp/$dbname-$D-$M-$Y.sql
/bin/tar -czf /tmp/backupDB-$projectName-$D-$M-$Y.tar.gz /tmp/$dbname-$D-$M-$Y.sql
rclone copy /tmp/backupDB-$projectName-$D-$M-$Y.tar.gz ya:Backup/$projectName
/bin/rm -f /tmp/$dbname-$D-$M-$Y.sql
/bin/rm -f /tmp/backupDB-$projectName-$D-$M-$Y.tar.gz

#задаем пути папок для исключения из архива
IGN="$sitedirectory/upload/*"
IGN2="$sitedirectory/bitrix/cache/*"
IGN3="$sitedirectory/bitrix/managed_cache/*"
IGN4="$sitedirectory/bitrix/html_pages/*"
IGN5="$sitedirectory/bitrix/backup/*"

/bin/tar -czf /tmp/backupFiles-$projectName-$D-$M-$Y.tar.gz --exclude="$IGN" --exclude="$IGN2" --exclude="$IGN3" --exclude="$IGN4" --exclude="$IGN5" $sitedirectory
rclone copy /tmp/backupFiles-$projectName-$D-$M-$Y.tar.gz ya:Backup/$projectName
/bin/rm -f /tmp/backupFiles-$projectName-$D-$M-$Y.tar.gz

#для теста
#echo "--exclude='$sitedirectory/upload/*' "
