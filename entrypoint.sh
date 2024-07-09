#!/bin/sh

#Decode Base64-key to json file
echo "$INPUT_SERVICE_KEY" | base64 --decode > "$HOME"/service_key.json

gcloud auth activate-service-account --key-file="$HOME"/service_key.json --project "$INPUT_PROJECT"

gsutil -m rsync -R "$INPUT_BUILD_FOLDER" gs://"$INPUT_BUCKET_NAME"
