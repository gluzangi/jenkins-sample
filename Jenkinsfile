pipeline {
    agent none
    stages {
        stage('Content-Ops Prep') {
            agent { docker 'alpine:latest' }
            steps {
                echo 'Alpine Instance - Fetch ContentOps Essentials'
                sh 'apk add --update alpine-sdk openssh-client git'
                sh 'git clone git@github.com:freethechildren/wesites-migration-scripts.git'
                sh 'ls -al ./'
                sh 'sed --help'
            }
        }
        stage('DB Export') {
            agent { docker 'mariadb:latest' }
            steps {
                echo 'MySQL/MariaDB Instance - Data Export'
                sh 'mysqldump --help'
            }
        }
        stage('DB-Search-and-Replace') {
            agent { docker 'alpine:latest' }
            steps {
                echo 'Alpine Instance - Development Tools'
                sh 'apk add --update alpine-sdk git'
                sh 'git --help'
                sh 'sed --help'
            }
        }
        stage('Testing') {
            parallel {
                stage ('DB Schema Test') {
                    agent { docker 'mariadb:latest' }
                    steps {
                        echo 'MySQL/MariaDB Instance - DB Schema Test'
                        sh 'mysqldump --help'
                    }
                }
                stage ('Code Analysis') {
                    agent { docker 'python:alpine' }
                    steps {
                        echo 'Alpine Instance - Code Sniffing and Deployment Test'
                        sh 'apk add --update alpine-sdk ansible'
                        sh 'ansible --help'
                    }
                }
            }
        }
        stage('DB-Import') {
            agent { docker 'mariadb:latest' }
            steps {
                echo 'MySQL/MariaDB Instance - Data Import'
                sh 'mysql --help'
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
