pipeline {
  agent any
  tools {
    maven "MAVEN"
    jdk "JDK"
  }
  stages {
    stage('Initialize'){
      steps{
        echo "PATH = ${M2_HOME}/bin:${PATH}"
        echo "M2_HOME = /opt/maven"
      }
    }
    stage('build') {
      steps {
        echo "Build"
        dir("/var/lib/jenkins/workspace/deployToS3") {
          sh 'mvn -B -DskipTests clean package'
        }
        sh ' zip -r /var/lib/jenkins/workspace/deployToS3/app.zip /var/lib/jenkins/workspace/deployToS3/target/demo-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace/deployToS3/java.sh '
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
          s3Upload(file:'/var/lib/jenkins/workspace/deployToS3/app.zip', bucket:'jenkins-test-javaupload/app.zip')
//           sh '
//           aws s3 cp ./target/demo-0.0.1-SNAPSHOT.jar s3://jenkins-test-javaupload/demo-0.0.1-SNAPSHOT.jar '
        }
      }
    }
  }
}
