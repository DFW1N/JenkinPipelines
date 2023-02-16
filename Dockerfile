# Use an official Jenkins LTS release as the base image
FROM jenkins/jenkins:lts

# Set the user to root to allow for installing software
USER root

# Install any necessary packages using apt-get
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install the Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install HashiCorp Vault and Terraform
RUN curl -LO https://releases.hashicorp.com/vault/1.12.3/vault_1.12.3_linux_amd64.zip && \
    unzip vault_1.12.3_linux_amd64.zip && \
    mv vault /usr/local/bin/ && \
    rm vault_1.12.3_linux_amd64.zip && \
    curl -LO https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_amd64.zip && \
    unzip terraform_1.3.9_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.3.9_linux_amd64.zip

# Install plugins for Jenkins
RUN /usr/local/bin/install-plugins.sh \
    git \
    workflow-aggregator \
    ...

# Set the user back to the Jenkins user
USER jenkins

# Copy in any Jenkins configurations or scripts
COPY config.xml /var/jenkins_home/config.xml
COPY jobs/ /var/jenkins_home/jobs/

# Expose the Jenkins port
EXPOSE 8080

# Start Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
