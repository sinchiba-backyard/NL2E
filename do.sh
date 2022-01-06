#!/bin/sh
CWD=`pwd`
DIR_NAME=`basename $CWD | tr A-Z a-z`
DOCKER_ID=${DIR_NAME}_mysql_1
NL2E_DOCKER_ID=${DIR_NAME}_nl2e_1
IP_ADDR=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $DOCKER_ID`

cat << JGEIL > do_init.sh
grep mysql /etc/hosts > /dev/null
if [ \$? -eq 1 ]; then
    echo $IP_ADDR mysql >> /etc/hosts
fi
if [ -e mysql.txt ]; then
    mysql --host $IP_ADDR -u root -pkhcoder < mysql.txt
    rm mysql.txt
fi
cd /KHCoder/khcoder
/usr/bin/perl ./kh_coder.pl
JGEIL

chmod +x do_init.sh
docker cp coder.ini $NL2E_DOCKER_ID:/KHCoder/khcoder/config/
docker cp do_init.sh $NL2E_DOCKER_ID:/
docker cp mysql.txt $NL2E_DOCKER_ID:/
docker exec -it $NL2E_DOCKER_ID /bin/bash /do_init.sh

mv do_init.sh _do_init.sh
