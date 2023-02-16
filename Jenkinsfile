pipeline {
    agent any

    environment {
        GITHUB_TOKEN = credentials('JenkinsPatToken')
    }

    stages {
        stage("Debug") {
            steps {
                withCredentials([
                    string(credentialsId: 'AZURE_TENANT', variable: 'AZURE_TENANT'),
                    string(credentialsId: 'AZURE_CLIENT_ID', variable: 'AZURE_CLIENT_ID'),
                    string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'AZURE_CLIENT_SECRET'),
                    string(credentialsId: 'AZURE_SUBSCRIPTION', variable: 'AZURE_SUBSCRIPTION'),
                    usernamePassword(
                        credentialsId: 'AZURE_SP',
                        usernameVariable: 'AZURE_SP_ID',
                        passwordVariable: 'AZURE_SP_SECRET'
                    )
                ]) {
                    script {
                        def azureCreds = azureServicePrincipal(
                            tenantId: "${AZURE_TENANT}",
                            clientId: "${AZURE_CLIENT_ID}",
                            clientSecret: "${AZURE_CLIENT_SECRET}"
                        )

                        withCredentials([
                            azureCredentials(
                                credentialsId: "${AZURE_SUBSCRIPTION}",
                                subscriptionId: "${AZURE_SUBSCRIPTION}",
                                servicePrincipal: "${AZURE_SP_ID}",
                                servicePrincipalSecret: "${AZURE_SP_SECRET}",
                                tenantId: "${AZURE_TENANT}"
                            )
                        ]) {
                            sh 'az login --service-principal -u "${AZURE_SP_ID}" -p "${AZURE_SP_SECRET}" --tenant "${AZURE_TENANT}"'
                            sh 'az account show'
                        }
                    }
                }
            }
        }
    }
}
