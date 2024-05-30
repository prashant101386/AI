//param sites_mexicopolicy_name string = 'learning101386site'
//param serverfarms_asp_mexicopolicy_externalid string = '/subscriptions/e609b895-8521-4e27-a166-510b517292f5/resourceGroups/DTFS-AI/providers/Microsoft.Web/serverFarms/asp-mexicopolicy'
param appserviceplanid string
param app object
param tags object

resource sites_mexicopolicy_name_resource 'Microsoft.Web/sites@2023-12-01' = {
  name: app.name
  location: app.location
  tags: tags
  kind: 'app,linux'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${app.name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${app.name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: appserviceplanid
    reserved: true
    isXenon: false
    hyperV: false
    dnsConfiguration: {
    }
    vnetRouteAllEnabled: false
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'PYTHON|3.11'
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: true
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    vnetBackupRestoreEnabled: false
    customDomainVerificationId: '182DAD46AD271F32306611CD9AD7D0B0D02EE941360AD86F44FD68323A79FFE1'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_mexicopolicy_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-12-01' = {
  parent: sites_mexicopolicy_name_resource
  name: 'ftp'
  properties: {
    allow: true
  }
}

resource sites_mexicopolicy_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-12-01' = {
  parent: sites_mexicopolicy_name_resource
  name: 'scm'
  properties: {
    allow: true
  }
}

resource sites_mexicopolicy_name_web 'Microsoft.Web/sites/config@2023-12-01' = {
  parent: sites_mexicopolicy_name_resource
  name: 'web'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'PYTHON|3.11'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$mexicopolicy'
    scmType: 'ExternalGit'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    managedServiceIdentityId: 5650
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {
    }
  }
}

resource sites_mexicopolicy_name_9a0a8fc3acb5c9fc59b778bcd025df48c1a51ca1 'Microsoft.Web/sites/deployments@2023-12-01' = {
  parent: sites_mexicopolicy_name_resource
  name: '9a0a8fc3acb5c9fc59b778bcd025df48c1a51ca1'
  properties: {
    status: 4
    author_email: 'iseabock@users.noreply.github.com'
    author: 'Ian Seabock'
    deployer: 'GitHub'
    message: '[Fix] Add missing DOMPurify package and types (#527)\n    \n    Co-authored-by: Ian Seabock (Centific Technologies Inc) <v-ianseabock@microsoft.com>'
    start_time: '2024-01-23T16:45:08.017734Z'
    end_time: '2024-01-23T16:47:49.0827996Z'
    active: true
  }
}

resource sites_mexicopolicy_name_sites_mexicopolicy_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2023-12-01' = {
  parent: sites_mexicopolicy_name_resource
  name: '${app.name}.azurewebsites.net'
  properties: {
    siteName: 'mexicopolicy'
    hostNameType: 'Verified'
  }
}
