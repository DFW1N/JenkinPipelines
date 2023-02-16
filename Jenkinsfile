pipeline {
    agent any
 
    tools {
        // Install Azure CLI tool
        azureCli 'Azure CLI'
    }
    
    environment {
        AZURE_SUBSCRIPTION = "${GITHUB_SECRET_NAME_AZURE_SUBSCRIPTION}"
        AZURE_TENANT = "${GITHUB_SECRET_NAME_AZURE_TENANT}"
        AZURE_CLIENT_ID = "${GITHUB_SECRET_NAME_AZURE_CLIENT_ID}"
        AZURE_CLIENT_SECRET = "${GITHUB_SECRET_NAME_AZURE_CLIENT_SECRET}"
    }
    
    stages {
        stage("Debug") {
            steps {
                sh "echo AZURE_TENANT = ${AZURE_TENANT}"
            }
        }
        stage("List Azure VMs") {
            steps {
                script {
                    def azCliPath = tool 'Azure CLI'
                    withEnv(["PATH+AZCLI=${azCliPath}/bin"]) {
                        sh "az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT}"
                        sh "az account set --subscription ${AZURE_SUBSCRIPTION}"
                        sh "az vm list"
                    }
                }
            }
        }
    }
}
