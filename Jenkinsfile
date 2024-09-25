pipeline {
    agent any
    tools{
        jdk 'jdk17'
        maven 'maven3'
    }

    stages {
        stage('git clone') {
            steps {
                git branch: 'main', url: 'https://github.com/MiksVeg/FullStack-Blogging-App.git'
            }
        }
        stage('compile') {
            steps {
                sh "mvn compile"
            }
        }
        stage('test') {
            steps {
                sh "mvn test"
            }
        }
        stage('build') {
            steps {
                sh "mvn package"
            }
        }
        stage('docker image') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                        sh "docker build -t miksveg/bloggingapp:latest ."
                        sh "docker push miksveg/bloggingapp:latest"
                    }
                }
            }
        }
        stage('deploy') {
            steps {
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kube-sec', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                    //sh "kubectl delete -f deploy-svc.yaml"
                    sh "kubectl create -f deploy-svc.yaml"
                    
                }
            }
        }
    }
}
