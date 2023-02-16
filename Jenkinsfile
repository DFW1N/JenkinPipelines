pipeline {
    agent any
    
    stages {
        stage("Debug") {
            steps {
                withCredentials([string(credentialsId: 'AZURE_TENANT', variable: 'AZURE_TENANT'),
                                  string(credentialsId: 'AZURE_CLIENT_ID', variable: 'AZURE_CLIENT_ID'),
                                  string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'AZURE_CLIENT_SECRET'),
                                  string(credentialsId: 'AZURE_SUBSCRIPTION', variable: 'AZURE_SUBSCRIPTION')]) {
                    sh "echo AZURE_TENANT = ${AZURE_TENANT}"
                }
            }
        }
    }
}
