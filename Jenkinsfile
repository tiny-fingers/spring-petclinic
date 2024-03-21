pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker build -t petclinic:latest .'
            }
            post {
                success {
                    echo 'Docker image built'
                }
            }
        }
        stage('Run Docker image') {
            steps {
                sh 'docker run -p 80:8090 --name pet-clinic -d petclinic:latest'
            }
            post {
                success {
                    echo 'Docker image deployed'
                }
            }
        }
    }
}
