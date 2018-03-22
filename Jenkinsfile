pipeline {
    agent none
    stages {
        stage('Build') {
            agent { docker 'php:7-cli' }
            steps {
                echo 'Hello, PHP 7 CLI >>'
                sh 'php -m'
            }
        }
        stage('Test') {
            agent { docker 'openjdk:8-jre' }
            steps {
                echo 'Hello, JDK >>'
                sh 'java -version'
            }
        }
        stage('Deploy') {
            agent { docker 'python:alpine' }
            steps {
                echo 'Hello, PYTHON >>'
                sh 'python -V'
            }
        }
    }
}
