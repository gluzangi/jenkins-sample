pipeline {
    agent none
    stages {
        stage('Content-Ops SetUp') {
            agent { docker 'alpine:latest' }
            steps {
                echo 'Alpine Instance - Fetch ContentOps Essentials'
                sh 'apk add --update alpine-sdk bash'
                sh 'ls -al ./'
                sh 'cat ./db-setup-cnf.sh'
                sh './db-setup-cnf.sh'
                sh 'cp ./my.cnf ~/.my.cnf'
                sh 'ls -al ~/'
                sh 'sed --help'
            }
        }
        stage('DB Export') {
            agent { docker 'mariadb:latest' }
            steps {
                echo 'MySQL/MariaDB Instance - Data Export'
                sh 'ls -al ./'
                sh 'cat ./db-setup-cnf.sh'
                sh 'cp ./my.cnf ~/.my.cnf'
                sh 'ls -al ~/'
                sh 'mysqldump --print-defaults'
            }
        }
        stage('DB-Search-and-Replace') {
            agent { docker 'alpine:latest' }
            steps {
                echo 'Alpine Instance - Development Tools'
                sh 'apk add --update alpine-sdk bash git'
                sh 'ls -al ./'
                sh 'git --help'
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
                        sh 'cat ./db-setup-cnf.sh'
                        sh 'cp ./my.cnf ~/.my.cnf'
                        sh 'mysqldump --print-defaults'
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
                sh 'cat ./db-setup-cnf.sh'
                sh 'cp ./my.cnf ~/.my.cnf'
                sh 'mysql --help'
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
