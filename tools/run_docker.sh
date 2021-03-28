#!/usr/bin/env bash
set -x
## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t capstone .

# Step 2: 
# List docker images
docker images | grep capstone

# Step 3: 
# Run flask app
docker run --rm -it -p 5000:5000 capstone