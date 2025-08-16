pipeline {
  agent any
 
  environment {
    DOCKER_IMAGE = "rahuldeokate/devops-portfolio:latest"
    DOCKER_CREDENTIALS_ID = "dockerhub-creds"
  }
 
  stages {
    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }
 
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE ./app'
      }
    }
 
    stage('Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: "$DOCKER_CREDENTIALS_ID", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh '''
            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            docker push $DOCKER_IMAGE
          '''
        }
      }
    }
  }
}
