# Variable group of terraform-create-resource-group-pipeline.yml template


## List

| No | Name                | Secret | Sample | Description                                             |
|----|---------------------|--------|--------|---------------------------------------------------------|
|  1 | ARM_CLIENT_ID       | Yes    |        | Client id of service principle                          |
|  2 | ARM_CLIENT_SECRET   | Yes    |        | Client secret of service principle                      |
|  3 | ARM_SUBSCRIPTION_ID | Yes    |        | Subscription id of your organization                    |
|  4 | ARM_TENANT_ID       | Yes    |        | Tenant id of your organization                          |
|  5 | containerName       | No     |        | Name of container that contains Terraform's state       |
|  6 | gitToken            | Yes    |        | Credential to connect private repo                      |
|  7 | gitUser             | Yes    |        | Credential to connect private repo                      |
|  8 | storageAccountName  | No     |        | Name of storage account that contains Terraform's state |