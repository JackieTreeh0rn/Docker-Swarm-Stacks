#!/bin/bash
#!/bin/bash

set -o allexport
. ./.env


docker stack rm ${STACK_NAME}
docker stack rm internal-app
docker stack rm external-app
docker secret rm cf_token
docker secret rm basic_auth_creds