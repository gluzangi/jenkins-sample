pipeline {
    agent {
        docker {
            image 'alpine:latest'
            args '-v /tmp:/tmp'
        }
    }
    stages {
        stage('Content-Ops Session SetUp') {
            steps {
                echo 'ContentOps Tools Preparation'
                sh 'apk add --update alpine-sdk bash mariadb-client'
                sh './db-setup-cnf.sh'
                sh 'cp ./my.cnf ~/.my.cnf'
                sh 'sed --help'
                sh 'mysql --print-defaults'
                sh 'mysqldump --print-defaults'
            }
        }
        stage('DB Export') {
            steps {
                echo 'MySQL/MariaDB - Data Export'
                sh 'mysqldump --databases db_wesites_dev > db-wesites-dev.sql'
                sh 'ls -al ./'
            }
        }
        stage('DB-Search-and-Replace') {
            steps {
                echo 'Development Tools - Search and Replace URLs'
                sh 'ls -al ./'
                /* sh './db-search-replace.sh db-wesites-dev.sql' */
            }
        }
        stage('Testing') {
            parallel {
                stage ('DB Schema Test') {
                    steps {
                        echo 'MySQL/MariaDB Instance - DB Schema Test'
                        sh 'ls -al ./'
                        sh 'mysqldump --print-defaults'
                    }
                }
                stage ('Code Analysis') {
                    steps {
                        echo 'Alpine Instance - Code Sniffing and Deployment Test'
                        sh 'apk add --update ansible'
                        sh 'ls -al ./'
                        sh 'ansible --help'
                    }
                }
            }
        }
        stage('DB-Import') {
            steps {
                echo 'MySQL/MariaDB Instance - Data Import'
                sh 'ls -al ./'
                sh 'mysql < db-wesites-dev.sql'
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
