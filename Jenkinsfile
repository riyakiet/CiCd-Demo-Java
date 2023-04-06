pipeline {
  agent any

  stages {
    stage('verifying tools'){
      steps{
        echo "${JAVA_HOME} "
        echo "PATH = ${M2_HOME}/bin:${PATH}"
        echo "M2_HOME = /opt/maven"
      }
    }
    stage('build') {
      steps {
	sh 'sudo mvn clean install'
        sh 'cp ./target/demo-0.0.1-SNAPSHOT.jar ./'
        sh ' zip -r java-app.zip demo-0.0.1-SNAPSHOT.jar java.sh Dockerfile '
      }
    }
    stage('dockerize'){
	 withDockerRegistry(credentialsId: 'ecr:ap-south-1:Docker', url: 'https://418843764796.dkr.ecr.ap-south-1.amazonaws.com/nuvepro'){
	     sh """ !/bin/bash
	     docker.build nuvepro
      }
    }
  }
}  	
