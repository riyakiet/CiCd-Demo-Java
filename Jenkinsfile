pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        echo "hello Build"
      }
    }
    stage('deploy') {
      steps {
         sh 'echo "Uploading content with AWS creds"'
        withAWS(region:'us-east-1',credentials:'aws') {
          s3Upload(file:'demo-0.0.1-SNAPSHOT.jar', bucket:'jenkins-test-javaupload', path:'./target/demo-0.0.1-SNAPSHOT.jar')
//           sh '
//           aws s3 cp ./target/demo-0.0.1-SNAPSHOT.jar s3://jenkins-test-javaupload/demo-0.0.1-SNAPSHOT.jar '
        }
      }
    }
  }
}
