pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID="418843764796"
        AWS_DEFAULT_REGION="ap-south-1" 
        IMAGE_REPO_NAME="nuvepro"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
    }
    stages {
         stage('Cloning Git') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/yadav3500/CiCd-Demo-Java.git']]]) 
            }
        }   
        
        stage('Build') { 
            steps { 
                script{
                 sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 418843764796.dkr.ecr.ap-south-1.amazonaws.com'
                 sh 'docker build -t "nuvepro-${BUILD_ID}" .'
                 sh 'docker images'
                 docker tag "nuvepro:latest" 418843764796.dkr.ecr.ap-south-1.amazonaws.com/nuvepro:latest
                 docker push 418843764796.dkr.ecr.ap-south-1.amazonaws.com/nuvepro:latest   
                 sh 'zip -r nuvepro.zip appspec.yml scripts'
                 sh 'ls'
                 withAWS(credentials: 'AWSCredentials'){
                        sh """ #!/bin/bash 
                            aws s3 cp nuvepro.zip s3://nuvepro/
                        """
                    }
                }
            }
        }
//         stage('Push'){
//             steps {
//                 sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 418843764796.dkr.ecr.ap-south-1.amazonaws.com'
//                 sh 'docker tag "nuvepro-${BUILD_Id}:latest" 418843764796.dkr.ecr.ap-south-1.amazonaws.com/nuvepro:nuvepro-${BUILD_Id}'
//                 sh 'docker push 418843764796.dkr.ecr.ap-south-1.amazonaws.com/nuvepro:nuvepro-${BUILD_Id}'
//                 sh 'echo "Successfully pushed to ECR"'
//             }
//         }
        stage('Deploy') {
            steps {
                script{
                    withAWS(credentials: 'AWSCredentials'){
                        sh """ #!/bin/bash 
                        aws deploy create-deployment --application-name "nuvepro" --deployment-group-name "nuvepro-dg" --s3-location "bucket='nuvepro',key=nuvepro.zip,bundleType=zip"
                        """
                    }
                    }
                    
                }
            }
        }
    }
