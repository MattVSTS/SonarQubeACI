#!/bin/bash

RESOURCE_GROUP=''
ACI=''
STORAGE_ACCOUNT=''
SQL_SERVER=''
SQL_DATABASE=''
SQL_USERNAME=''
SQL_PASSWORD=''
DNS=''

# ARM Template deployment
az deployment group create --name sonarqube --resource-group $RESOURCE_GROUP --template-file sonarqube.json --parameters storageAccountName=$STORAGE_ACCOUNT containerInstanceName=$ACI dnsName=$DNS User=$SQL_USERNAME sqlServerName=$SQL_SERVER Password=$SQL_PASSWORD

# Upload custom sonar.properties file to Storage Account
az storage file upload --account-name $STORAGE_ACCOUNT --share-name "conf" --source "sonar.properties" --path "sonar.properties"