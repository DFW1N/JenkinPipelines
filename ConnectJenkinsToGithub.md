1. Generate an SSH key pair on your Jenkins server using the following command:

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```


This will create a new SSH key pair in your Jenkins user's home directory (`~/.ssh`), with the default name and location. If you want to use a different name or location, you can specify it when prompted.

2. Copy the public key (`id_rsa.pub`) to your GitHub account. Go to your GitHub account settings, click on "SSH and GPG keys", and then click on "New SSH key". Enter a title for your SSH key and paste the contents of the `id_rsa.pub` file into the "Key" field.

3. Add the private key (`id_rsa`) to Jenkins. Navigate to the Jenkins dashboard, click on "Manage Jenkins", and then click on "Manage Credentials". Click on the "Global" domain and then click on "Add Credentials". In the "Kind" drop-down menu, select "SSH Username with private key". In the "Username" field, enter your GitHub username. In the "Private Key" field, enter the contents of the `id_rsa` file. In the "ID" field, enter a unique identifier for your GitHub credentials. In the "Description" field, enter a brief description of your credentials. Click "OK" to save your credentials.

4. Create a new Jenkins job by clicking on "New Item" on the Jenkins dashboard. In the job configuration page, give your job a name and select "Pipeline" as the job type.

5. In the "Pipeline" section, select "Pipeline script from SCM" as the Definition.

6. In the "SCM" section, select "Git" as the SCM type.

7. In the "Repositories" section, enter the SSH URL of your GitHub repository. For example:

```bash
https://github.com/DFW1N/JenkinPipelines
```

8. In the "Credentials" section, select the GitHub credentials that you added in Step 3.

9. Save your job configuration and run your job to confirm that your Jenkins job can access your GitHub repository using your SSH key.

Note that you may need to adjust your GitHub repository settings to enable SSH access, and that you should make sure your SSH key has appropriate permissions (e.g. 0600) to keep it secure.
