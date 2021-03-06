#!/bin/bash

# script is to delete snapshots in bulk

#retrieving snapshot IDs under an account
accountID=648818476623  # Be sure to put your aws account ID here!!!

#how many of the oldest snapshots you would like to delete
count=4 

# a file is created under current directory and holds snapshotIds
file=snapshotIds.txt  

#following filters the oldest snapshot and writes into the $file
aws ec2 describe-snapshots --owner-ids $accountID | grep SnapshotId | awk '{print $2}' | sed 's/"//g' | tail -$count >$file

#Following code snippet reads snapshot IDs from the $file and delete one by one, Any error occurs logged in error.log file
while IFS='' read -r line || [[ -n $line ]]; do
    echo "Deleting snapshot --> $line"
    aws ec2 delete-snapshot --snapshot-id $line >>error.log 2>&1
done < $file
