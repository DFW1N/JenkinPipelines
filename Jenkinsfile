pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Get code from a GitHub repository
                git url: 'https://github.com/DFW1N/JenkinPipelines.git', branch: 'main',
                 credentialsId: 'github_credentials'
            }
        }
    }
}
