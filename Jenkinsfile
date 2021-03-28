pipeline {
  environment {
    registry = "docjibo/capstone"
    registryCredential = 'docjibo'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Install dependencies') {
      steps {
        sh 'python3 -m venv venv'
        sh '. venv/bin/activate && make install'
      }
    }

    stage('Lint') {
      steps {
        sh '. venv/bin/activate && make lint'
      }
    }

    stage('Build docker') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }

      }
    }

    // stage('Scan image') {
    //   steps {
    //     aquaMicroscanner(imageName: 'docjibo/capstone', notCompliesCmd: 'exit 4', onDisallowed: 'ignore', outputFormat: 'html')
    //   }
    // }

    stage('Publish docker') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push("${env.GIT_COMMIT}")
            dockerImage.push("latest")
          }
        }

      }
    }
    stage('Deploy to Kubernetes') {
      steps {
        retry(3) {
          withAWS(region:'us-east-1',credentials:'awscreds') {
            sh 'echo "Deploy to Kube"'
            sh "aws eks --region us-east-1 update-kubeconfig --name capstone"
            sh 'sed -ie "s/latest/${GIT_COMMIT}/g" kubernetes/deployment.yml'
            sh "kubectl apply -f kubernetes/deployment.yml"
          }
        }
      }
    }
  }
}