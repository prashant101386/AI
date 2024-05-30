param appServicePlanName string
param location string
param tags object
// param skuName string = 'B1'
// param skuTier string = 'Basic'
// param skuSize string = 'B1'
// param skuFamily string = 'B'
// param skuCapacity int = 1
param asp object

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: location
  tags: tags
  sku: {
    name: asp.skuName
    tier: asp.skuTier
    size: asp.skuSize
    family: asp.skuFamily
    capacity: asp.skuCapacity
  }
  kind: 'linux'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: true
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
}

output appServicePlanId string = appServicePlan.id
