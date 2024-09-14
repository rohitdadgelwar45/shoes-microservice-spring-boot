pipeline{
    agent any
    tools{
        maven "maven"
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
                sh 'docker build -t rohitdockerhub2002/shoes_microservice .'
            }
        }
        stage('Push Docker Image') {
            steps {
                   withDockerRegistry(credentialsId: 'Docker-Hub-cred', url: '')
                    {
                        sh 'docker push rohitdockerhub2002/shoes_microservice:latest'
                    }
            }
        }
    }
} 
