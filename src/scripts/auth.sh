#! /bin/bash

sf config set org-instance-url="${INSTANCE_URL}" --global
sf auth jwt grant \
    --client-id "${CONSUMER_KEY}" \
    --jwt-key-file ./server.key \
    --username "${DEFAULT_USERNAME}" \
    --instance-url "${INSTANCE_URL}" \
    --set-default-dev-hub \
    --alias "${DEFAULT_DEVHUB_USERNAME}"
sf config set org-api-version="${API_VERSION}"
