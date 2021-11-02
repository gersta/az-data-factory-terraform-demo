# az-data-factory-terraform-demo
Build up an Azure Data Factory Pipeline via Terraform.

Two different resource groups are required:
- terraform-demo
- terraform-backend

## terraform-demo
This resource group contains all the infrastructure required to deliver the actual softwarte product, which primarly are the following resources:
- storage account and CSV content as blobs
- SQL server and database
- Data Factory pipeline

## terraform-backend
On the other hand, this resource group is required to securely use Terraform without exposing secrets. This group requires the following resources to exist:
- Azure Key Vault to store the secrets
- Storage Account to act as the backend for Terraform