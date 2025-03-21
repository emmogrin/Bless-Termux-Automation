#!/data/data/com.termux/files/usr/bin/bash

# Bless Login Automation Script by @admirkhen

echo "Starting Bless Network Auto Login..."

# Pre-filled credentials
EMAIL="emmogoe3@gmail.com"
PASSWORD="EMMANUEL"

# Prompt user for auth code
read -p "Enter the auth code sent to your email: " AUTHCODE

# Login API URL
LOGIN_URL="https://bless.network/api/auth/login"

# Perform login request
response=$(curl -s -X POST $LOGIN_URL \
-H "Content-Type: application/json" \
-d "{\"email\":\"$EMAIL\",\"password\":\"$PASSWORD\",\"code\":\"$AUTHCODE\"}")

echo "Login Response: $response"

# Extract token if available
TOKEN=$(echo $response | grep -o '"accessToken":"[^"]*"' | cut -d':' -f2 | tr -d '"')

if [ -n "$TOKEN" ]; then
  echo "Login Successful! Token: $TOKEN"
else
  echo "Login Failed. Check credentials or auth code!"
fi
