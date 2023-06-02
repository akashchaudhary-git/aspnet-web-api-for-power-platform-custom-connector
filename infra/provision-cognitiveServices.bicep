param name string
param location string = resourceGroup().location

param aoaiModels array = [
  {
    name: 'gpt-35-turbo'
    deploymentName: 'model-gpt35turbo'
    version: '0301'
    apiVersion: '2023-03-15-preview'
  }
  {
    name: 'text-davinci-003'
    deploymentName: 'model-text-davinci-003'
    version: '1'
    apiVersion: '2022-12-1'
  }
]
  
module aoai './openAI.bicep' = {
  name: 'OpenAI'
  params: {
    name: name
    location: 'eastus'
    aoaiModels: aoaiModels
  }
}

output aoaiApiKey string = aoai.outputs.apiKey
output aoaiApiEndpoint string = aoai.outputs.endpoint
output aoaiApiVersion string = aoaiModels[0].apiVersion
output aoaiApiDeploymentId string = aoaiModels[0].deploymentName
