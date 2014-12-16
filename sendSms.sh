#!/bin/bash

DEBUG_SCRIPT=0

# ===========================================
# Sms Api 
# ===========================================
API_URL="https://smsapi.free-mobile.fr/"
API_USER_ID="YOUR_API_USER_ID"
API_USER_KEY="YOUR_API_USER_KEY"
DEFAULT_MESSAGE="YOUR DEFAULT CONTENT !"

# => Set DEFAULT_MESSAGE in MESSAGE, if you don't add first argument on script call
MESSAGE=${1:-$DEFAULT_MESSAGE}
# => Escape " " in message by %20
ESCAPED_MESSAGE=${MESSAGE//" "/"%20"} 

# => Get full api url
FULL_API_URL="${API_URL}sendmsg?user=${API_USER_ID}&pass=${API_USER_KEY}&msg=${ESCAPED_MESSAGE}"

# => Check if script is in debug mode
if [ $DEBUG_SCRIPT == 0 ]; then
	HTTP_RESPONSE_CODE=`wget -q -t 1 --server-response --no-check-certificate $FULL_API_URL 2>&1 | awk '/^  HTTP/{print $2}'`
	echo "HttpReponse : $HTTP_RESPONSE_CODE"
else
	echo $FULL_API_URL
fi
