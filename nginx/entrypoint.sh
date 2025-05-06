#!/bin/sh

# Step 1: Convert standalone $ variables (not in ${}) to a temporary placeholder
sed -E 's/(\$)([a-zA-Z_]+)/###ENVSUBSTNOTOUCH###\2/g' /etc/nginx/conf.d/default.conf > /tmp/temp_step1.conf
echo "Step 1 results saved to /tmp/temp_step1.conf"

# Step 2: Run envsubst to replace ${} variables
envsubst < /tmp/temp_step1.conf > /tmp/temp_step2.conf
echo "Step 2 results saved to /tmp/temp_step2.conf"

# Step 3: Convert the placeholders back to $ variables
sed 's/###ENVSUBSTNOTOUCH###/$/g' /tmp/temp_step2.conf > /tmp/temp_step3.conf
echo "Final result saved to final_output.conf"

# Step 4: Move result back
cp /tmp/temp_step3.conf /etc/nginx/conf.d/default.conf
echo "Final result moved to /etc/nginx/conf.d/default.conf"

# I could clean it up, but nah

# Step 5: Start nginx
nginx -g 'daemon off;'
