#!/usr/bin/env bash

cat <<EOT >>  /${CONFIG_PATH}/${FILE_NAME}
[splunktcp://${PORT}]
disabled = 0
EOT

