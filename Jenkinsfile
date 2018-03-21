pipeline {
    agent none
    stages {
        stage('DB-Dump') {
            agent { docker 'mariadb:latest' }
            steps {
                echo 'Hello, MySQL/MariaDB'
                sh 'mysql --version'
            }
        }
        stage('DB-Search-and-Replace') {
            agent { docker 'debian:stable-slim' }
            steps {
                echo 'Hello, Linux Instance'
                sh 'sed -version'
            }
        }
    }
}
