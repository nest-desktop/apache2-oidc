if [ -z "${clb_reg_token}" ];
then
  # Gather registration access token
  read -p 'Enter registration access token: ' clb_reg_token
  echo ''
fi

# Update the client. Note that the client ID appears both in the endpoint URL and in the body of the request.
curl -s -X PUT https://iam.ebrains.eu/auth/realms/hbp/clients-registrations/default/${clb_client_id} \
  -H "Authorization: Bearer ${clb_reg_token}" \
  -H 'Content-Type: application/json' \
  -d '{
        "clientId": "'${clb_client_id}'",
        "serviceAccountsEnabled": true,
        "redirectUris": [
            "/relative/redirect/path",
            "/these/can/use/wildcards/*",
            "/redirect_uri"
        ]
    }' |

# Pretty print the JSON response
json_pp;
