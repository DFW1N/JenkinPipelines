pipeline {
    agent any
    
    environment {
        AZURE_SUBSCRIPTION = "${GITHUB_SECRET_NAME_AZURE_SUBSCRIPTION}"
        AZURE_TENANT = "${GITHUB_SECRET_NAME_AZURE_TENANT}"
        AZURE_CLIENT_ID = "${GITHUB_SECRET_NAME_AZURE_CLIENT_ID}"
        AZURE_CLIENT_SECRET = "${GITHUB_SECRET_NAME_AZURE_CLIENT_SECRET}"
        GITHUB_SECRET = credentials('JenkinsPatToken')
    }
    
    stages {
        stage("Debug") {
            steps {
                sh "echo AZURE_TENANT = ${AZURE_TENANT}"
                sh "echo GITHUB_SECRET = ${GITHUB_SECRET}"
            }
        }
        stage("List Azure VMs") {
            steps {
                script {
                    sh "az vm list"                
                    debug "Virtual machine search completed successfully"
                }
            }
        }
    }
}
