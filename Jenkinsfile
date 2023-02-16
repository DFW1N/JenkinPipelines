pipeline {
    agent any

    environment {
        GITHUB_TOKEN = credentials('JenkinsPatToken')
    }

    stages {
        stage("Debug") {
            steps {
                script {
                    sh "sudo apt-get update && sudo apt-get install -y jq" // Install jq on Debian-based system

                    def azureTenant = sh(
                        returnStdout: true,
                        script: "curl -s -H \"Authorization: token ${GITHUB_TOKEN}\" ${env.GITHUB_SERVER_URL}/repos/${env.GITHUB_REPOSITORY}/actions/secrets/AZURE_TENANT | jq -r '.value'"
                    ).trim()
                    def azureClientID = sh(
                        returnStdout: true,
                        script: "curl -s -H \"Authorization: token ${GITHUB_TOKEN}\" ${env.GITHUB_SERVER_URL}/repos/${env.GITHUB_REPOSITORY}/actions/secrets/AZURE_CLIENT_ID | jq -r '.value'"
                    ).trim()
                    def azureClientSecret = sh(
                        returnStdout: true,
                        script: "curl -s -H \"Authorization: token ${GITHUB_TOKEN}\" ${env.GITHUB_SERVER_URL}/repos/${env.GITHUB_REPOSITORY}/actions/secrets/AZURE_CLIENT_SECRET | jq -r '.value'"
                    ).trim()
                    def azureSubscription = sh(
                        returnStdout: true,
                        script: "curl -s -H \"Authorization: token ${GITHUB_TOKEN}\" ${env.GITHUB_SERVER_URL}/repos/${env.GITHUB_REPOSITORY}/actions/secrets/AZURE_SUBSCRIPTION | jq -r '.value'"
                    ).trim()

                    def azureCreds = azureServicePrincipal(
                        tenantId: "${azureTenant}",
                        clientId: "${azureClientID}",
                        clientSecret: "${azureClientSecret}"
                    )

                    withCredentials([
                        azureCredentials(
                            credentialsId: "${azureSubscription}",
                            subscriptionId: "${azureSubscription}",
                            servicePrincipal: "${azureClientID}",
                            servicePrincipalSecret: "${azureClientSecret}",
                            tenantId: "${azureTenant}"
                        )
                    ]) {
                        sh 'az login --service-principal -u "${azureClientID}" -p "${azureClientSecret}" --tenant "${azureTenant}"'
                        sh 'az account show'
                    }
                }
            }
        }
    }
}
