# OpenID Connect implementation for Apache2

This project contains Apache2 template implemented with via OpenID Connect (OIDC)
that can authenticate users on apps in the EBRAINS infrastructure.

But first create OIDC Client
that the client is registered for the OpenID Connect.

### Steps to create OIDC Client.

The guide shows steps how to create OIDC client for an EBRAINS app
You can review and use provided scripts.

Requirements

- curl
- json_pp

#### Preparation

Install `curl` and `json_pp` if not installed:

```
  sudo apt install curl json_pp
```

Then change the directory to collab-oidc:

```
  cd ./collab2-oidc
```

#### 1. Get developer access token

Get the developer access token
after entering `username` and `password` of your EBRAINS account:

```
  bash get-dev-token.sh
```

Use `access_token` to create client.

#### 2. Create client

Change the configuration for the client, e.g. `clients/app.json`.
Then create client with developer `access_token` and a configuration file

```
  bash create-client.sh
```

**Important:**
Keep `clientId`, `secret` and `registrationAccessToken` secretly.

#### 3. Modify client

Use `registrationAccessToken` and `clientId` to modify client:

```
  bash modify-client.sh
```

**Important**
When the client is modify, it generates new `registrationAccessToken`.

#### 4. Get client access token

The client access token can be requested if `serviceAccountsEnabled=True`.

```
  bash get-client-token.sh
```

### Useful Links

EBRAINS tutorials for OpenID Client

- [Tutorial for community apps](https://wiki.ebrains.eu/bin/view/Collabs/collaboratory-community-apps)
- [Available keywords for OpenID Client](https://iam.ebrains.eu/auth/realms/hbp/.well-known/uma2-configuration)
- [Migrate OIDC Client](https://wiki.ebrains.eu/bin/view/Collabs/collaboratory-migration/Tutorial/Migrate%20OIDC%20Client/)

Offical guides

- [Certified OpenID Connect Implementations](https://openid.net/developers/certified/)

Apache2

- [OpenID Connect implementation for Apache2](https://github.com/zmartzone/mod_auth_openidc)
- [Apache2 Plugin for OpenIC Connect](https://www.keycloak.org/docs/latest/securing_apps/index.html#_mod_auth_openidc)

#### Acknowledgements

Thanks for the technical support:

- Fabrice Gallard
- Axel Messinese
- Marc Morgan
