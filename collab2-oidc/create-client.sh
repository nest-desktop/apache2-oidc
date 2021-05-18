if [ -z "${clb_dev_token}" ];
then
  # Gather your access token
  read -p 'Enter developer access token: ' clb_dev_token
  echo ''
fi

# Send the creation request
curl -s -X POST https://iam.ebrains.eu/auth/realms/hbp/clients-registrations/default/ \
  -H "Authorization: Bearer ${clb_dev_token}" \
  -H 'Content-Type: application/json' \
  -d @clients/app.json |

# Pretty print the JSON response
 json_pp;
