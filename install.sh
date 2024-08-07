#!/bin/bash

bu=${1}

if [ -z "${bu}" ]; then
    echo "Error: No argument provided."
    exit 1
fi

rm -rf ~/.aws-eks-ecr-script

git clone https://github.com/ajaykumar4/aws-eks-ecr-script.git ~/.aws-eks-ecr-script
cd ~/.aws-eks-ecr-script

if [ ! -d "~/.aws" ]; then
    mkdir -p ~/.aws
fi

if [ "${bu}" == "all" ]; then
    cat aws_config/* > ~/.aws/config
else
    cat aws_config/${bu} > ~/.aws/config
fi

cat script/* > ~/.aws_eks_ecr_script

check_and_add_source() {
  shell_script_name="$1"  # Argument for shell name
  shell_config_file="$2"  # Argument for shell config file path

  if ! grep -q "source $shell_script_name" "$shell_config_file"; then
    echo "Adding source for $shell_script_name to $shell_config_file"
    echo "source $shell_script_name" >> "$shell_config_file"
    source "$shell_config_file"
  fi
}

if [[ "$SHELL" == *"zsh"* ]]; then
    echo "Current shell is Zsh"
    check_and_add_source ~/.aws_eks_ecr_script ~/.zshrc
elif [[ "$SHELL" == *"bash"* ]]; then
    echo "Current shell is Bash"
    check_and_add_source ~/.aws_eks_ecr_script  ~/.bashrc
else
    echo "Current shell is unknown"
fi




