targetScope = 'resourceGroup'

param virtualNetworkName string
param location string
param addressPrefix string
param subnetPrefix string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'snet-application'
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

output virtualNetworkId string = virtualNetwork.id