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
                sh 'docker run -p 80:8090 -d petclinic:latest'
            }
            post {
                success {
                    echo 'Docker image deployed'
                }
            }
        }
        stage('Cleanup Docker') {
            steps {
                sh 'docker system prune -f'
            }
        }
    }
}
