#!/bin/bash
# service name and namespace
service_name=$1
# all env variables with this prefix will be included into the yaml
secret_prefix=$2

# Generate the header
echo "apiVersion: v1"
echo "kind: Secret"
echo "metadata:"
echo "  name    : $service_name"
echo "  namespace: $service_name"
echo "data:"
# iterate through all env variables
while IFS='=' read -r -d '' n v; do
    if [[ $n == $secret_prefix* ]]
    # env variable name starts with prefix
    then
        # encode the value
        b=$(echo -n $v | base64 -w0)
        # remove the prefix from the variable
        k=$(sed "s/^${secret_prefix}//g" <<< "$n")
        printf "  %s: '%s'\n" "$k" "$b"
    fi
done < <(env -0)
