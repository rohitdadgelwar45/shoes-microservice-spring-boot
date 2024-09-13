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
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t rohitdadgelwar/shoes_microservice .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withDockerRegistry(credentialsId: 'DockerHub', url: 'https://hub.docker.com/repository/docker/rohitdadgelwar/shoes_microservice/general') {
                    sh 'docker push rohitdadgelwar/shoes_microservice:latest'
                }
            }
        }
    
    }
    
}
