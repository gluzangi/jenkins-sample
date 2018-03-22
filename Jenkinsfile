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
            agent { docker 'alpine:latest' }
            steps {
                echo 'Hello, Alpine Instance'
                sh 'sed --help'
            }
        }
        stage('Testing') {
            parallel {
                stage ('DB Schema Test') {
                    agent { docker 'mariadb:latest' }
                    steps {
                        echo 'SQL - DB Schema Test'
                        sh 'mysqldump --help'
                    }
                }
                stage ('Code Analysis') {
                    agent { docker 'sonarqube:latest' }
                    steps {
                        echo 'Sonarqube - Code Sniffing '
                        sh 'sonar-scanner --help'
                    }
                }
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
