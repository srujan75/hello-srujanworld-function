# Authenticate to Azure
az login
az account set --subscription "76c97ee5-7eb5-4ee3-93af-dc0c10ac6f49"

# Navigate to Terraform directory
cd ../terraform

# Initialize Terraform
terraform init

# Apply Terraform Configuration
terraform apply -auto-approve

# Get Function App URL
$functionAppUrl = terraform output function_app_url
Write-Output "Function App Deployed at: $functionAppUrl"
