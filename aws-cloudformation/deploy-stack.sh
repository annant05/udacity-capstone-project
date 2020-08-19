aws cloudformation create-stack --stack-name $1 --template-body file://create-vpc.yml  --parameters file://vpc-params.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-east-1
