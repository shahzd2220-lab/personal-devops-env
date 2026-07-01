pipeline {
  agent any

  environment {
    APP_NAME = 'personal-devops-env'
    APP_PORT = '8080'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'
      }
    }

    stage('Start App') {
      steps {
        sh '''
          nohup npm start > app.log 2>&1 &
          echo $! > app.pid
          sleep 5
        '''
      }
    }

    stage('Smoke Test') {
      steps {
        sh './scripts/smoke-test.sh http://localhost:8080'
      }
    }
  }

  post {
    always {
      sh '''
        if [ -f app.pid ]; then
          kill "$(cat app.pid)" || true
          rm -f app.pid
        fi
      '''
      archiveArtifacts artifacts: 'app.log', allowEmptyArchive: true
    }
  }
}
