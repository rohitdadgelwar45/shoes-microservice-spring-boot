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
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post{
                always{
                    junit stdioRetention: '', testResults: '**/target/surefire-reports/*.xml'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t rohitdadgelwar/shoes_microservice .'
            }
        }
        stage('Push Docker Image') {
            steps {
                    withCredentials([string(credentialsId: 'Docker-Hub', variable: 'docker-hub')]) 
                    {
                    sh 'docker login -u RohitDadgelwar -p ${docker-hub}'
                 //   sh 'docker tag demo-image RohitDadgelwar/shoes_microservice:latest'
                    sh 'docker push RohitDadgelwar/shoes_microservice:latest'
                    sh 'docker logout'
                    }
            }
        }
    }
} 
