#Below is the provider configuration with Shared Configuration and Credentials Files.
provider "aws" {
  alias = "Account1-region1"
  region                   = var.region1
  shared_config_files      = ["/Users/vanch/.aws/config"]
  shared_credentials_files = ["/Users/vanch/.aws/credentials"]
  profile                  = "AWSAmbassador"
}

provider "aws" {
  alias = "Account1-region2"
  region                   = var.region2
  shared_config_files      = ["/Users/vanch/.aws/config"]
  shared_credentials_files = ["/Users/vanch/.aws/credentials"]
  profile                  = "AWSAmbassador"
}

provider "aws" {
  alias = "Account2"
  region                   = var.region1
  shared_config_files      = ["/Users/vanch/.aws/config"]
  shared_credentials_files = ["/Users/vanch/.aws/credentials"]
  profile                  = "AWSAmbassador2"
}