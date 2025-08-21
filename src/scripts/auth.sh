#! /bin/bash

sf config set org-instance-url="${INSTANCE_URL}" --global
sf auth jwt grant \
    --client-id "${!CONSUMER_KEY}" \
    --jwt-key-file ./server.key \
    --username "${DEFAULT_USERNAME}" \
    --instance-url "${INSTANCE_URL}" \
    --set-default-dev-hub \
    --alias "$(echo "${DEFAULT_DEVHUB_USERNAME}" | envsubst)"
if [ -z "${API_VERSION}" ]; then
  echo 'No API version set: leaving as default'
else
  sf config set org-api-version="${API_VERSION}"
fi
