#! /bin/bash

sf org create scratch -f "${SCRATCH_CONFIG}" -a "${SCRATCH_ALIAS}" "${SCRATCH_OVERRIDES}"
sf org list | grep "${SCRATCH_ALIAS}"
