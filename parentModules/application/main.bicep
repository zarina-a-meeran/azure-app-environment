targetScope = 'subscription'

param environmentName string
param location string
param resourceGroupName string
param virtualNetworkName string
param addressPrefix string
param subnetPrefix string

// Create Resource Group
resource applicationResourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: resourceGroupName
  location: location
}

// Call child module to create networking
module virtualNetwork '../../childModules/virtualNetwork/virtualNetwork.bicep' = {
  scope: applicationResourceGroup
  name: 'deploy-virtual-network'
  params: {
    virtualNetworkName: virtualNetworkName
    location: location
    addressPrefix: addressPrefix
    subnetPrefix: subnetPrefix
  }
}
