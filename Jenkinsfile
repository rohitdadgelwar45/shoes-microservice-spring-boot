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
    }
    
}
