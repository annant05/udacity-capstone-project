pipeline {
    environment {
        DEPLOY_TYPE = 'blue'
        EKS_CLUSTERNAME = 'CapstoneEKSCluster'
        registry = 'annantguptacs15/capestonenginx'
        registryCredential = 'dockerhub'
        dockerImgVar = ''
    }
    agent any

    stages {
        stage('Install os packages') {
            steps {
                sh 'make updateos install'
            }
        }
        stage('Lint HTML') {
            steps {
                sh 'tidy -q -e ./project-src/$DEPLOY_TYPE/html/*.html'
            }
        }
        stage('Lint DockerFile') {
            steps {
                sh 'hadolint ./project-src/$DEPLOY_TYPE/Dockerfile'
            }
        }
        stage('Build Docker Image and Publish ') {
            steps {
                script {
                    dockerImgVar = docker.build registry + ":$BUILD_NUMBER"
                    docker.withRegistry('', registryCredential) {
                        dockerImgVar.push()
                    }
                }
            }
        }
        stage('Set kubectl for the cluster') {
              steps {
                withAWS(region:'us-east-1', credentials:'aws-credentials') {
                    sh '''
                        aws eks --region us-east-1 update-kubeconfig --name $EKS_CLUSTERNAME
                    '''
                }
        }
        stage('Create Kubernetes deployment') {
            steps {
                sh 'kubectl apply -f ./kubernetes/$DEPLOY_TYPE-deployment.yml'
            }
        }
        stage('Create Kubernetes sevice') {
            steps {
                sh 'kubectl apply -f ./kubernetes/$deploy-service.yml'
            }
        }
        stage('Output EKS service output') {
            steps {
                sh '''
                kubectl get service/lb-apache-service |  awk {'print $1" " $2 " " $4 " " $5'} | column -t'
                '''
            }
        }
    }
}
