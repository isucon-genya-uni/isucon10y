#!/bin/bash
set -eu

SERVICE=isuumo.go
NOW=`date +"%H-%M-%S"`
NGINX_LOG_PATH=/var/log/nginx/access.log
MYSQL_LOG_PATH=/tmp/slow.log
FGPROF_PATH=/tmp/fgprof
PROFILE_PATH=/tmp/profile
TRACE_PATH=/tmp/trace

if ssh isucon@$HOST "sudo mv $NGINX_LOG_PATH $NGINX_LOG_PATH.$NOW"; [ $? -eq 255 ]
then 
  echo "no nginx log found"
fi

if ssh isucon@$HOST "sudo mv $MYSQL_LOG_PATH $MYSQL_LOG_PATH.$NOW"; [ $? -eq 255 ]
then 
  echo "no mysql log found"
fi

if ssh isucon@$HOST "sudo mv $FGPROF_PATH $FGPROF_PATH.$NOW"; [ $? -eq 255 ]
then 
  echo "no $FGPROF_PATH found"
fi

if ssh isucon@$HOST "sudo mv $PROFILE_PATH $PROFILE_PATH.$NOW"; [ $? -eq 255 ]
then 
  echo "no $PROFILE_PATH found"
fi

if ssh isucon@$HOST "sudo mv $TRACE_PATH $TRACE_PATH.$NOW"; [ $? -eq 255 ]
then 
  echo "no $TRACE_PATH found"
fi

ssh isucon@$HOST 'sudo systemctl restart nginx'
echo "[DONE] sudo systemctl restart nginx"
ssh isucon@$HOST "sudo systemctl restart $SERVICE"
echo "[DONE] sudo systemctl restart $SERVICE"
