## Udacity Capstone Project


A project to demo the skills acquired during `Udacity DevOps NanoDegree` such as Jenkins, Docker, and Kubernetes.
This project uses Jenkins CI/CD to deploy a  containerized website to a Kubernetes.
 
### Technologies Used

 - `Kubernetes`
 - `Docker`
 - `Makefile`
 - `Jenkins`
 - `Hadolint`
 - `Dockerfile`
 - `Amazon EKS`

### Project Tasks

The goal of this project is to deploy a simple HTML website to a Kubernetes cluster in a Blue/Green deployment.

We use the following steps/pipeline to deploy.
*  Lint the HTML files using tidy.
*  Lint the Dockerfile using hadolint
*  Build a docker image using the src files and Dockerfile
*  Push the docker image to DockerHub
* Deploy the image into an EKS Kubernetes cluster using Kubernetes deployment.
* Create a service in the EKS Kubernetes cluster.
* Output the URL for the load balancer.


## To Setup the Environment

* Pre-requisites
  1. Jenkins server with plugins 
    a. BlueOcean
    b. AWS pipeline 
    c. Cloudbees Docker
  2. AWS cli with permissions to launch EKS, EC2, Cloudformation,etc
  3. Docker Hub account


* Clone this repo 
  ```sh 
  git clone https://github.com/Annant05/udacity-capstone-project.git
  ```
* update os and install required packages
  ```sh 
  make updateos install
  ```
* Create a VPC for EKS.
  ```sh 
  ./aws-cloudformation/deploy-VPC.sh
  ```

* Create an EKS cluster and NodeGroup
  ```sh 
  ./aws-cloudformation/deploy-eks.sh
  ```

* Edit the type of deployment in Jenkinsfile (either blue or green)

* Add, commit and push the code to git so that Jenkins can start the build

