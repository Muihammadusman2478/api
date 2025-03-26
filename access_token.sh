#!/bin/bash

# Prompt the user for email and API key
read -p "Enter your email: " email
read -s -p "Enter your API key: " api_key
echo ""

# Fetch the access token
export access_token="$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" \
    -X POST --data "{\"email\": \"$email\", \"api_key\": \"$api_key\"}" \
    'https://api.cloudways.com/api/v1/oauth/access_token' | jq -r '.access_token')"

# Print the token
echo "Bearer Token: $access_token"

# Reminder to use the token
echo "To use the token in your shell, run: echo \$access_token"
