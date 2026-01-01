## Create a Bucket

aws s3 mb s3://bucket-policy-ex-bn-1101

##

aws s3api put-bucket-policy --bucket bucket-policy-ex-bn-1101 --policy file://policy.json

# Bucket owner granting cross-account bucket permissions
