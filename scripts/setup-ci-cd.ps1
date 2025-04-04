# Set GitHub repository details
$githubToken = $env:GITHUB_TOKEN  # Use an environment variable instead
$repoOwner = "srujan75"
$repoName = "hello-srujanworld-function"

# Read Azure Credentials from JSON file
$azureCredentials = Get-Content "azure-credentials.json" | ConvertTo-Json

# Set GitHub Headers
$headers = @{
    "Authorization" = "token $githubToken"
    "Accept" = "application/vnd.github.v3+json"
}

# Store Secret in GitHub Actions
$body = @{
    name  = "AZURE_CREDENTIALS"
    value = $azureCredentials
} | ConvertTo-Json

Invoke-RestMethod -Uri "https://api.github.com/repos/$repoOwner/$repoName/actions/secrets" -Method POST -Headers $headers -Body $body

Write-Output "GitHub Actions setup complete!"
