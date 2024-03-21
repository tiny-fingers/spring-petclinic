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
        stage('Stop Previous container') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'docker stop pet-clinic'
                    sh 'docker rename pet-clinic backup-pet-clinic'
                    sh 'exit 1' // This will cause an error, but the pipeline will continue
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
        stage('Cleanup Docker') {
            steps {
                sh 'docker rm backup-pet-clinic'
                sh 'docker system prune -f'
            }
        }
    }
}
