# Static Website Hosting on AWS S3 with Terraform and GitHub Actions

This project is designed to host a static website on AWS S3 using Terraform for infrastructure provisioning and GitHub Actions for automation.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have an AWS account with the necessary permissions.
- You have Terraform installed on your local machine.
- You have configured AWS CLI with your credentials.
- You have a GitHub account and repository set up.

## Project Structure

The repository is organized into several key directories:

- **.github/workflows**: Contains the GitHub Actions workflow file (`deploy.yml`) that automates the deployment process.
- **index.html**: It is the html file for the web-page where we are calculating factorial of a number.
- **main.tf**: Contains the Terraform configuration for creating the S3 bucket and configuring it for static website hosting.

## Key Components

- **AWS S3**: Used to host the static website. S3 provides a scalable and durable storage solution for static content.
- **Terraform**: Used to define and provision the infrastructure for the S3 bucket and its configuration for static website hosting.
- **GitHub Actions**: Automates the process of deploying the static website to S3. The workflow is triggered whenever changes are pushed to the `main` branch.

## Workflow

1. **Terraform Configuration**: The `terraform` directory contains the configuration files to create the S3 bucket and configure it for static website hosting. This includes setting up the bucket policy and enabling website hosting.
2. **GitHub Actions**: The workflow file (`deploy.yml`) in the `.github/workflows` directory automates the process of deploying the static website to S3. It uses the AWS credentials stored as GitHub Secrets to authenticate and upload the website files.

## Summary

This project provides a structured and automated approach to hosting a static website on AWS S3 using Terraform and GitHub Actions. By organizing the repository and automating the workflow, it ensures a scalable and maintainable deployment process.

