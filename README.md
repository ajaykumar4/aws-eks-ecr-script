# This Repo will setup shortcut for authenicate aws sso, eks kubeconfig, ecr and container details for debugging 


## setup
### prerequisite
installing packages using brew for macos and linux
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install awscli
brew install fzf
brew install kubectx
```

### Install aws_eks_ecr shortcut script using below command:  

github enterprise sso username and token is required  
BU values is required to get AWS account details:

- `devops`: DevOps Account (office)
- `personal`: Personal Account (personal)
- `all`: Combines all accounts config from aws_config directory

```
curl -sSL https://raw.githubusercontent.com/ajaykumar4/aws-eks-ecr-script/main/install.sh | bash -s -- <BU>
```

## Run this command to login to aws, download eks kubeconfig, authenicate ecr.  
```
aws_sso_login
```

## Run this command to set kube context of eks
```
kubectx
```

## Run this command to display service container output
```
container_log <service_name> <env>-<domain>
```

## Run this command to display service container and istio output
```
all_container_log <service_name> <env>-<domain>
```
## Run this command to download service container output
```
download_container_log <service_name> <env>-<domain>
```

## Run this command to download service container and istio output
```
download_all_container_log <service_name> <env>-<domain>
```
## Run this command to display service container description 
```
container_describe <service_name> <env>-<domain>
```

## Run this command to download service container description 
```
download_container_describe <service_name> <env>-<domain>
```
