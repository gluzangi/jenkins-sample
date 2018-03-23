pipeline {
    agent none
    stages {
        stage('Content-Ops SetUp') {
            agent { docker 'alpine:latest' }
            steps {
                echo 'Alpine Instance - Fetch ContentOps Essentials'
                sh 'apk add --update alpine-sdk bash'
                sh './db-setup-cnf.sh'
                sh 'cp ./my.cnf ~/.my.cnf'
                sh 'sed --help'
            }
        }
        stage('DB Export') {
            agent { docker 'mariadb:latest' }
            steps {
                echo 'MySQL/MariaDB Instance - Data Export'
                sh './db-setup-cnf.sh'
                sh 'cp ./my.cnf ~/.my.cnf'
                sh 'cat ~/.my.cnf'
                sh 'mysqldump --print-defaults'
            }
        }
        stage('DB-Search-and-Replace') {
            agent { docker 'alpine:latest' }
            steps {
                echo 'Alpine Instance - Development Tools'
                sh 'apk add --update alpine-sdk bash'
                sh 'ls -al ./'
                sh 'sed --help'
                sh 'ls -al ~/'
            }
        }
        stage('Testing') {
            parallel {
                stage ('DB Schema Test') {
                    agent { docker 'mariadb:latest' }
                    steps {
                        echo 'MySQL/MariaDB Instance - DB Schema Test'
                        sh 'ls -al ./'
                        sh './db-setup-cnf.sh'
                        sh 'cp ./my.cnf ~/.my.cnf'
                        sh 'mysqldump --print-defaults'
                        sh 'cat ~/.my.cnf'
                        sh 'ls -al ~/'
                    }
                }
                stage ('Code Analysis') {
                    agent { docker 'python:alpine' }
                    steps {
                        echo 'Alpine Instance - Code Sniffing and Deployment Test'
                        sh 'apk add --update alpine-sdk bash ansible'
                        sh 'ls -al ./'
                        sh 'ansible --help'
                        sh 'ls -al ~/'
                    }
                }
            }
        }
        stage('DB-Import') {
            agent { docker 'mariadb:latest' }
            steps {
                echo 'MySQL/MariaDB Instance - Data Import'
                sh 'ls -al ./'
                sh './db-setup-cnf.sh'
                sh 'cp ./my.cnf ~/.my.cnf'
                sh 'mysql --print-defaults'
                sh 'ls -al ~/'
            }
        }
    }
    post {
        always {
            echo 'Jenkins Says - Yay, I am done!'
            /* deleteDir() */
        }
    }
}
