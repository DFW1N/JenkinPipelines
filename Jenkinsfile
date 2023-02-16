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
        
        stage("Connect to Azure") {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'AZURE_CLIENT_SECRET', usernameVariable: 'AZURE_CLIENT_ID', passwordVariable: 'AZURE_CLIENT_SECRET')
                ]) {
                    sh "az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT}"
                    sh "az account set --subscription ${AZURE_SUBSCRIPTION}"
                }
            }
        }
        
        stage("Search for Virtual Machines") {
            steps {
                sh "az vm list"
            }
        }
    }
}
