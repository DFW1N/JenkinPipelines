pipeline {
    agent any
    
    environment {
        AZURE_SUBSCRIPTION = credentials('AZURE_SUBSCRIPTION')
        AZURE_TENANT = credentials('AZURE_TENANT')
        AZURE_CLIENT_ID = credentials('AZURE_CLIENT_ID')
        AZURE_CLIENT_SECRET = credentials('AZURE_CLIENT_SECRET')
    }
    
    stages {
        
         stage("Debug") {
            steps {
                sh "echo AZURE_TENANT = ${AZURE_TENANT}"
            }
        }
        
}
