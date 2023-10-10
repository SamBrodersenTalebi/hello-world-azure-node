provider "azurerm" {
  features {}
}

# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

# Create the resource group to manage related resources
resource "azurerm_resource_group" "rg" {
  name     = "resourceGroup-${random_integer.ri.result}"
  location = "eastus"
}

# Create an App Service Plan to define the underlying VMs for the App Services
resource "azurerm_app_service_plan" "servicePlan" {
  name                = "appserviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"  
  reserved            = true 
  sku {                           
    tier = "Basic"
    size = "B1"
  }
}

# Create App Service to host the Docker container
resource "azurerm_app_service" "app_service" {
  name                = "appservice-hello-world-sambt"
  location            = azurerm_resource_group.rg.location  
  resource_group_name = azurerm_resource_group.rg.name     
  app_service_plan_id = azurerm_app_service_plan.servicePlan.id

  site_config {
    linux_fx_version  = "DOCKER|sambrodersen1998/hello-world-app:amd64" # Specifies the Docker image to use
  }

  # Application settings and environment variables for the App Service
  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false" # Disables App Service disk storage
    "DOCKER_REGISTRY_SERVER_URL"          = "https://index.docker.io" # Use dockerhub
    "DOCKER_CUSTOM_IMAGE_NAME"            = "DOCKER|sambrodersen1998/hello-world-app:amd64|3000" # Docker image with port mapping
    "DIAGNOSTICS_LOGGING_ENABLED"         = "1" # Enable logging
  }
}