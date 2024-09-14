pipeline{
    agent any
    tools{
        maven "maven"
    }
    environment{
        Docker_User='rohitdocker2002'
    }

    stages{
        stage("Git Checkout"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rohitdadgelwar45/shoes-microservice-spring-boot.git']])
            }
            
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
      
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t rohitdocker2002/shoes_microservice .'
            }
        }
        stage('Push Docker Image') {
            steps {
                   withDockerRegistry(credentialsId: 'Docker-Hub-cred', url: 'https://hub.docker.com/repository/docker/rohitdockerhub2002/shoes-microservice/general')
                    {
                        sh 'docker push rohitdocker2002/shoes_microservice:latest'
                    }
            }
        }
    }
} 
