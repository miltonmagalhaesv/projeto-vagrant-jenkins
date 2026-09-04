pipeline {
  agent any

  stages {
    stage('Instalar dependencias') {
      steps {
        dir('app') {
          sh 'npm ci'
        }
      }
    }

    stage('Testar') {
      steps {
        dir('app') {
          sh 'npm test'
        }
      }
    }

    stage('Build') {
      steps {
        dir('app') {
          sh 'npm run build'
        }
      }
    }
  }
}
