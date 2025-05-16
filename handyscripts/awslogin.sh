#!/bin/bash
set -euo pipefail

# Set to a different profile if needed
export AWS_PROFILE=Auth_Clio_DataEngineer

ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $AWS_PROFILE)
SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $AWS_PROFILE)
SESSION_TOKEN=$(aws configure get aws_session_token --profile $AWS_PROFILE)

SESSION_JSON=$(jq -n \
  --arg id "$ACCESS_KEY_ID" \
  --arg key "$SECRET_ACCESS_KEY" \
  --arg token "$SESSION_TOKEN" \
  '{sessionId: $id, sessionKey: $key, sessionToken: $token}'
)

TOKEN=$(curl -s "https://signin.aws.amazon.com/federation" \
  --get \
  --data-urlencode "Action=getSigninToken" \
  --data-urlencode "Session=$SESSION_JSON" \
  | jq -r .SigninToken)

LOGIN_URL="https://signin.aws.amazon.com/federation?Action=login&Issuer=Okta&Destination=https%3A%2F%2Fconsole.aws.amazon.com%2F&SigninToken=$TOKEN"

open "$LOGIN_URL"
