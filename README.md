# Salesforce-sfdx orb [![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/orb-starter-kit.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/CircleCI-Public/orb-starter-kit) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

Install, authenticate with, and utilize the Salesforce sf CLI on CircleCI with ease.

> **Note**
> This orb was updated in September 2023 to use the `sf` cli instead of `sfdx`
> Commands are backwards compatible and you can call them using `sf` or `sfdx`
> More information can be found [here](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_move_to_sf_v2.htm) on the developer.salesforce.com website

## Orb Registry

Read the full automated documentation live on the Orb Registry: https://circleci.com/developer/orbs/orb/circleci/salesforce-sfdx#usage-create_open_delete_scratch

### Prerequisites

1. [Enable Dev Hub](https://help.salesforce.com/s/articleView?id=sf.sfdx_setup_enable_devhub.htm&type=5)
2. [Create a private key with OpenSSL](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_key_and_cert.htm)
3. [Create a connected app](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_connected_app.htm)

**Base64 encode your private key**

Navigate to the directory containing the self signed certificate files you created earlier and enter the following command: `base64 server.key`. Once you have the base64 encoded value, copy it for the next step.

**Add environment variables**

https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project

- `SFDX_JWT_KEY`
  This value must contain the base64 encoded value of the private server.key file.
- `SFDX_CONSUMER_KEY`
  The consumer key of the connected app for salesforce

## Example

```
version: 2.1
  orbs:
    sfdx: circleci/salesforce-sfdx@x.y
  jobs:
    install_authenticate:
      executor: sfdx/default
      steps:
        - checkout
        - sfdx/install
        - sfdx/auth:
            defaultusername: user@email.com
        - run:
            name: Run your SF commands here
            command: |
              echo "You now have access to the sf cli and may execute commands against it. https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference_unified.htm"
              sf auth list
  workflows:
    basic-test:
      jobs:
        - install_authenticate

```

## Blog post

Read our announcement post here:
