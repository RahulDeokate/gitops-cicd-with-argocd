pipeline {
  agent any
 
  environment {
    DOCKER_IMAGE = "rahuldeokate/portfolio"
    DOCKER_CREDENTIALS_ID = "dockerhub-creds"
    MANIFEST_REPO = "git@github.com:rahuldeokate/portfolio-manifests.git"
    MANIFEST_CREDENTIALS_ID = "github-creds"
  }
 
  stages {
 
    stage('📦 Checkout Code') {
      steps {
        checkout scm
      }
    }
 
    stage('🐳 Build & Push Docker Image') {
      steps {
        script {
          def tag = "${env.BUILD_NUMBER}"
          sh """
            docker build -t $DOCKER_IMAGE:$tag .
            echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
            docker push $DOCKER_IMAGE:$tag
          """
        }
      }
    }
 
    stage('📝 Update Manifest Repo') {
      steps {
        script {
          def tag = "${env.BUILD_NUMBER}"
          sshagent (credentials: ["$MANIFEST_CREDENTIALS_ID"]) {
            sh """
              git clone $MANIFEST_REPO manifest-repo
              cd manifest-repo
              sed -i 's#image: .*#image: $DOCKER_IMAGE:$tag#' k8s/deployment.yaml
              git config user.email "jenkins@ci.com"
              git config user.name "Jenkins CI"
              git commit -am "Update image to $DOCKER_IMAGE:$tag"
              git push origin main
            """
          }
        }
      }
    }
  }
 
  post {
    success { echo "🎉 New image deployed via ArgoCD!" }
    failure { echo "❌ Build failed. Check logs." }
  }
}
 
