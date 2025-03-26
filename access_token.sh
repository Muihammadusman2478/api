#!/bin/bash

# Prompt for email and API key
read -p "Enter your email: " email
read -sp "Enter your API key: " api_key
echo  # Move to the next line after entering the API key

# Make API request to get the access token
access_token=$(curl -s -X POST "https://api.cloudways.com/api/v1/oauth/access_token" \
     -H "Accept: application/json" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     --data "email=$email&api_key=$api_key" | jq -r ".access_token")

# Print the token to CLI
echo "Bearer Token: $access_token"

# Store the token in shell so it persists
export access_token
echo "To use the token in your shell, run: echo \$access_token"
