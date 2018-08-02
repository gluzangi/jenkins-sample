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
                sh 'cp ./BaltimoreCyberTrustRoot.crt.pem ~/ca_azure.pem'
                sh 'cp ./my.cnf ~/.my.cnf'
                sh 'sed --help'
                sh 'pv --help'
                sh 'mysql --print-defaults'
                sh 'mysqldump --print-defaults'
            }
            post {
                always {
                    echo 'Jenkins Says - I am done here yay!'
                    /* deleteDir() */
                }
            }
        }
        stage('DB Export') {
            steps {
                echo 'MySQL/MariaDB - Data Export'
                sh 'mysqldump --databases --add-drop-table db_wesites_stg | pv -W > ./db-wesites-stg.sql'
                sh 'ls -al ./'
            }
            post {
                always {
                    echo 'Jenkins Says - I am done here yay!'
                    /* deleteDir() */
                }
            }
        }
        stage('DB-Search-and-Replace') {
            steps {
                echo 'Development Tools - Search and Replace URLs'
                sh './db-search-replace.sh db-wesites-stg.sql'
            }
            post {
                always {
                    echo 'Jenkins Says - I am done here yay!'
                    /* deleteDir() */
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
                sh 'mysql -v db_wesites < db-wesites-stg.sql'
            }
        }
    }
    post {
        always {
            echo 'Jenkins Says - I AM DONE & DONER!'
            deleteDir()
        }
    }
}
