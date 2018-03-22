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
                    agent { docker 'python:alpine' }
                    steps {
                        echo 'Git/SonarQube - Code Sniffing '
                        sh 'apk add --update alpine-sdk ansible'
                        sh 'ansible --help'
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
    post {
        always {
            echo 'Jenkins Says - Yay, I am done!'
            deleteDir()
        }
    }
}
