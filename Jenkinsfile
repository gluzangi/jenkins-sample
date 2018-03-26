pipeline {
    agent {
        docker {
            image 'alpine:latest'
            args '-v $HOME/.jenkins/:/tmp'
        }
    }
    stages {
        stage('Content-Ops Session SetUp') {
            steps {
                echo 'ContentOps Tools Preparation'
                sh 'apk add --update alpine-sdk bash mariadb-client pv'
                sh './db-setup-cnf.sh'
                sh 'cp ./my.cnf ~/.my.cnf'
                sh 'sed --help'
                sh 'pv --help'
                sh 'mysql --print-defaults'
                sh 'mysqldump --print-defaults'
            }
            post {
                always {
                    /* deleteDir() */
                    echo 'Jenkins Says - I am done here yay!'
                }
            }
        }
        stage('DB Export') {
            steps {
                echo 'MySQL/MariaDB - Data Export'
                sh 'mysqldump --databases --add-drop-table db_wesites_dev | pv -W > ./db-wesites-dev.sql'
                sh 'ls -al ./'
            }
            post {
                always {
                    /* deleteDir() */
                    echo 'Jenkins Says - I am done here yay!'
                }
            }
        }
        stage('DB-Search-and-Replace') {
            steps {
                echo 'Development Tools - Search and Replace URLs'
                sh 'ls -al ./'
                sh './db-search-replace.sh db-wesites-dev.sql'
                sh 'cp db-search-replace.sh /tmp/db-wesites-dev.sql'
            }
            post {
                always {
                    /* deleteDir() */
                    echo 'Jenkins Says - I am done here yay!'
                }
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
                sh 'mysql -v db_wesites_poc < db-wesites-dev.sql'
            }
        }
    }
    post {
        always {
            deleteDir()
            echo 'Jenkins Says - I AM DONE & DONER!'
        }
    }
}
