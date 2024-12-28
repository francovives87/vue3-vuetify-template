pipeline {
    agent any

    environment {
        IMAGE_NAME = 'mitienda-frontend'
        REGISTRY = 'localhost:5000'  // Ajusta si usas otro registro
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                script {
                    sh 'docker-compose down'
                    sh 'docker-compose up -d --build'
                }
            }
        }
    }

    post {
        always {
            script {
                sh 'docker-compose logs'
            }
        }
    }
}
