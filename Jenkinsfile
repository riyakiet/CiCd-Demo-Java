pipeline {
    agent any
    stages {
         stage('Cloning Git') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/yadav3500/CiCd-Demo-Java.git']]]) 
            }
        }   
        
        stage('Build') { 
            steps { 
                script{
                     sh 'cd /CiCd-Demo-Java '
                     sh 'mvn clean install'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script{
                    withAWS(credentials: 'AWSCredentials'){
                        sh """ #!/bin/bash 
                        aws deploy create-deployment --application-name "nuvepro" --deployment-group-name "nuvepro-dg" --s3-location "bucket='kiet-infra',key=kiet-infra.zip,bundleType=zip"
                        """
                    }
                    }
                    
                }
            }
        }
    }
