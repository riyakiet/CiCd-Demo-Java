pipeline {
  agent any
  tools {
    maven "MAVEN"
    jdk "JDK"
  }
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
        echo "Build"
//         dir("/var/lib/jenkins/workspace/java-demo-pipeline") {
//           sh 'mvn -B -DskipTests clean package'
//         }
        sh 'cp ./target/demo-0.0.1-SNAPSHOT.jar ./'
        sh ' zip -r java-app.zip demo-0.0.1-SNAPSHOT.jar java.sh '
      }
    }
    stage('deploy') {
      steps {
         sh 'echo "Uploading content with AWS creds"'
         sh 'pwd'
         sh 'ls'
         sh 'cd target'
         sh 'ls target'
        withAWS(region:'us-east-1',credentials:'aws') {
          s3Upload(file:'/var/lib/jenkins/workspace/java-demo-pipeline/java-app.zip', bucket:'cicd-demo-jenkins')
//           sh '
//           aws s3 cp ./target/demo-0.0.1-SNAPSHOT.jar s3://jenkins-test-javaupload/demo-0.0.1-SNAPSHOT.jar '
        }
      }
    }
  }
}
