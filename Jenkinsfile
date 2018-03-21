pipeline {
    agent none
    stages {
        stage('DB Export') {
            agent { docker 'mariadb:latest' }
            steps {
                echo 'MySQL/MariaDB - Export'
                sh 'mysqldump --help'
            }
        }
        stage('DB-Search-and-Replace') {
            agent { docker 'debian:stable-slim' }
            steps {
                echo 'Hello, Linux Instance'
                sh 'sed --help'
            }
        }
        stage('DB-Import') {
            agent { docker 'mariadb:latest' }
            steps {
                echo 'MySQL/MariaDB - Import'
                sh 'mysql --help'
            }
        }
    }
}
