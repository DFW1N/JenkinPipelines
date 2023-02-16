1. Log in to your Jenkins server and navigate to the Jenkins dashboard.
2. Click on "Manage Jenkins" and select "Manage Credentials". This will take you to the "Credentials" page.
3. Click on the "Global" domain and then click on "Add Credentials". This will open a new form to add new credentials.
4. In the "Kind" drop-down menu, select "Username with password". In the "Username" field, enter your GitHub username. In the "Password" field, enter your GitHub password.
5. In the "ID" field, enter a unique identifier for your GitHub credentials. This can be any string, but it should be something that helps you identify these credentials later.
6. In the "Description" field, enter a brief description of your credentials.
7. Click "OK" to save your credentials.
8. Now, create a new Jenkins job by clicking on "New Item" on the Jenkins dashboard.
9. In the job configuration page, give your job a name and select "Pipeline" as the job type.
10. In the "Pipeline" section, select "Pipeline script from SCM" as the Definition.
11. In the "SCM" section, select "Git" as the SCM type.
12. In the "Repositories" section, enter the HTTPS URL of your GitHub repository.
13. In the "Credentials" section, select the GitHub credentials that you added in Step 4.
14. Save your job configuration and run your job to confirm that your Jenkins job can access your GitHub repository using your credentials.
