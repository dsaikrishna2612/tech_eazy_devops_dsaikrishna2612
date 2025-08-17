#!/bin/bash

BUCKET_NAME="dsk154984795"  # Inject from ENV

if [ -z "$BUCKET_NAME" ]; then
  echo "Bucket name <  >!"
  exit 1
fi

aws s3 cp /var/log/cloud-init.log s3://$BUCKET_NAME/ec2_logs/
aws s3 cp /home/ec2-user/test-repo-for-devops/app.log s3://$BUCKET_NAME/app/logs/

