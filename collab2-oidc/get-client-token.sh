if [ -z "${clb_client_id}" ];
then
  # Gather client id
  read -p 'Enter client id: ' clb_client_id
fi

if [ -z "${clb_client_secret}" ];
then
  # Gather client secret
  read -p 'Enter client secret: ' clb_client_secret
fi
echo ''

# Request to get an access token
curl -s -X POST https://iam.ebrains.eu/auth/realms/hbp/protocol/openid-connect/token \
     -d 'grant_type=client_credentials&scope=email%20profile%20team%20group%20clb.wiki.read%20clb.wiki.write' \
     --data-urlencode "client_id=${clb_client_id}" \
     --data-urlencode "client_secret=${clb_client_secret}" |

# Pretty print the JSON response
json_pp;
