pipeline {
    agent any

    environment {
        GITHUB_TOKEN = credentials('JenkinsPatToken')
    }

    stages {
        stage("Debug") {
            steps {
                script {

                    def azureTenant = sh(
                        returnStdout: true,
                        script: "curl -s -H \"Authorization: token ${GITHUB_TOKEN}\" ${env.GITHUB_SERVER_URL}/repos/${env.GITHUB_REPOSITORY}/actions/secrets/AZURE_TENANT | grep -o '\"key\": \".*\"' | cut -d '\"' -f 4"
                    ).trim()
                    def azureClientID = sh(
                        returnStdout: true,
                        script: "curl -s -H \"Authorization: token ${GITHUB_TOKEN}\" ${env.GITHUB_SERVER_URL}/repos/${env.GITHUB_REPOSITORY}/actions/secrets/AZURE_CLIENT_ID | grep -o '\"key\": \".*\"' | cut -d '\"' -f 4"
                    ).trim()
                    def azureClientSecret = sh(
                        returnStdout: true,
                        script: "curl -s -H \"Authorization: token ${GITHUB_TOKEN}\" ${env.GITHUB_SERVER_URL}/repos/${env.GITHUB_REPOSITORY}/actions/secrets/AZURE_CLIENT_SECRET | grep -o '\"key\": \".*\"' | cut -d '\"' -f 4"
                    ).trim()
                    def azureSubscription = sh(
                        returnStdout: true,
                        script: "curl -s -H \"Authorization: token ${GITHUB_TOKEN}\" ${env.GITHUB_SERVER_URL}/repos/${env.GITHUB_REPOSITORY}/actions/secrets/AZURE_SUBSCRIPTION | grep -o '\"key\": \".*\"' | cut -d '\"' -f 4"
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
