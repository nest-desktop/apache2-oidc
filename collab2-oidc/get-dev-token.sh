# Gather username and password from user
read    -p 'Enter your username: ' clb_dev_username
read -s -p 'Enter your password: ' clb_dev_pwd
echo ''

# Fetch the token
curl -s -X POST https://iam.ebrains.eu/auth/realms/hbp/protocol/openid-connect/token \
  -u developer: \
  -d 'grant_type=password' \
  --data-urlencode "username=${clb_dev_username}" \
  --data-urlencode "password=${clb_dev_pwd}" |

# Pretty print the JSON response
json_pp;

# Erase the credentials from local variables
clb_dev_pwd=''; clb_dev_username=''
