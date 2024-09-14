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
                    withCredentials([string(credentialsId: 'docker-pass', variable: 'docker-pass')])
                    {
                    sh 'docker login -u ${Docker_User} -p ${docker-pass}'
                 //   sh 'docker tag demo-image RohitDadgelwar/shoes_microservice:latest'
                    sh 'docker push rohitdocker2002/shoes_microservice:latest'
                    sh 'docker logout'
                    }
            }
        }
    }
} 
