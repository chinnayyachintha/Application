#!/bin/bash

echo "Running the script now!!!"

echo "Creating Azure Resource Group"
az group create --location eastus --name APP-RG

echo "Creating Azure Virtual Network"
az network vnet create --resource-group APP-RG --name APP-RG-VNET1 --address-prefix 10.1.0.0/16 \
    --subnet-name APP-RG-Subnet-1 --subnet-prefix 10.1.1.0/24 -l eastus

echo "Creating Azure Subnets"
az network vnet subnet create --resource-group APP-RG --vnet-name APP-RG-VNET1 --name APP-RG-Subnet-2 \
    --address-prefixes 10.1.2.0/24
az network vnet subnet create --resource-group APP-RG --vnet-name APP-RG-VNET1 --name APP-RG-Subnet-3 \
    --address-prefixes 10.1.3.0/24

echo "Creating Azure NSG & Rules"
az network nsg create --resource-group APP-RG --name APP-RG_NSG1
az network nsg rule create --resource-group APP-RG --nsg-name APP-RG_NSG1 --name APP-RG_NSG1_RULE1 \
    --source-address-prefixes '*' --source-port-ranges '*' --destination-address-prefixes '*' \
    --destination-port-ranges '*' --access Allow --protocol Tcp --description "Allowing All Traffic For Now" \
    --priority 100

echo "Creating Azure Availability Set"
az vm availability-set create --name EAST-AVSET1 --resource-group APP-RG --location eastus \
    --platform-fault-domain-count 3 --platform-update-domain-count 5

echo "Creating VMs"
az vm create --resource-group APP-RG --name APP-RGFrontendVM1 --image Ubuntu2204 --vnet-name APP-RG-VNET1 \
    --subnet APP-RG-Subnet-1 --admin-username testuser --admin-password "India@123456" --size Standard_B1s \
    --nsg APP-RG_NSG1 --availability-set EAST-AVSET1 --output tsv --query '[fqdns]'
az vm create --resource-group APP-RG --name APP-RGBackendVM2 --image Ubuntu2204 --vnet-name APP-RG-VNET1 \
    --subnet APP-RG-Subnet-2 --admin-username testuser --admin-password "India@123456" --size Standard_B1s \
    --nsg APP-RG_NSG1 --availability-set EAST-AVSET1 --output tsv --query '[fqdns]'

