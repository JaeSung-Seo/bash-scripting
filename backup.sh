#!/bin/bash
# This script is aimed to rsync files between  multiple PCs to a remote server.


SERVER="hotshotseo@llnwtest.iptime.org"

LOCAL="/Users/hotshot/Desktop/IELTS/"
REMOTE="/home/hotshotseo/backup/"

LOCAL_TSFILE="/Users/hotshot/.backup_timestamp" # local timestamp file
REMOTE_TSFILE="/home/hotshotseo/.backup_timestamp" # local timestamp file


function confirm {
	echo -n "$1"
	read answer
	if [[ $answer != "y" ]]; then
		echo "exiting"
		exit 0
	fi
}

function backup {
	rsync -n -av --delete $LOCAL ${SERVER}:${REMOTE}
	confirm "Do you want to backup local files?(y/n)"
	rsync -av --delete $LOCAL ${SERVER}:${REMOTE}
	ts_local=$( date +%Y%m%d%H%M%S )
	echo -n $ts_local > $LOCAL_TSFILE
	ssh $SERVER "echo -n $ts_local > $REMOTE_TSFILE "
}

function download {
	rysnc -n -av --delete ${SERVER}:${REMOTE} $LOCAL
	confirm "Do you want to download local files?(y/n)"
	rsync -av --delete ${SERVER}:${REMOTE} $LOCAL
	ts_local=$( date +%Y%m%d%H%M%S )
	echo -n $ts_local > $LOCAL_TSFILE
}

ts_remote=$( ssh $SERVER "cat $REMOTE_TSFILE" )
ts_local=$( cat $LOCAL_TSFILE )

echo " Remote file timestamp: $ts_remote"
echo " Local file timestamp: $ts_local"

echo "=============================================================================================="

if [[ $1 == "backup" ]]; then
	echo "Forcing backup!"
	backup
	exit 0
fi

if [[ $1 == "download" ]]; then
	echo "Forcing downloading!"
	download
	exit 0
fi

if [[ $ts_local -ge $ts_remote ]]; then
	echo " Local files for backup"
	backup
	exit 0
fi

if [[ $ts_local -lt $ts_remote ]]; then
	echo "Remote files for download"
	download
	exit 0
fi
