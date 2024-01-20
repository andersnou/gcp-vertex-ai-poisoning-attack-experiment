#!/bin/bash

# Local directory to be uploaded
LOCAL_DIR="data/training"

# GCS bucket name
BUCKET_NAME="gcp-vertex-ai-poisoning-attack"

# Upload the directory and its contents to the GCS bucket
gsutil -m cp -r "$LOCAL_DIR"/* gs://"$BUCKET_NAME"/training

echo "Upload completed."
