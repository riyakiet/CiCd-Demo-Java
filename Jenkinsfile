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
        withAWS(region:'us-east-1',credentials:'aws') {
          sh 'echo "Uploading content with AWS creds"'
          s3Upload(file:'app.py', bucket:'jenkins-s3-bucket-wach')
//           sh '
//           aws s3 cp ./target/demo-0.0.1-SNAPSHOT.jar s3://jenkins-test-javaupload/demo-0.0.1-SNAPSHOT.jar '
        }
      }
    }
  }
}
