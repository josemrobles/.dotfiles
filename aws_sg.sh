#!/bin/sh
usage="awssg profile port"

profile=$1
if [ "" = "$profile" ]; then
        >&2 echo "Missing profilr as first environmet"
        echo $usage
        exit 1
fi

port=$2
if [ "" = "$port" ]; then
        >&2 echo "Missing port as second argument"
        echo $usage
        exit 1
fi

filters="Name=ip-permission.to-port,Values=$port"

aws ec2 describe-security-groups --profile $profile --filters $filters  --query 'SecurityGroups[?length(IpPermissions[?ToPort==`'$port'` && contains(IpRanges[].CidrIp, `0.0.0.0/0`)]) > `0`].{GroupName: GroupName, GroupID: GroupId }' --output table
