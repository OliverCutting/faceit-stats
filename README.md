# faceit-stats

A website to view your Faceit stats.

## Overview

This project provides a web application to view your Faceit stats, including mean and median kills in your recent games. The application is built using Flask for the backend and Terraform for infrastructure management.


## Setup

### Prerequisites

- Python 3.x
- Flask
- Terraform
- AWS account
- Faceit API key

### Installation

1. Clone the repository:

  `git clone https://github.com/OliverCutting/faceit-stats.git`
  
  `cd faceit-stats`

2. Set up a virtual environment and install dependencies:

  `python -m venv venv`

  `source venv/bin/activate`
  
  `pip install -r requirements.txt`

3. Set up environment variables:

  `export FACEIT_API_KEY=your_faceit_api_key`
  
  `export TEST_USER=your_test_user`
  
4. Run the Flask application:

  `python app/app.py`

### Terraform Deployment

1. Initialise Terraform:

  `cd Terraform`
  
  `terraform init`

2. Plan the deployment:

  `terraform plan`

3. Apply the deployment:

  `terraform apply`

## GitHub Actions

The project includes GitHub Actions workflows for deploying and destroying the infrastructure. The workflows are defined in the workflows directory.

- deploy.yml: Deploys the infrastructure on push events.
- destroy.yml: Destroys the infrastructure on workflow dispatch events.

## Usage

- Access the web application at http://localhost:5000.
- Use the /test endpoint to check if the application is running.
- Use the / endpoint to view the mean and median kills for the test user.