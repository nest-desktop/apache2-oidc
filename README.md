# apache2-oidc

This project contains apache2 configuration that makes apps available to users on EBRAINS infrastructure.
To visit the app user has to authenticate via OpenID connect (oidc).
But you have to create OIDC client first (See steps below).

### Steps to create OIDC client for the community app.

For detailed guide about community app in the collaboratory, please visit the page
(<https://wiki.ebrains.eu/bin/view/Collabs/collaboratory-community-apps>).

Requirements
  - curl

The current workspace is `./collab2-oidc`.

#### 1. Fetch developer access token

Execute
```
  bash get-dev-token.sh
```

#### 2. Change configuration and create client

Change data in `collab2-oidc/app-client.json` or use another json file.
Then execute
```
  bash create-client.sh
```

**Important**:
You should save client secret (`secret`) secretely.
The client registration access token (`registrationAccessToken`) will be needed for modifying clients.

#### 3. Fetch registration access token

The client registration access token can be requested only if `serviceAccountsEnabled=True`.

First execute
```
  bash get-client-token.sh
```

Then execute
```
  bash modify-client.sh
```

### Useful Links

Tutorial about the migration in the Drive of the above collab
(<https://wiki.ebrains.eu/bin/view/Collabs/collaboratory-migration/Tutorial/Migrate%20OIDC%20Client/>).

All the availables url for OIDC 2
(<https://iam.ebrains.eu/auth/realms/hbp/.well-known/uma2-configuration>)
