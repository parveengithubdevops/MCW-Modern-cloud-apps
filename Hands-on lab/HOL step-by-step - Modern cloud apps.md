![Microsoft Cloud Workshops](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
Modern cloud apps
</div>

<div class="MCWHeader2">
Hands-on lab step-by-step
</div>

<div class="MCWHeader3">
May 2021
</div>

Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2021 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.

**Contents**

<!-- TOC -->
- [Modern cloud apps hands-on lab step-by-step](#modern-cloud-apps-hands-on-lab-step-by-step)
  - [Abstract and learning objectives](#abstract-and-learning-objectives)
  - [Overview](#overview)
  - [Solution architecture](#solution-architecture)
  - [Requirements](#requirements)
  - [Help references](#help-references)
  - [Exercise 1: Create Key Vault secrets and add to App Configuration](#exercise-1-create-key-vault-secrets-and-add-to-app-configuration)
    - [Task 1: Retrieve database connection string](#task-1-retrieve-database-connection-string)
    - [Task 2: Retrieve Storage Account access key](#task-2-retrieve-storage-account-access-key)
    - [Task 3: Retrieve Service Bus Queue connection string](#task-3-retrieve-service-bus-queue-connection-string)
    - [Task 4: Create secrets in Azure Key Vault](#task-4-create-secrets-in-azure-key-vault)
    - [Task 5: Centralize secrets for multiple projects using an App Configuration store](#task-5-centralize-secrets-for-multiple-projects-using-an-app-configuration-store)
  - [Exercise 2: Deploy e-commerce website](#exercise-2-deploy-e-commerce-website)
    - [Task 1: Configure SQL Database firewall](#task-1-configure-sql-database-firewall)
    - [Task 2: Connect to the Lab VM](#task-2-connect-to-the-lab-vm)
    - [Task 3: Open the Contoso Sports League starter solution in Visual Studio](#task-3-open-the-contoso-sports-league-starter-solution-in-visual-studio)
    - [Task 4: Configure the e-commerce Web App in Visual Studio](#task-4-configure-the-e-commerce-web-app-in-visual-studio)
    - [Task 5: Publish the web app to Azure](#task-5-publish-the-web-app-to-azure)
  - [Exercise 3: Setup SQL Database Geo-Replication](#exercise-3-setup-sql-database-geo-replication)
    - [Task 1: Add secondary database](#task-1-add-secondary-database)
    - [Task 2: Configure secondary SQL Database firewall](#task-2-configure-secondary-sql-database-firewall)
    - [Task 3: Setup SQL Failover Group](#task-3-setup-sql-failover-group)
    - [Task 4: Update database connection string to use failover listener endpoint](#task-4-update-database-connection-string-to-use-failover-listener-endpoint)
    - [Task 5: Failover SQL Database Failover Group](#task-5-failover-sql-database-failover-group)
    - [Task 6: Test e-commerce Web App after Failover](#task-6-test-e-commerce-web-app-after-failover)
  - [Exercise 4: Deploy the Call Center admin website](#exercise-4-deploy-the-call-center-admin-website)
    - [Task 1: Provision a Web App](#task-1-provision-a-web-app)
    - [Task 2: Update the configuration in the starter project](#task-2-update-the-configuration-in-the-starter-project)
    - [Task 3: Add a managed identity and set a Key Vault access policy](#task-3-add-a-managed-identity-and-set-a-key-vault-access-policy)
    - [Task 4: Configure and deploy the call center admin Web App from Visual Studio](#task-4-configure-and-deploy-the-call-center-admin-web-app-from-visual-studio)
  - [Exercise 5: Deploy the payment gateway](#exercise-5-deploy-the-payment-gateway)
    - [Task 1: Provision the payment gateway API App](#task-1-provision-the-payment-gateway-api-app)
    - [Task 2: Deploy the Payment Gateway from Visual Studio](#task-2-deploy-the-payment-gateway-from-visual-studio)
  - [Exercise 6: Deploy the Offers Web API](#exercise-6-deploy-the-offers-web-api)
    - [Task 1: Provision the Offers Web API App](#task-1-provision-the-offers-web-api-app)
    - [Task 2: Configure Cross-Origin Resource Sharing (CORS)](#task-2-configure-cross-origin-resource-sharing-cors)
    - [Task 3: Update the configuration in the starter project](#task-3-update-the-configuration-in-the-starter-project)
    - [Task 4: Add a managed identity and set a Key Vault access policy](#task-4-add-a-managed-identity-and-set-a-key-vault-access-policy)
    - [Task 5: Deploy the Offers app from Visual Studio](#task-5-deploy-the-offers-app-from-visual-studio)
  - [Exercise 7: Add API endpoint configuration settings](#exercise-7-add-api-endpoint-configuration-settings)
    - [Task 1: Add the API endpoint configuration settings](#task-1-add-the-api-endpoint-configuration-settings)
    - [Task 2: Validate App Settings are correct](#task-2-validate-app-settings-are-correct)
  - [Exercise 8: Identity and Security](#exercise-8-identity-and-security)
    - [Task 1: Enable Azure AD Premium Trial](#task-1-enable-azure-ad-premium-trial)
    - [Task 2: Create a new Contoso user](#task-2-create-a-new-contoso-user)
    - [Task 3: Configure access control for the call center administration Web Application](#task-3-configure-access-control-for-the-call-center-administration-web-application)
    - [Task 4: Apply custom branding for the Azure Active Directory logon page](#task-4-apply-custom-branding-for-the-azure-active-directory-logon-page)
    - [Task 5: Verify the branding has been successfully applied to the Azure Active Directory logon page](#task-5-verify-the-branding-has-been-successfully-applied-to-the-azure-active-directory-logon-page)
  - [Exercise 9: Enable Azure B2C for customer site](#exercise-9-enable-azure-b2c-for-customer-site)
    - [Task 1: Create a new directory](#task-1-create-a-new-directory)
    - [Task 2: Add a new application](#task-2-add-a-new-application)
    - [Task 3: Create Policies, Sign up and sign in](#task-3-create-policies-sign-up-and-sign-in)
    - [Task 4: Create a profile editing policy](#task-4-create-a-profile-editing-policy)
    - [Task 5: Create a password reset policy](#task-5-create-a-password-reset-policy)
    - [Task 6: Modify the Contoso.App.SportsLeague.Web](#task-6-modify-the-contosoappsportsleagueweb)
    - [Task 7: Send authentication requests to Azure AD](#task-7-send-authentication-requests-to-azure-ad)
    - [Task 8: Display user information](#task-8-display-user-information)
    - [Task 9: Update App Service configuration](#task-9-update-app-service-configuration)
    - [Task 10: Run the sample app](#task-10-run-the-sample-app)
  - [Exercise 10: Enabling Telemetry with Application Insights](#exercise-10-enabling-telemetry-with-application-insights)
    - [Task 1: Add Application Insights Telemetry to the e-commerce website project](#task-1-add-application-insights-telemetry-to-the-e-commerce-website-project)
    - [Task 2: Enable client side telemetry](#task-2-enable-client-side-telemetry)
    - [Task 3: Deploy the e-commerce Web App from Visual Studio](#task-3-deploy-the-e-commerce-web-app-from-visual-studio)
    - [Task 4: View the Application Insights logs](#task-4-view-the-application-insights-logs)
  - [Exercise 11: Automating backend processes with Azure Functions and Logic Apps](#exercise-11-automating-backend-processes-with-azure-functions-and-logic-apps)
    - [Task 1: Create an Azure Function to Generate PDF Receipts](#task-1-create-an-azure-function-to-generate-pdf-receipts)
    - [Task 2: Add Key Vault access using a managed identity](#task-2-add-key-vault-access-using-a-managed-identity)
    - [Task 3: Configure and deploy the Function App](#task-3-configure-and-deploy-the-function-app)
    - [Task 4: Create an Azure Logic App to Process Orders](#task-4-create-an-azure-logic-app-to-process-orders)
    - [Task 5: Use Twilio to send SMS Order Notifications](#task-5-use-twilio-to-send-sms-order-notifications)
  - [Exercise 12: Automate deployments using GitHub actions](#exercise-12-automate-deployments-using-github-actions)
    - [Task 1: Create a GitHub repository](#task-1-create-a-github-repository)
    - [Task 2: Commit the existing lab files to source control](#task-2-commit-the-existing-lab-files-to-source-control)
    - [Task 3: Create a service principal in Active Directory](#task-3-create-a-service-principal-in-active-directory)
    - [Task 4: Create repository secrets](#task-4-create-repository-secrets)
    - [Task 5: Define the production deployment workflow](#task-5-define-the-production-deployment-workflow)
    - [Task 6: Trigger the Production Deployment Workflow](#task-6-trigger-the-production-deployment-workflow)
  - [After the hands-on lab](#after-the-hands-on-lab)
    - [Task 1: Delete resources](#task-1-delete-resources)

<!-- /TOC -->

# Modern cloud apps hands-on lab step-by-step

## Abstract and learning objectives

In this hands-on lab, you will be challenged to implement an end-to-end scenario using a supplied sample that is based on Azure App Services, Microsoft Azure Functions, Azure SQL Database, Azure Logic Apps, and related services. The scenario will include implementing compute, storage, workflows, and monitoring, using various components of Microsoft Azure.

Please note that as opposed to the Whiteboard Design Session, the lab is not focused on maintaining PCI compliance and using more advanced security features such as App Service Environment, Network Security Groups, and Application Gateway. The hands-on lab can be implemented on your own, but it is highly recommended to pair up with other members at the lab to model a real-world experience and to allow each member to share their expertise for the overall solution.

By the end of this hands-on lab, you will have learned how to use several key services within Azure to improve overall functionality of the original solution, and to increase the security and scalability of the new and improved design.

## Overview

The Contoso Sports League Association (CSLA) is one of the largest sports franchises and is struggling to keep up with demand from their growing user base. They currently host an e-commerce website and have a backend website that supports their call center, allowing employees to view order information.

CSLA would like to modernize their websites and move to the cloud, ultimately moving away from managing infrastructure. They are interested in whether Platform-as-a-Service (PaaS) will meet their needs so they can completely remove the infrastructure management overhead. However, they are concerned about securing their websites and data to meet the stringent PCI (Payment Card Industry) compliance requirements.

## Solution architecture

![A diagram that depicts the various Azure PaaS services for the solution. Azure AD Org is used for authentication to the call center app. Azure AD B2C for authentication is used for authentication to the client app. SQL Database for the backend customer data. Azure App Services for the web and API apps. Order processing includes using Functions, Logic Apps, Queues and Storage. Azure App Insights is used for telemetry capture.](media/image2.png "Solution Architecture Diagram")

## Requirements

1. Microsoft Azure subscription
2. Local machine or a virtual machine configured with Visual Studio 2019 Community Edition
3. Twilio account and/or personal cell phone to setup a trial Twilio account
4. A GitHub account and local installation of a Git client

## Help references

| Description | Links |
|---------|-------------|
| SQL firewall | <https://azure.microsoft.com/documentation/articles/sql-database-configure-firewall-settings/> |
| Deploying a Web App | <https://azure.microsoft.com/documentation/articles/web-sites-deploy/> |
| Deploying an API app | <https://azure.microsoft.com/documentation/articles/app-service-dotnet-deploy-api-app/> |
| Accessing an API app from a JavaScript client | <https://azure.microsoft.com/documentation/articles/app-service-api-javascript-client/> |
| SQL Database Geo-Replication overview | <https://azure.microsoft.com/documentation/articles/sql-database-geo-replication-overview/> |
| What is Azure AD? | <https://azure.microsoft.com/documentation/articles/active-directory-whatis/> |
| Azure Web Apps authentication | <http://azure.microsoft.com/blog/2014/11/13/azure-websites-authentication-authorization/> |
| View your access and usage reports | <https://msdn.microsoft.com/library/azure/dn283934.aspx> |
| Custom branding an Azure AD Tenant | <https://msdn.microsoft.com/library/azure/Dn532270.aspx> |
| Service Principal Authentication | <https://docs.microsoft.com/azure/app-service-api/app-service-api-dotnet-service-principal-auth> |
| Consumer Site B2C | <https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-devquickstarts-web-dotnet> |
| Getting Started with Active Directory B2C | <https://azure.microsoft.com/trial/get-started-active-directory-b2c/> |
| How to Delete an Azure Active Directory | <https://blog.nicholasrogoff.com/2017/01/20/how-to-delete-an-azure-active-directory-add-tenant/> |
| Run performance tests on your app | <http://blogs.msdn.com/b/visualstudioalm/archive/2015/09/15/announcing-public-preview-for-performance-load-testing-of-azure-webapp.aspx> |
| Application Insights Custom Events | <https://azure.microsoft.com/documentation/articles/app-insights-api-custom-events-metrics/> |
| Enabling Application Insights | <https://azure.microsoft.com/documentation/articles/app-insights-start-monitoring-app-health-usage/> |
| Detect failures | <https://azure.microsoft.com/documentation/articles/app-insights-asp-net-exceptions/> |
| Monitor performance problems | <https://azure.microsoft.com/documentation/articles/app-insights-web-monitor-performance/> |
| Creating a Logic App | <https://azure.microsoft.com/documentation/articles/app-service-logic-create-a-logic-app/> |
| Logic app connectors | <https://azure.microsoft.com/documentation/articles/app-service-logic-connectors-list/> |
| Logic Apps Docs | <https://docs.microsoft.com/azure/logic-apps/logic-apps-what-are-logic-apps> |
| Azure Functions -- create first function | <https://docs.microsoft.com/azure/azure-functions/functions-create-first-azure-function> |
| Azure Functions docs | <https://docs.microsoft.com/azure/logic-apps/logic-apps-azure-functions> |
| Deploy to Azure with GitHub Actions | <https://docs.microsoft.com/azure/developer/github/github-actions> |

## Exercise 1: Create Key Vault secrets and add to App Configuration

**Duration**: 15 minutes

In this exercise, you retrieve various keys and connection string from resources in the **hands-on-lab-SUFFIX** resource group and use them to create secrets in Key Vault. You will first copy connection string and keys into a text editor, such as Notepad.exe, for easier reference when creating secrets in Key Vault. You finish the exercise by adding references to the Key Vault into the App Configuration resource.

### Task 1: Retrieve database connection string

In this task, you retrieve the connection string for the ContosoSports DB SQL Database, set the password, and save it to a text editor, such as Notepad.exe.

1. In the [Azure portal](https://portal.azure.com), select **Resource groups** from the Azure services list.

   ![Resource groups is highlighted in the Azure services list.](media/azure-services-resource-groups.png "Azure services")

2. Select the **hands-on-lab-SUFFIX** resource group from the list.

   ![The "hands-on-lab-SUFFIX" resource group is highlighted.](./media/resource-groups.png "Resource groups list")

3. In the list of resources within your resource group, select the **ContosoSportsDB** SQL database resource.

   ![The list of resources in the hands-on-lab-SUFFIX resource group are displayed, and ContosoSportsDB is highlighted.](./media/resource-group-resources-sql-db.png "ContosoSportsDB in resource group list")

4. On the **SQL Database** blade, select the **Show database connection strings** link within the Essentials area.

    ![On the SQL Database blade, in the left pane, Overview is selected. In the right pane, under Essentials, the Connection strings (Show database connection strings) link is circled.](media/sql-db-connection-strings-link.png "SQL Database blade")

5. On the **Connection strings** blade, select the **Copy to clipboard** icon in the bottom right-hand corner of the `ADO.NET` connection string box.

    ![In the Database connection strings blade, the ADO.NET connection string is circled.](media/sql-db-connection-string-ado-net.png "Database connection strings blade")

6. Paste the copied connection string into a text editor, such as **Notepad.exe** and then replace the `{your_password}` token with `Password.1!!`.

7. In the tasks below, you will be copying additional values into the text editor, so you can have easy access to these values for creating secrets in Key Vault later in this hand-on lab. Leave the text editor open.

### Task 2: Retrieve Storage Account access key

In this task, you retrieve the access key for your Azure Storage account and save it to a text editor, such as Notepad.exe.

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **contoso** Storage account resource from the list.

    ![The storage account resource is highlighted in the hands-on-lab-SUFFIX resource group.](media/resource-group-resources-storage-account.png "Storage account resource")

2. On the **Storage account** blade, select the **Access keys** in the left-hand navigation menu, and on the **Access keys** blade, select the **Show keys** and then copy the **key1** **Key** value by selecting the **Copy to clipboard** icon.

    ![The Access keys blade is displayed, with Access keys highlighted in the left-hand menu and the copy to clipboard icon highlighted next to the key1 Key value.](media/storage-account-access-keys.png "Storage account access keys")

3. Paste the copied value into your open text editor for later reference, as you did with the database connection string above.

### Task 3: Retrieve Service Bus Queue connection string

In this task, you retrieve the primary connection string for the `receiptgenerator` Service Bus queue and save it to a text editor, such as Notepad.exe.

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **Service Bus Namespace** resource from the list.

    ![The Service Bus Namespace resource is highlighted in the hands-on-lab-SUFFIX resource group.](media/resource-group-resources-service-bus-namespace.png "Service Bus Namespace resource")

2. On the Service Bus Namespace blade, select **Queues** from the left-hand navigation menu, under the Entities header, and then select the `receiptgenerator` queue.

    ![On the Queues blade, the Queues item is highlighted in the left-hand menu and the receiptgenerator queue is highlighted.](media/service-bus-queues-receipt-generator.png "Queues")

3. On the `receiptgenerator` Service Bus Queue blade, select **Shared access policies** in the left-hand navigation menu and then select the **Publisher** policy.

    ![On the Shared access policies blade, Shared access policies in highlighted in the left-hand navigation menu and the Publisher policy is highlighted in the list of policies.](media/service-bus-queues-shared-access-policies.png "Shared access policies")

    >**Note**: The _Publisher_ and _Listener_ shared access policies for the Azure Service Bus Queue were deployed as part of the ARM Template that was used to setup the lab environment. Notice the **Publisher** policy only has permissions to _Send_ messages to the queue.
    >
    > By default, no policies are created. Additionally, it is best practice to use least privilege security to create separate shared access policies for publishers sending messages and listeners receiving messages from the queue.

4. On the **SAS Policy: Publisher** dialog, copy the **Primary Connection String** by selecting the **Copy to clipboard** icon.

    ![The copy to clipboard icon is highlighted next to the primary connection string on the SAS Policy: Publisher dialog.](media/service-bus-queues-sas-policy-publisher.png "SAS Policy: Publisher")

5. Paste the copied value into your open text editor for later reference, as you did with the database connection string above.

### Task 4: Create secrets in Azure Key Vault

In this task, you create secrets in Key Vault for each of the connection strings and keys you retrieved in the tasks above.

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **Key vault** resource from the list.

    ![The Key Vault resource is highlighted in the hands-on-lab-SUFFIX resource group.](media/resource-group-resources-key-vault.png "Key Vault resource")

2. Select **Secrets** from the left-hand navigation menu and then select **Generate/Import**.

    ![The Secrets item in highlighted in the left-hand menu and Generate/Import is highlighted on the Secrets blade.](media/key-vault-secrets.png "Key Vault Secrets")

3. You will create three secrets in Key Vault, using the values you copied into your text editor. The secrets will be named according to the table below:

    | Name | Value |
    |------|-------|
    | AzureQueueConnectionString | Use the primary connection string you recorded for the Service Bus `receiptgenerator` queue |
    | ContosoSportsLeague | Use the database connection string |
    | contososportsstorage | Use the primary connection string you recorded for the storage account |

4. On the **Create a secret** blade, enter the following:

    - **Name**: Enter `AzureQueueConnectionString`.
    - **Value**: Paste the Service Bus queue primary connection string value into this box.

    > The remaining settings will retain their default values.

    ![The Create a secret form is displayed with the Name and Value fields highlighted.](media/key-vault-create-a-secret.png "Create a secret")

5. Select **Create**.

6. Select **Generate/Import** again and repeat steps 4 and 5 for the remaining two secrets specified in the table above, replacing the name and value settings with appropriate values.

7. You should end up with three secrets in Key Vault.

    ![The list of newly created secrets in Key Vault is displayed.](media/key-vault-secrets-list.png "Key Vault secrets")

### Task 5: Centralize secrets for multiple projects using an App Configuration store

The Contoso Sports solution contains multiple projects, each of which access the same Azure resources. In this task, you centralize the configuration of the solution applications via the deployed Azure **App Configuration** resource.

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **App Configuration** resource from the list.

    ![The App Configuration resource is highlighted in the hands-on-lab-SUFFIX resource group.](media/resource-group-resources-app-configuration.png "App Configuration resource")

2. Select **Configuration explorer** from the left-hand navigation menu and then select **Create** and **Key Vault reference**.

    ![Configuration explorer is highlighted in the left-hand menu and Create --> Key Vault reference is highlighted on the Configuration explorer blade.](media/app-configuration-explorer.png "Configuration explorer")

3. You will add a Key Vault reference for each of the three secrets you created in the previous task. The configuration values will be named according to the table below:

    | Key | Secret |
    |-----|--------|
    | ConnectionStrings:ReceiptQueue | Select **AzureQueueConnectionString** |
    | ConnectionStrings:ReceiptStorage | Select **contososportsstorage** |
    | ConnectionStrings:SportsDB | Select **ContosoSportsLeague** |

4. On the **Create** dialog, enter the following:

    - **Key**: Enter `ConnectionStrings:ReceiptQueue`.
    - **Subscription**: Select the subscription you are using for this hands-on lab.
    - **Resource group**: Select the **hands-on-lab-SUFFIX** resource group.
    - **Key Vault**: Choose the **key-vault-UNIQUE-ID** Key Vault resource.
    - **Secret**: Select the secret named `AzureQueueConnectionString`.

    ![The Create new Key vault reference form is displayed populated with the ConnectionStrings:ReceiptQueue values.](media/app-configuration-create-key-vault-reference.png "The create new key vault reference form")

5. Select **Apply** on the Create dialog.

6. Select **Create --> Key Vault reference** again and repeat steps 4 and 5 for the remaining two keys specified in the table above, populating the **Key** and **Secret** fields with appropriate values.

## Exercise 2: Deploy e-commerce website

Duration: 15 minutes

In this exercise, you deploy the Contoso web app and provide the necessary configuration to display the e-commerce website.

### Task 1: Configure SQL Database firewall

In this task, you set up access to the Azure SQL Database from your local machine.

1. In the [Azure portal](https://portal.azure.com), select **Resource groups** from the Azure services list.

   ![Resource groups is highlighted in the Azure services list.](media/azure-services-resource-groups.png "Azure services")

2. Select the **hands-on-lab-SUFFIX** resource group from the list.

   ![The "hands-on-lab-SUFFIX" resource group is highlighted.](./media/resource-groups.png "Resource groups list")

3. In the list of resources within your resource group, select the **contososports** SQL Server resource.

   ![The list of resources in the hands-on-lab-SUFFIX resource group are displayed, and contososports SQL Server resource is highlighted.](./media/resource-group-resources-sql-server.png "ContosoSports SQL Server in resource group list")

4. On the **Overview** blade for the **SQL Server** resource, select the **Show firewall settings** in the Essentials area.

    ![On the SQL Server Overview screen with the Show firewall settings link highlighted.](media/sql-server-overview-show-firewall-settings.png "SQL Server Overview")

5. On the **Firewalls and virtual networks** blade, select **Add client IP** from the toolbar.

    ![The Add client IP button is highlighted on the firewalls and virtual networks toolbar.](media/sql-server-firewall-toolbar-add-client-ip.png "Add client IP")

6. A new rule will be generated that contains your client IP address for the **Start IP** and **End IP**. This allows you to connect to the database from your machine.

    ![Screenshot of the Rule name, Start IP. and End IP fields on the Firewall Settings blade.](media/sql-server-client-ip-rule.png "Firewall rule")

7. Select **Save** on the toolbar.

    ![Screenshot of the Firewall settings Save button.](media/sql-server-firewall-toolbar-save.png "Firewall settings Save button")

8. Select **OK** on the **Success** dialog when it appears.

    ![The success dialog for updating the server firewall rules is displayed and the OK button is highlighted.](media/sql-server-firewall-save-success.png "Success")

### Task 2: Connect to the Lab VM

In this task, you create an RDP connection to your Lab virtual machine (VM).

1. In the [Azure portal](https://portal.azure.com), select **Resource groups** from the Azure services list.

   ![Resource groups is highlighted in the Azure services list.](media/azure-services-resource-groups.png "Azure services")

2. Select the **hands-on-lab-SUFFIX** resource group from the list.

   ![The "hands-on-lab-SUFFIX" resource group is highlighted.](./media/resource-groups.png "Resource groups list")

3. In the list of resources within your resource group, select the **LabVM Virtual machine** resource.

   ![The list of resources in the hands-on-lab-SUFFIX resource group are displayed, and LabVM is highlighted.](./media/resource-group-resources-labvm.png "LabVM in resource group list")

4. On your LabVM blade, select **Connect** and **RDP** from the top menu.

   ![The LabVM blade is displayed, with the Connect button highlighted in the top menu.](./media/connect-vm-rdp.png "Connect to Lab VM")

5. On the Connect to virtual machine blade, select **Download RDP File**, then open the downloaded RDP file.

   ![The Connect to virtual machine blade is displayed, and the Download RDP File button is highlighted.](./media/connect-to-virtual-machine.png "Connect to virtual machine")

6. Select **Connect** on the Remote Desktop Connection dialog.

   ![In the Remote Desktop Connection Dialog Box, the Connect button is highlighted.](./media/remote-desktop-connection.png "Remote Desktop Connection dialog")

7. Enter the following credentials when prompted, and then select **OK**:

   - **User name**: demouser
   - **Password**: Password.1!!

   ![The credentials specified above are entered into the Enter your credentials dialog.](media/rdc-credentials.png "Enter your credentials")

8. Select **Yes** to connect if prompted that the remote computer's identity cannot be verified.

   ![In the Remote Desktop Connection dialog box, a warning states that the remote computer's identity cannot be verified and asks if you want to continue anyway. At the bottom, the Yes button is highlighted.](./media/remote-desktop-connection-identity-verification-labvm.png "Remote Desktop Connection dialog")

### Task 3: Open the Contoso Sports League starter solution in Visual Studio

1. On the LabVM, open File Explorer and navigate to the `C:\MCW\MCW-Modern-cloud-apps-master\Hands-on lab\lab-files\src\Contoso Sports League` folder.

2. From the **Contoso Sports League** folder, open the Visual Studio solution by double-clicking on the `Contoso.Apps.SportsLeague.sln` file.

3. If prompted about how to open the file, select **Visual Studio 2019** and then select **OK**.

   ![Visual Studio 2019 is highlighted in the How do you want to open this file? dialog.](media/solution-file-open-with.png "Visual Studio 2019")

4. Sign in to Visual Studio using your Azure account credentials.

   ![The Sign in button is highlighted on the Visual Studio Welcome screen.](media/visual-studio-sign-in.png "Visual Studio 2019")

5. If prompted with a security warning, uncheck **Ask me for every project in this solution**, and then select **OK**.

6. Using the Visual Studio Solution Explorer, expand each of the folders and notice the solution contains the following projects:

    | Project | Description |
    |:----------|:-------------|
    | Contoso.Apps.SportsLeague.Web |   Contoso Sports League e-commerce application |
    | Contoso.Apps.SportsLeague.Admin |   Contoso Sports League call center admin application |
    | Contoso.Apps.Common  |   Shared tier |
    | Contoso.Apps.SportsLeague.Data  |   Shared tier |
    | Contoso.Apps.FunctionApp  |   Function app tier |
    | Contoso.Apps.SportsLeague.Offers |  API for returning list of available products |
    | Contoso.Apps.PaymentGateway   |     API for payment processing |

   ![The projects contained within the solution are displayed in the Visual Studio Solution Explorer.](media/visual-studio-solution.png "Contoso.Apps.SportsLeague solution files")

### Task 4: Configure the e-commerce Web App in Visual Studio

1. Navigate to the `Contoso.Apps.SportsLeague.Web` project located in the **Web** folder using the **Solution Explorer** of Visual Studio.

    ![The Web project is highlighted in Visual Studio Solution Explorer.](media/visual-studio-web-app.png "Solution Explorer")

2. Right-click the `Contoso.Apps.SportsLeague.Web` project, and select **Manage NuGet Packages** from the context menu.

3. Select the **Browse** tab, and search for **Microsoft.Azure.AppConfiguration.AspNetCore**.

4. Select **Microsoft.Azure.AppConfiguration.AspNetCore** from the search results, and in the next pane, select **Install** to install the latest stable version.

    ![The NuGet Package Manager windows is displayed with the Browse tab selected, Microsoft.Azure.AppConfiguration.AspNetCore entered into the search box and selected from the search results. In the next pane, the Install button is selected.](media/nuget_installappconfigpackage_web.png "NuGet Package Manager")

5. Repeat step 4-6, this time installing the latest **Azure.Identity**.

6. Now you are ready to configure this application to use the App Configuration in Azure. Expand the **Contoso.Apps.SportsLeague.Web** project and open the `Program.cs` file.

7. Uncomment the following **using** statements at the top of the file:

    ```csharp
    using Microsoft.Extensions.Configuration;
    using Azure.Identity;
    ```

8. In the **CreateHostBuilder** method, uncomment the following code. This tells the application to utilize the AppConfig connection string that you've already setup on the **contosoapp** application service to point to the centralized App Configuration resource.

    ```csharp
    webBuilder.ConfigureAppConfiguration((hostingContext, config) =>
    {
        var settings = config.Build();

        config.AddAzureAppConfiguration(options =>
        {
            options.Connect(settings["ConnectionStrings:AppConfig"])
                    .ConfigureKeyVault(kv =>
                    {
                        kv.SetCredential(new DefaultAzureCredential());
                    });
        });
    })
    .UseStartup<Startup>();
    ```

9. Save `Program.cs` by selecting Save on the Visual Studio toolbar.

### Task 5: Publish the web app to Azure

1. Right-click the **Contoso.Apps.SportsLeague.Web** project in the Visual Studio Solution Explorer and select **Publish**.

    ![In Solution Explorer, under Solution \'Contoso.Apps.SportsLeague\' (7 projects), Web is expanded, and under Web, Contoso.Apps.SportsLeague.Web is selected.](media/2019-04-19-14-03-04.png "Solution Explorer")

2. On the Publish dialog, select **Azure** as the **Target**, then select **Next**.

    ![On the Publish dialog, Azure is specified as the target and the next button is highlighted.](media/publish-target.png "Publish Target")

3. For **Specific target**, select **Azure App Service (Windows)**, then select **Next**.

    ![On the Publish dialog, Azure App Service (Windows) is specified as the specific target and the next button is highlighted.](media/publish-specific-target-app-service-windows.png "Publish Specific Target")

4. On the **App Service** tab of the Publish dialog, select the appropriate subscription, then expand the **hands-on-lab-SUFFIX** resource group, select the **contosoapp** Web App from the list, and then select **Finish**.

    ![On the Publish dialog App Service tab, the contosoapp Web App is highlighted and the finish button is highlighted.](media/publish-app-service-contoso-app.png "App Service Publish")

5. Back in Visual Studio, select **Publish** to publish the Web application.

    ![Publish profile is displayed with the Publish button highlighted.](media/visual-studio-publish-web.png "Publish profile")

6. In the Visual Studio **Output** view, you will see a status that indicates the Web App was published successfully.

    ![Screenshot of the Visual Studio Output view, with the Publish Succeeded message circled.](media/image50.png "Visual Studio Output view")

    >**Note**: Your URL will differ from the one shown in the Output screenshot because it must be globally unique.

7. A new browser should automatically open the new web applications. Validate the website by choosing the **Store** link on the menu. You should see product items. If products are returned, then the connection to the database was successful.

    ![Screenshot of the Store link.](media/contoso-web-site-store-products.png "Store link")

    >**Troubleshooting**: If the web site fails to start up or show products, go back and double check all your connection string entries and passwords web application settings. If you get a message indicating the Service is unavailable. Give it a moment, and refresh your browser.

## Exercise 3: Setup SQL Database Geo-Replication

**Duration**: 45 minutes (15 minutes if not performing optional failover)

In this exercise, the attendee will provision a secondary SQL Database and configure Geo-Replication using the Microsoft Azure Portal.

### Task 1: Add secondary database

1. In the [Azure portal](https://portal.azure.com), select **Resource groups** from the Azure services list.

   ![Resource groups is highlighted in the Azure services list.](media/azure-services-resource-groups.png "Azure services")

2. Select the **hands-on-lab-SUFFIX** resource group from the list.

   ![The "hands-on-lab-SUFFIX" resource group is highlighted.](./media/resource-groups.png "Resource groups list")

3. In the list of resources within your resource group, select the **ContosoSportsDB** SQL database resource.

   ![The list of resources in the hands-on-lab-SUFFIX resource group are displayed, and ContosoSportsDB is highlighted.](./media/resource-group-resources-sql-db.png "ContosoSportsDB in resource group list")

4. On the **SQL Database** blade, select the **Show database connection strings** link within the Essentials area.

    ![On the SQL Database blade, in the left pane, Overview is selected. In the right pane, under Essentials, the Connection strings (Show database connection strings) link is circled.](media/sql-db-connection-strings-link.png "SQL Database blade")

5. Select **Geo-Replication** in the left-hand navigation menu, under **Data management**.

    ![In the Settings section, Geo-Replication is selected.](media/sql-db-geo-replication-menu.png "Settings section")

6. On the Geo-Replication blade, select the Azure Region within which you want to run the secondary database.

    ![The Geo-Replication pane with list of locations. Primary location is set to West US.](media/sql-db-geo-replication-secondary-region.png "Geo-Replication blade")

    > **Important**: The secondary Azure Region should be the Region Pair for the region the SQL Database is hosted in. Consult <https://docs.microsoft.com/azure/best-practices-availability-paired-regions> to see which region pair the location you are using for this lab is in.

    >**Note**: If you choose a region that cannot be used as a secondary region, you will not be able to pick a pricing plan. Choose another region.
    >
    > ![Wrong geo-replication region selected. Not available options presented.](media/2019-03-30-16-05-25.png "Not available options presented.")

7. On the **Create SQL Database - Geo Replica** Basics tab, select **Create new** for the **Server** and in the New server dialog, enter:

    - **Server name**: Enter a globally unique value, such as `contosodbreplicaSUFFIX`, where `SUFFIX` is a unique identifier (ensure the green checkmark appears).
    - **Server admin login**: Enter `demouser`.
    - **Password**: Enter `Password.1!!`.
    - **Location**: Select the region you chose for your secondary region on the Geo-Replication screen.

    ![The fields in the New Server blade display with the previously defined settings.](media/new-sql-server.png "New Server blade")

8. Select **OK** on the New server dialog.

9. Leave SQL elastic pool set to **No** and the Compute + Storage set to **Standard S1**. Select **Geo-redundant backup storage** for the **Backup storage redundancy**, and then select **Next: Networking**.

    ![The values specified above are entered into the Create SQL Database Geo Replica basics tab.](media/create-sql-database-geo-replica.png "Create SQL Database Geo Replica")

10. On the **Networking** tab, set **Allow Azure services and resources to access this server** to **Yes**.

    ![Allow Azure services and resources to access this server is set to Yes.](media/create-sql-database-geo-replica-networking.png "Create SQL Database Geo Replica Networking")

11. Select **Review + create** and on the Review + create tab, select **Create** to start the deployment of the secondary database.

    > **Note**: Deployment of the secondary database for geo-replication takes several minutes to complete.

### Task 2: Configure secondary SQL Database firewall

In this task, you set up access to the secondary Azure SQL Database from your local machine.

1. After the Geo-Replication has finished provisioning, select **Go to resource** from the deployment blade.

    ![The go to resource button is highlighted on the deployment blade for the secondary SQL database.](media/sql-db-replica-go-to-resource.png "Go to resource")

2. In the Essentials area of the SQL database, select the **Server name** link to navigate to the SQL Server hosting the database.

    ![In the Essentials area of the SQL database, the **Server name** link is highlighted.](media/sql-database-secondary-server-name.png "Server name link")

3. On the **Overview** blade for the **SQL Server** resource, select the **Show firewall settings** in the Essentials area.

    ![On the SQL Server Overview screen with the Show firewall settings link highlighted.](media/sql-server-replica-overview-show-firewall-settings.png "SQL Server Overview")

4. On the **Firewalls and virtual networks** blade, select **Add client IP** from the toolbar.

    ![The Add client IP button is highlighted on the firewalls and virtual networks toolbar.](media/sql-server-firewall-toolbar-add-client-ip.png "Add client IP")

5. A new rule will be generated that contains your client IP address for the **Start IP** and **End IP**. This allows you to connect to the database from your machine.

    ![Screenshot of the Rule name, Start IP. and End IP fields on the Firewall Settings blade.](media/sql-server-client-ip-rule.png "Firewall rule")

6. Select **Save** on the toolbar.

    ![Screenshot of the Firewall settings Save button.](media/sql-server-firewall-toolbar-save.png "Firewall settings Save button")

7. Select **OK** on the **Success** dialog when it appears.

    ![The success dialog for updating the server firewall rules is displayed and the OK button is highlighted.](media/sql-server-firewall-save-success.png "Success")

### Task 3: Setup SQL Failover Group

With SQL Database Geo-Replication configured, the Azure SQL Failover Groups feature can be used to enable "auto failover" scenarios for the SQL Database. This enables a single connection string endpoint to be used by the application, and SQL Database will automatically handle failing over from Primary to Secondary database in the event of a SQL Database outage / down time.

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **contososports** SQL Server resource associated with the primary database.

   ![The list of resources in the hands-on-lab-SUFFIX resource group are displayed, and contososports SQL Server resource is highlighted.](./media/resource-group-resources-sql-server.png "ContosoSports SQL Server in resource group list")

2. On the **SQL server** blade, select **Failover groups** under **Data management** in the left-hand navigation menu.

    ![Failover groups is highlighted in the left-hand menu.](media/sql-server-failover-groups-menu.png "Failover groups setting option")

3. On the **Failover groups** pane, select **Add group** on the toolbar.

    ![The Add group button is highlighted on the failover groups toolbar.](media/failover-group-add.png "Add group button")

4. On the **Failover group** pane, enter the following:

    - **Failover group name**: Enter a globally unique name, such as `contoso-failover-SUFFIX`.
    - **Server**: Select the secondary server you created above.
    - **Read/Write failover policy**: Choose **Automatic**.
    - **Read/Write grace period (hours)**: Choose **1 hours**.
    - **Database within group**: Select **Configure database**, check the box next to the **ContosoSportsDB** database on the replica, and then select **Select**.

    ![The values specified above are entered in to the Failover group dialog.](media/failover-group-settings.png "Failover group")

5. Select **Create** to create the SQL Failover Group.

6. Once the Failover Group has been created, select it in the list.

    ![Failover Group is highlighted.](media/failover-group-list.png "Failover Group is highlighted")

7. On the **Failover group** pane, you will see a map displaying the locations of the _Primary_ and _Secondary_ SQL Database servers within the failover group. Below that, the _Primary_ database shows as **Automatic** failover for Read/Write of data, while the _Secondary_ database does not since it is currently Read only.

    ![Map display of Primary and Secondary databases.](media/failover-group-map.png "Map display of Primary and Secondary databases")

8. Below the map you will find the **Read/write listener endpoint** and the **Read-only listener endpoint**. These allow for applications to be configured to connect to the SQL Failover Group endpoints instead of the individual SQL Server endpoints. Copy both **Listener Endpoint** values and paste into a text editor, such as Notepad.exe, for later reference.

    ![Read/Write and Read-only listener endpoints are displayed.](media/failover-group-endpoints.png "Read/Write and Read-only listener endpoints are displayed")

### Task 4: Update database connection string to use failover listener endpoint

In this task, you update the database connection string in Key Vault to use the read/write listener endpoint of the failover group.

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **Key vault** resource from the list.

    ![The Key Vault resource is highlighted in the hands-on-lab-SUFFIX resource group.](media/resource-group-resources-key-vault.png "Key Vault resource")

2. Select **Secrets** from the left-hand navigation menu and then select the **ContosoSportsLeague** secret.

    ![On the Key Vault blade, Secrets is highlighted in the left-hand menu and the ContosoSportsLeague secret is highlighted in the secrets list.](media/key-vault-secrets-contoso-sports-league.png "Secrets")

3. On the ContosoSportsLeague **Versions** blade, select **New Version** on the toolbar.

    ![The new version button is highlighted on the toolbar of the secret version blade.](media/key-vault-secret-new-version.png "New secret version")

4. Copy the original connection string to the **ContosoSportsDB**, but replace the server name with the **Azure SQL Failover Group Read/Write Listener Endpoint** that was copied previously, then select **Create**. The new version of the connection string should look similar to the following:

    ```sh
    Server=tcp:{failover_group_endpoint};Initial Catalog=ContosoSportsDB;Persist Security Info=False;User ID=demouser;Password=demo@pass123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;
    ```

    ![The ContosoSportsLeague secret Versions screen is shown with a current and older version present in the list. ](media/new-secret-version.png "Secrets version list")

### Task 5: Failover SQL Database Failover Group

> **THIS TASK IS OPTIONAL**: The replication and failover process can take anywhere from 10 to 30 minutes to complete, so you have the option to skip tasks 5 and 6, and go directly to exercise 4. However, if you have the time, it is recommended that you complete these steps.

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **contososports** SQL Server resource associated with the primary database.

   ![The list of resources in the hands-on-lab-SUFFIX resource group are displayed, and contososports SQL Server resource is highlighted.](./media/resource-group-resources-sql-server.png "ContosoSports SQL Server in resource group list")

2. On the **SQL server** blade, select **Failover groups** under **Data management** in the left-hand navigation menu.

    ![Failover groups is highlighted in the left-hand menu.](media/sql-server-failover-groups-menu.png "Failover groups setting option")

3. Select your failover group in the list.

    ![Failover Group is highlighted.](media/failover-group-list.png "Failover Group is highlighted")

4. On the Failover group blade, select the **Forced Failover** button on the toolbar, then select **Yes** to confirm the forced failover of the SQL Database Failover Group.

    ![The Forced failover button is highlighted on the toolbar and the confirmation message is displayed.](media/failover-group-forced-failover.png "Forced failover")

> **Note**: The failover may take a few minutes to complete. You can continue with the next task.

### Task 6: Test e-commerce Web App after Failover

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **contosoapp** App Service resource.

   ![The list of resources in the hands-on-lab-SUFFIX resource group are displayed, and contosoapp App Service resource is highlighted.](./media/resource-group-resources-app-service.png "contosoapp App Service in resource group list")

2. On the **App Service** blade, select the **URL** of the Web App displayed in the Essentials area to open it in a new browser tab.

    ![On the App Service blade, in the Essentials section, the URL link is highlighted.](media/web-app-url.png "App Service URL")

3. In the e-commerce Web App, select **STORE** in the top navigation bar of the website and verify the product list from the database displays.

    ![Screenshot of the Contoso store webpage. Under Team Apparel, a Contoso hat, tank top, and hoodie display.](media/contoso-web-site-store-products.png "Contoso store webpage")

## Exercise 4: Deploy the Call Center admin website

**Duration**: 15 minutes

In this exercise, you provision a website via the Azure Web App template using the [Azure portal](https://portal.azure.com/). You then edit the necessary configuration files in the Starter Project and deploy the call center admin website.

### Task 1: Provision a Web App

1. In the [Azure portal](https://portal.azure.com), select **Resource groups** from the Azure services list.

   ![Resource groups is highlighted in the Azure services list.](media/azure-services-resource-groups.png "Azure services")

2. Select the **hands-on-lab-SUFFIX** resource group from the list.

   ![The "hands-on-lab-SUFFIX" resource group is highlighted.](./media/resource-groups.png "Resource groups list")

3. On the Resource group blade, select **Add** on the toolbar.

    ![The Add button is highlighted on the resource group toolbar.](media/resource-group-add.png "Add resource to resource group")

4. On the create a resource blade, enter "Web App" into the search box and select **Web App** in the search results and then select **Create**.

    ![Web App is highlighted in the search box and the Web App resource is highlighted in the search results.](media/marketplace-web-app.png "Marketplace")

5. On the Create Web App **Basics** tab, enter the following:

    **Project Details**:

    - **Subscription**: Select the subscription you are using for this hands-on lab.
    - **Resource group**: Select the **hands-on-lab-SUFFIX** resource group.

    **Instance Details**:

    - **Name**: Enter a **unique Name** for the Web App, such as `contosoadminSUFFIX`.
    - **Publish**: Select **Code**.
    - **Runtime stack**: Choose **.NET Core 3.1 (LTS)**.
    - **Operating System**: Choose **Linux**.
    - **Region**: Select a different region than the one you are using for the hands-on-lab-SUFFIX resource group and other resources in this hands-on lab, as you cannot mix Linux and Windows app services in the same region in the same resource group. For example, if you are using **East US**, select **East US 2** for the region.

    **App Service Plan**:

    - **Linux Plan**: Accept the default new plan name.
    - **Sku and size**: Accept the default **Premium V2 P1v2** plan.

    ![The values specified above are entered into the Create Web App Basics tab.](media/create-web-app-admin-site.png "Create Web App")

6. Select **Review and create**, then **Create** to provision the web app.

### Task 2: Update the configuration in the starter project

1. Navigate to the **App Service** blade for the Call Center Admin App just provisioned.

    ![The App Service blade displays.](media/2020-03-17-19-59-03.png "App Service blade")

2. On the **App Service** blade, select **Configuration** in the left-hand navigation menu.

    ![In the App Service blade, under Settings, select Configuration link.](media/2019-04-19-16-38-54.png "Configuration link")

3. Scroll down, and locate the **Connection strings** section.

4. Add a new **Connection String** with the following values, and select **OK**:

   - **Name**: Enter `AppConfig`.
   - **Value**: Enter the Connection String for the App Configuration Store. You copied this into your text editor previously. Otherwise, you can retrieve it from the Access Keys blade of the App Configuration resource.
   - **Type**: Select **Custom**.

    ![The Add/Edit connection string form is displayed and is populated with the preceding values.](media/image43.png "The Add/Edit Connection String Form")

5. Select the **OK** button.

6. Select the **Save** button.

    ![the Save button is circled on the App Service blade.](media/2019-03-28-05-36-38.png "App Service blade")

### Task 3: Add a managed identity and set a Key Vault access policy

The call center web application resource needs access to the Key Vault. The App Configuration will use pass-through authentication to the Key Vault. To authenticate the application, it will utilize a system managed identity.

1. From the left-hand navigation menu, select **Identity**, and on the Identity blade, change the status to **On** and select **Save** on the toolbar.

    ![The Identity item is selected in the left-hand menu. The status is set to On. The Save button is highlighted.](media/call-center-identity.png "Identity")

2. Return to the **hands-on-lab-SUFFIX** resource group and select the **Key vault** resource from the list.

    ![The Key Vault resource is highlighted in the hands-on-lab-SUFFIX resource group.](media/resource-group-resources-key-vault.png "Key Vault resource")

3. From the left menu, select **Access policies** and then select the **Add Access Policy** link.

    ![Add Access Policy is highlighted on the Key Vault Access Policies blade.](media/key-vault-add-access-policy.png "Key Vault Access Policies")

4. In the **Add access policy** form:

    - **Secret permissions**: Expand the list and check the box next to **Get**.
    - **Select principal**: Select **None selected** and in the **Select principal** dialog, search for the name of the call center application you just created and choose the managed identity.

    ![The values specified above are entered into the Add access policy form.](media/key-vault-add-access-policy-blade.png "Add access policy")

5. Select **Add** on the Add access policy dialog.

6. Select **Save** on the Access policies toolbar to commit the changes.

### Task 4: Configure and deploy the call center admin Web App from Visual Studio

1. Return to Visual Studio on the LabVM and navigate to the **Contoso.Apps.SportsLeague.Admin** project located in the **Web** folder using the **Solution Explorer**.

2. Right-click the **Contoso.Apps.SportsLeague.Admin** project, and select **Manage NuGet Packages**.

3. Select the **Browse** tab, and search for **Microsoft.Azure.AppConfiguration.AspNetCore**.

4. Select **Microsoft.Azure.AppConfiguration.AspNetCore** from the search results, and in the next pane, select **Install** to install the latest stable version.

    ![The NuGet Package Manager windows is displayed with the Browse tab selected, Microsoft.Azure.AppConfiguration.AspNetCore entered into the search box and selected from the search results. In the next pane, the Install button is selected.](media/nuget_installappconfigpackage_web.png "The NuGet Package manager")

5. Repeat step 4-6, this time installing the latest **Azure.Identity**.

6. Now we are ready to configure this application to use the App Configuration in Azure. Under the `Contoso.Apps.SportsLeague.Admin` project, open the `Program.cs` file.

7. Uncomment the following **using** statements at the top of the file:

    ```csharp
    using Microsoft.Extensions.Configuration;
    using Azure.Identity;
    ```

8. In the **CreateHostBuilder** method, uncomment the following code - this tells the application to utilize the AppConfig connection string that you've already setup on the **contosoapp** application service to point to the centralized App Configuration resource.

    ```csharp
    webBuilder.ConfigureAppConfiguration((hostingContext, config) =>
    {
        var settings = config.Build();

        config.AddAzureAppConfiguration(options =>
        {
            options.Connect(settings["ConnectionStrings:AppConfig"])
                    .ConfigureKeyVault(kv =>
                    {
                        kv.SetCredential(new DefaultAzureCredential());
                    });
        });
    })
    .UseStartup<Startup>();
    ```

9. Right-click the `Contoso.Apps.SportsLeague.Admin` project, and select **Publish**.

    ![In Solution Explorer, the right-click menu for Contoso.Apps.SportsLeague.Admin displays, and Publish is selected.](media/2019-04-19-14-30-03.png "Right-Click menu")

10. On the Publish dialog, select **Azure** for the **Target**, then select **Next**.

11. For **Specific target**, select **Azure App Service (Linux)**, then select **Next**.

12. For **App Service**, expand the lab Resource group, and select the **Web App** that was created for the Call Center Admin Web App (with the name that was created previously).

    ![The App Service dialog is shown with the resource group expanded and the call center app service selected.](media/app-service-publish-linux.png "Publish target app service selection")

13. Select **Finish**.

14. Select **Publish** to publish the Web application.

    ![Publish button is highlighted](media/2020-06-19-22-25-36.png "Publish button")

15. Once deployment is complete, navigate to the Web App. It should look like the following:

    ![The Contoso website displays the Contoso Sports League Admin webpage, which says that orders that display below are sorted by date, and you can select an order to see its details. However, at this time, there is no data available under Completed Orders.](media/contoso-admin-app.png "Contoso website")

    > **Note**: If you see a page that indicates the app service is running and asking about deploying code, refresh the browser window by selecting CTRL+F5.

## Exercise 5: Deploy the payment gateway

**Duration**: 10 minutes

In this exercise, the attendee will provision an Azure API app template using the Microsoft Azure Portal. The attendee will then deploy the payment gateway API to the API app.

### Task 1: Provision the payment gateway API App

1. In the [Azure portal](https://portal.azure.com), select **Resource groups** from the Azure services list.

   ![Resource groups is highlighted in the Azure services list.](media/azure-services-resource-groups.png "Azure services")

2. Select the **hands-on-lab-SUFFIX** resource group from the list.

   ![The "hands-on-lab-SUFFIX" resource group is highlighted.](./media/resource-groups.png "Resource groups list")

3. On the Resource group blade, select **Add** on the toolbar.

    ![The Add button is highlighted on the resource group toolbar.](media/resource-group-add.png "Add resource to resource group")

4. On the create a resource blade, enter "API App" into the search box and select **API App** in the search results and then select **Create**.

5. On the new **API App** create form, create the following values:

   - **App name:** Specify a unique name for the App Name.
   - **Subscription:** Your Azure subscription.
   - **Resource Group:** Select the lab resource group.
   - **App Service Plan/Location:** Select the **contoso-asp-UNIQUEID** plan.
   - **Application Insights:** Enter the configuration, and select **Disabled**

    ![On the API App create form, the Configuration fields are displayed.](media/create-api-app.png "Configuration fields are displayed")

6. Select **Create**.

### Task 2: Deploy the Payment Gateway from Visual Studio

1. In Visual Studio, navigate to the **Contoso.Apps.PaymentGateway** project located in the **APIs** folder using the **Solution Explorer**.

2. Right-click the **Contoso.Apps.PaymentGateway** project, and select **Publish**.

    ![In Solution Explorer, Contoso.Apps.PaymentGateway is selected, and in its right-click menu, Publish is selected.](media/2019-04-19-14-52-22.png "Solution Explorer")

3. On the Publish dialog, select **Azure** as the **Target**, then select **Next**.

4. For **Specific target**, select **Azure App Service (Windows)**, then select **Next**.

5. For **App Service**, expand the resource group, and select the API app service that you created for the payment gateway from the list, then choose **Next**.

    ![The App Service form is shown with the payment gateway api selected.](media/deployment_selectpaymentapiappservice.png "Publish target App Service selection")

6. In the **API Management** form, check the **Skip this step** checkbox. Select **Finish**.

7. Select **Publish** to publish the API App.

    ![Publish button is highlighted](media/2020-06-19-22-33-57.png "Publish button is highlighted")

8. In the Visual Studio **Output** view, you will see a status indicating the Web App was published successfully.

    ![The Visual Studio output shows that the web app was published successfully.](media/image99.png "Visual Studio output")

9. Copy and paste the gateway **URL** of the deployed **API App** into Notepad for later use.

10. Viewing the Web App in a browser will display the Swagger UI for the API.

   ![Payment Gateway is up and running and the Swagger UI is displayed.](media/2019-04-11-04-58-04.png "Swagger UI")

  > **Note**: When opening the Swagger UI using the Internet Explorer browser you will see a "Resolver error" error message. This is a result of the Swagger UI no longer supporting Internet Explorer. Copy the URL and try opening the page in Microsoft Edge, which has been installed on the LabVM. The Swagger UI will work as expected.

## Exercise 6: Deploy the Offers Web API

**Duration**: 10 minutes

In this exercise, the attendee will provision an Azure API app template using the Microsoft Azure Portal. The attendee will then deploy the Offers Web API.

### Task 1: Provision the Offers Web API App

1. In the [Azure portal](https://portal.azure.com), select **Resource groups** from the Azure services list.

   ![Resource groups is highlighted in the Azure services list.](media/azure-services-resource-groups.png "Azure services")

2. Select the **hands-on-lab-SUFFIX** resource group from the list.

   ![The "hands-on-lab-SUFFIX" resource group is highlighted.](./media/resource-groups.png "Resource groups list")

3. On the Resource group blade, select **Add** on the toolbar.

    ![The Add button is highlighted on the resource group toolbar.](media/resource-group-add.png "Add resource to resource group")

4. On the create a resource blade, enter "API App" into the search box and select **API App** in the search results and then select **Create**.

5. On the new **API App** create form, create the following values:

   - **App name:** Specify a unique name, such as `contoso-offers-api-SUFFIX`.
   - **Subscription:** Your Azure subscription.
   - **Resource Group:** Select the lab resource group.
   - **App Service Plan/Location:** Select the **contoso-asp-UNIQUEID** plan.
   - **Application Insights:** Enter the configuration, and select **Disabled**

    ![On the API App create form, the Configuration fields are displayed.](media/create-offers-api-app.png "Configuration fields are displayed")

6. Select **Create**.

7. When the API App has completed provisioning, return to the resource group, then select the new API App from the list of resources.

### Task 2: Configure Cross-Origin Resource Sharing (CORS)

1. On the **App Service** blade for the Offers API, under the **API** menu section, scroll down and select **CORS**.

    ![In the App Service blade, under API, CORS is selected.](media/image102.png "App Service blade")

2. In the **Allowed Origins** text box, specify `*` to allow all origins, and select **Save**.

    >**Note**: You should not normally do this in a production environment. In production, you should enter the specific domains as allowed origins you need to allow CORS access to the API. The wildcard (*) is used for this lab to make it easier just for this lab.

    ![CORS configuration blade displayed.  Entering * as the Allowed Origins value.](media/2019-03-28-08-20-57.png "CORS configuration blade")

### Task 3: Update the configuration in the starter project

1. On the **App Service** blade for the Offers API, select **Configuration**.

    ![In the App Service blade, under Settings, select Configuration link.](media/2019-04-19-16-38-54.png "Configuration link")

2. Scroll down, and locate the **Connection strings** section.

3. Add a new **Connection String** with the following values, and select **OK**:

   - **Name**: Enter `AppConfig`.
   - **Value**: Enter the Connection String for the App Configuration Store. You copied this into your text editor previously. Otherwise, you can retrieve it from the Access Keys blade of the App Configuration resource.
   - **Type**: Select **Custom**.

    ![The Add/Edit connection string form is displayed and is populated with the preceding values.](media/image43.png "The Add/Edit connection string form")

4. Select the **OK** button.

5. Select the **Save** button.

    ![the Save button is circled on the App Service blade.](media/2019-03-28-05-36-38.png "App Service blade")

### Task 4: Add a managed identity and set a Key Vault access policy

The offers api resource needs access to the Key Vault. The App Configuration will use pass-through authentication to the Key Vault. To authenticate the application, it will utilize a system managed identity.

1. From the left-hand navigation menu, select **Identity**, and on the Identity blade, change the status to **On** and select **Save** on the toolbar.

    ![The Identity item is selected in the left-hand menu. The status is set to On. The Save button is highlighted.](media/call-center-identity.png "Identity")

2. Return to the **hands-on-lab-SUFFIX** resource group and select the **Key vault** resource from the list.

    ![The Key Vault resource is highlighted in the hands-on-lab-SUFFIX resource group.](media/resource-group-resources-key-vault.png "Key Vault resource")

3. From the left menu, select **Access policies** and then select the **Add Access Policy** link.

    ![Add Access Policy is highlighted on the Key Vault Access Policies blade.](media/key-vault-add-access-policy.png "Key Vault Access Policies")

4. In the **Add access policy** form:

    - **Secret permissions**: Expand the list and check the box next to **Get**.
    - **Select principal**: Select **None selected** and in the **Select principal** dialog, search for the name of the call center application you just created and choose the managed identity.

    ![The values specified above are entered into the Add access policy form.](media/key-vault-add-access-policy-offers-api.png "Add access policy")

5. Select **Add** on the Add access policy dialog.

6. Select **Save** on the Access policies toolbar to commit the changes.

### Task 5: Deploy the Offers app from Visual Studio

1. Navigate to the **Contoso.Apps.SportsLeague.Offers** project located in the **APIs** folder using the **Solution Explorer** in Visual Studio.

2. Right-click the **Contoso.Apps.SportsLeague.Offers** project, and select **Manage NuGet Packages**.

3. Select the **Browse** tab, and search for **Microsoft.Azure.AppConfiguration.AspNetCore**.

4. Select **Microsoft.Azure.AppConfiguration.AspNetCore** from the search results, and in the next pane, select **Install** to install the latest stable version.

    ![The Nuget Package Manager windows is displayed with the Browse tab selected, Microsoft.Azure.AppConfiguration.AspNetCore entered into the search box and selected from the search results. In the next pane, the Install button is selected.](media/nuget_installappconfigpackage_web.png "The NuGet Package Manager")

5. Repeat step 4-6, this time installing the latest **Azure.Identity**.

6. Now we are ready to configure this application to use the App Configuration in Azure. Under the **Contoso.Apps.SportsLeague.Offers** project, open the `Program.cs` file.

7. Uncomment the following **using** statements at the top of the file:

    ```csharp
    using Microsoft.Extensions.Configuration;
    using Azure.Identity;
    ```

8. In the **CreateHostBuilder** method, uncomment the following code - this tells the application to utilize the AppConfig connection string that you've already setup on the API application service to point to the centralized App Configuration resource.

    ```csharp
    webBuilder.ConfigureAppConfiguration((hostingContext, config) =>
    {
        var settings = config.Build();

        config.AddAzureAppConfiguration(options =>
        {
            options.Connect(settings["ConnectionStrings:AppConfig"])
                    .ConfigureKeyVault(kv =>
                    {
                        kv.SetCredential(new DefaultAzureCredential());
                    });
        });
    })
    .UseStartup<Startup>();
    ```

9. Right-click the **Contoso.Apps.SportsLeague.Offers** project, and select **Publish**.

    ![In Solution Explorer, from the Contoso.Apps.SportsLeague.Admin right-click menu, Publish is selected.](media/2019-04-19-15-03-45.png "Solution Explorer")

10. On the Publish dialog, select **Azure** for the **Target**. Select **Next**.

11. For **Specific target**, select **Azure App Service (Windows)**. Select **Next**.

12. For **App Service**, expand the resource group, and select the API app service that you created for the Offer API from the list, then choose **Next**.

    ![The App Service dialog is shown with the offers api selected.](media/deployment_selectoffersapiservice.png "Publish target app service selection")

13. For **API Management**, check the **Skip this step** checkbox and select **Finish**.

14. Select **Publish** to publish the API App.

    ![Publish button is highlighted](media/offerapi_vspublishbutton.png "Publish button is highlighted")

15. In the Visual Studio **Output** view, you will see a status indicating the Web App was published successfully.

    ![The Visual Studio output shows that the web app was published successfully.](media/offerapi_publishsuccessoutput.png "Visual Studio output")

16. Copy and paste the offer api **URL** of the deployed **API App** into Notepad for later use.

17. Viewing the Web App in a browser will display the Swagger UI for the API.

18. In the Visual Studio **Output** view, you will see a status the API app was published successfully.

19. Record the value of the deployed API app URL into Notepad for later use.

20. Viewing the Web App in a browser will display the Swagger UI for the API.

    ![The Offers API is up and running and the Swagger UI is displayed.](media/2019-04-11-05-20-40.png "Swagger UI")

    > **Note**: When opening the Swagger UI using the Internet Explorer browser you will see a "Resolver error" error message. This is a result of the Swagger UI no longer supporting Internet Explorer. In another browser, the Swagger UI will work as expected.

21. Within the Swagger UI for the Offers API, select the `/api/get` method on the API. Then select the **Try it out** button, and then **Execute** to test out the API call from within the Swagger UI in the web browser. Once it executes, scroll down to view the results of the API call execution.

    ![Swagger UI displaying API call response.](media/offers-swagger-response.png "Swagger UI")

## Exercise 7: Add API endpoint configuration settings

**Duration**: 15 minutes

### Task 1: Add the API endpoint configuration settings

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **App Configuration** resource from the list.

    ![The App Configuration resource is highlighted in the hands-on-lab-SUFFIX resource group.](media/resource-group-resources-app-configuration.png "App Configuration resource")

2. Select **Configuration explorer** from the left-hand navigation menu and then select **Create** and **Key Vault reference**.

    ![Configuration explorer is highlighted in the left-hand menu and Create --> Key Vault reference is highlighted on the Configuration explorer blade.](media/app-configuration-explorer.png "Configuration explorer")

3. Expand the **Create** button, and select **Key-value**. This API endpoint does not contain any secret values, thus is not required to be stored as a Key Vault value.

    ![The + Create button is expanded with the Key-value item selected.](media/app-config-create-key-value-menu.png "Create key value menu item")

4. Create the new key-value entry with the following values:

   - **Name**: `APIEndpoints:PaymentsAPI`
   - Value: Enter the **HTTPS** URL for the Payments API App with `/api/nvp` appended to the end. This is the value that you recorded when deploying the API. Alternatively, this value can be retrieved by opening the API resource in the Azure Portal and copying the URL value on the Overview screen.

        >**Example**: `https://contoso-payments-api.azurewebsites.net/api/nvp`

5. Create another Key-value setting with the following values:

   - App Setting Name: `APIEndpoints:OffersAPI`

   - Value: Enter the **HTTPS** URL for the Offers API App with `/api/get` appended to the end. This is the value that you recorded when deploying the API. Alternatively, this value can be retrieved by opening the API resource in the Azure Portal and copying the URL value on the Overview screen.

    >**Example**: `https://contoso-offers-api.azurewebsites.net/api/get`

    >**Note**: Ensure both API URLs are using **SSL** (https://), or you will see a CORS errors.

    ![The list of Configuration settings is shown with the two new API endpoint settings highlighted.](media/app-config-keys-with-apis.png "Configuration Settings")

### Task 2: Validate App Settings are correct

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **contosoapp** App Service resource.

   ![The list of resources in the hands-on-lab-SUFFIX resource group are displayed, and contosoapp App Service resource is highlighted.](./media/resource-group-resources-app-service.png "contosoapp App Service in resource group list")

2. On the **App Service** blade, select the **URL** of the Web App displayed in the Essentials area to open it in a new browser tab.

    ![On the App Service blade, in the Essentials section, the URL link is highlighted.](media/web-app-url.png "App Service URL")

3. On the homepage, you should see the latest offers populated from the Offers API.

    ![On the Contoso Sports League webpage, Today\'s offers display: Baseball socks, Road bike, and baseball mitt.](media/image121.png "Contoso Sports League webpage")

    > **Note**: The page may be cached, if Today's Offers are not displayed, you can try re-publishing the e-commerce app service from Visual Studio (Contoso.Apps.SportsLeague.Web).

4. Submit several test orders to ensure all pieces of the site are functional. **Accept the default data during the payment processing.**

    ![On the Contoso Sports League webpage, the message Order Completed displays.](media/image122.png "Contoso Sports League webpage")

> **Note**: If you are still experiencing CORS errors, ensure the URLs to the Web App in Azure local host are exact.

## Exercise 8: Identity and Security

Duration: 75 Minutes

The Contoso call center admin application will only be accessible by users of the Contoso Active Directory environment. You have been asked to create a new Azure AD Tenant and secure the application so only users from the tenant can log on.

### Task 1: Enable Azure AD Premium Trial

>**Note**: This task is **optional**, and it is valid only if you are a global administrator on the Azure AD tenant associated with your subscription.

1. Navigate to the home page of the [Azure portal](http://portal.azure.com/) and select **Azure Active Directory**. under Azure Services.

    > **Note**: If you do not see Azure Active Directory, select More Services and then select it there.

    ![The Azure Active Directory menu option.](media/azure-home-active-directory.png "Azure Portal")

2. On the **Azure Active Directory** blade, locate and select the **Company branding** option in the left-hand navigation menu.

    ![In the Azure Active Directory blade, Company branding is selected.](media/image124.png "Azure Active Directory blade")

3. In the right pane, select the **Get Free Premium Trial** button.

    ![On the left side of the Azure Active Directory blade, Company branding is selected. On the right side, the Get a free Premium trial link is selected.](media/azure-active-directory-free-premium-trial.png "Azure Active Directory blade")

    If you already have a Premium Azure Active Directory, skip to Task 2.

4. On the **Activate** blade, expand **Free trial** under **Azure AD Premium P2**, then select **Activate**.

    ![The Free trial link is selected on the Activate blade in the Azure AD Premium P2 box, and the Activate button is highlighted.](media/azure-active-directory-free-trial-activate.png "Activate blade")

5. Close the **Azure Active Directory** blades.

### Task 2: Create a new Contoso user

> **Note**: This task is **optional**, and it is valid only if you are a global administrator on the Azure AD tenant associated with your subscription.

1. On the **Azure Active Directory** blade, select **Custom domain names**.

    ![Custom Domain Names menu option screenshot.](media/image128.png "Custom Domain names")

2. Copy the **Domain Name** for your Azure AD Tenant. It will be in the format: *[your tenant].onmicrosoft.com*.
    This will be used for creating the new user's Username.

    ![Under Name, the Domain Name is selected.](media/image129.png "Domain name")

3. On the **Azure Active Directory** blade, select **Users**.

    ![Under Manage, All users is selected.](media/image130.png "Azure Active Directory blade")

4. Select **New user** to add a new user.

    ![The + New User button is boxed in red on the Azure Active Directory blade.](media/image131.png "Azure Active Directory blade")

5. On the **User** blade, enter the following:

    **Identity**:

    - **User name**: Enter a username and select the domain name for your Azure AD Tenant. For example: *tbaker@[your tenant].onmicrosoft.com*.
    - **Name**: Enter the name of the user.
    - **Password**: Select **Auto-generate** and then check **Show password**. Copy this value into a text editor for later user.

    ![On the User blade, the two previously defined fields (Name and User name) are circled.](media/azure-active-directory-new-user.png "User blade")

6. Select **Create**.

### Task 3: Configure access control for the call center administration Web Application

> **Note**: This task is **optional**, and it is valid only if you have the right to create applications in your Azure AD Tenant.

1. Return to the **hands-on-lab-SUFFIX** resource group and select the **Call Center Administration web app** App Service resource.

   ![The list of resources in the hands-on-lab-SUFFIX resource group are displayed, and call center admin web app resource is highlighted.](./media/resource-group-resources-app-service-admin.png "Call center admin web app in resource group list")

2. On the **App Service** blade, select the **Authentication** from the left-hand navigation menu and then select **Add Identity Provider**.

    ![On the App Service blade, Authentication is selected in the left-hand menu and the Add identity provider button is highlighted.](media/app-service-authentication.png "App Service blade")

3. On the **Add an identity provider** dialog, enter the following:

    - **Identity provider**: Select **Microsoft**.
    - **App registration type**: Choose **Create new app registration**.
    - **Name**: Accept the default value entered into this box.
    - **Supported account types**: Choose **Current tenant - Single tenant**.
    - **Authentication**: Choose **Require authentication**.
    - **Unauthenticated requests**: Choose **HTTP 302 Found redirect: recommended for web sites**.
    - **Token store**: Check this box.

    ![The values specified above are entered into the basics tab of the add an identity provider dialog.](media/add-identity-provider-basics.png "Add an identity provider")

4. Select **Add**.

5. Launch a new **InPrivate or Incognito mode** browser window and navigate to the **Call Center Administration** website. You can find the URL in the Essentials area of the web app's blade in the Azure portal.

6. The browser will redirect to the non-branded Access Control logon URL. You can log on with your Microsoft account or the **Contoso test user** you created earlier.

    ![Microsoft login prompt.](media/image144.png "Microsoft login prompt")

7. On the **Permissions requested** page, select **Accept**.

    ![The permissions requested page is displayed](media/permissions-requested.png "Permissions requested")

8. After you log on and **accept the consent**, your browser will be redirected to the Contoso Sports League Admin webpage.

    ![The Contoso Sports League Admin webpage displays with one Completed Order.](media/contoso-sports-admin-auth.png "Contoso Sports League Admin webpage")

### Task 4: Apply custom branding for the Azure Active Directory logon page

> **Note**: this task is **optional**, and it is valid only if you are a global administrator on the Azure AD tenant associated with your subscription, and you completed the Enabling Azure AD Premium exercise.

1. Navigate to the home page of the [Azure portal](http://portal.azure.com/) and select **Azure Active Directory**. under Azure Services.

    > **Note**: If you do not see Azure Active Directory, select More Services and then select it there.

    ![The Azure Active Directory menu option.](media/azure-home-active-directory.png "Azure Portal")

2. On the **Azure Active Directory** blade, locate and select the **Company branding** option in the left-hand navigation menu.

    ![In the Azure Active Directory blade, Company branding is selected.](media/image124.png "Azure Active Directory blade")

3. Select the **Configure...** information box.

    ![The Configure company branding link is selected.](media/image149.png "Configure company branding link")

4. On the **Configure company branding** blade, select the `default_signin_illustration.jpg` image file from `C:\MCW` for the **Sign-in page image**.

    ![The Configure company branding blade displays the default sign in picture of the Contoso sports league text, and a person on a bicycle. Below that, the Select a file field and browse icon is selected.](media/image150.png "Configure company branding blade")

5. Select the `logo-60-280.png` image file from the supplementary files for the **Banner image**.

    ![The Contoso sports league banner text displays.](media/image151.png "Contoso sports league banner")

6. Select **Save**.

    ![The Save button is circled on the Configure company branding blade.](media/image152.png "Configure company branding blade")

### Task 5: Verify the branding has been successfully applied to the Azure Active Directory logon page

1. Close any previously authenticated browser sessions to the call center administration website, reopen using InPrivate or Incognito mode, and navigate to the **call center administration** website.

2. The browser will redirect to the branded access control logon URL.

    ![The Call center administration Sign in webpage displays in an InPrivate / Incognito browser.](media/image153.png "Call center administration website")

3. After you log on, your browser will be redirected to the Contoso Sports League Admin webpage.

    ![The Contoso Sports League Admin webpage displays with one Completed Order.](media/contoso-sports-admin-auth.png "Contoso Sports League Admin webpage")

    >**Note**: If you run the app using localhost, ensure connection strings within all the appsettings.json files in the solution have the placeholders removed with actual values. Search on appsettings.json in the Visual Studio Solution Explorer to come up with the list.

## Exercise 9: Enable Azure B2C for customer site

Duration: 75 minutes

In this exercise, you will configure an Azure AD Business to Consumer (B2C) instance to enable authentication and policies for sign-in, sign-out and profile policies for the Contoso E-Commerce site.

### Task 1: Create a new directory

1. Navigate to the [Azure portal](https://portal.azure.com/) and in the left-hand navigation menu, select **+Create a resource**. Then, search for and select **Azure Active Directory B2C** and select **Create** on the new blade that pops up.

    ![In the Everything blade, the active directory B2C text is in the Search field, and under Results, Azure Active Directory B2C displays.](media/image156.png "Everything blade")

2. On the **Create a tenant** blade's **Configuration** tab, enter the following:

    **Directory details**:

    - **Organization name**: Enter `ContosoB2C`.
    - **Initial domain name**: Enter `contososportsorgSUFFIX`, where suffix is a unique identifier, such as `24601`, to ensure the domain name is globally unique.
    - **Country/Region**: Select the region most appropriate for your location.

    **Subscription**:

    - **Subscription**: Select the subscription you are using for this hand-on lab.
    - **Resource group**: Select the **ContosoSports** resource group.

    ![On the Azure Active Directory create a tenant configuration blade, ContosoB2C is entered and highlighted in the organization name field and a unique name is entered and highlighted in the initial domain name field. The unique name is indicated in the initial domain name by a green checkmark at the right-hand side of the field.](media/create-aad-b2c-tenant.png "Create Azure Active Directory B2C tenant")

3. Select **Review + create**, then **Create** on the review + create tab.

4. After directory creation completes, select the link in the new information tile that reads **Click here to navigate to your new directory**.

    ![On the Azure Active Directory create a tenant blade, the tenant creation was successful, click here to navigate to your new tenant link is highlighted.](media/create-aad-b2c-tenant-success-link.png)

5. The new Azure AD Directory that was created will now be open in new browser tab.

### Task 2: Add a new application

1. In the **Azure AD B2C** browser tab, select **App registrations** under the **MANAGE** menu area and then select **New registration**.

    ![In the Azure AD B2C Settings window, on the left, All Settings is selected. In the middle, under Settings, under Manage, App registrations is selected. On the right, the New registration button is selected.](media/b2c-add-app-link.png "Azure AD B2C Settings window")

2. Specify the following configuration options for the new Application registration:

    - **Name**: Enter `Contoso B2C Application`.
    - **Supported account types**: Choose **Accounts in any identity provider or organizational directory (for authenticating users with user flows)**.
    - **Redirect URI**: Select **Web** and then enter the URL using the format, `https://[your-web-app-name].azurewebsites.net/signin-oidc-b2c`, replacing `[your-web-app-name] with the name of the App Service hosting the Contoso E-Commerce Site.
    - **Permissions**: Leave the **Grant admin consent to openid and offline_access permissions** checkbox checked.

        ![The New application fields are set to the previously defined values.](media/aad-b2c-register-an-application.png "New application")

3. Select **Register**.

4. Once App registration has completed, copy the **Application (client) ID** of your new application to Notepad to use later. Keep this tab open for the next task.

     ![B2C application name and ID values are shown.](media/contoso-b2c-application-client-id.png "Azure AD B2C screen")

5. Next, select **Authentication** from the left-hand navigation menu of the **Contoso B2C Application** page.

    ![The Authentication item is highlighted and selected under Manage in the left-hand menu on the Contoso B2C Application blade.](media/b2c-app-authentication.png "Authentication")

6. On the **Authentication** blade, scroll down and locate the **Implicit grant and hybrid flows** section. Within that section, check the **Access tokens** and **ID tokens** boxes and then select **Save** in the toolbar at the top of the blade.

    ![On the Authentication blade, the Implicit grant and hybrid flows section header is highlighted, and within that section, the Access tokens and ID tokens checkboxes are checked and highlighted. The Save button in the toolbar at the top of the blade is highlighted.](media/authentication-implicit-grant-and-hybrid-flows.png "Authentication")

### Task 3: Create Policies, Sign up and sign in

1. Navigate back to the **Azure AD B2C** screen.

2. To enable sign-up on your application, you will need to create a sign-up policy. This policy describes the experiences consumers will go through during sign-up and the contents of tokens the application will receive on successful sign-ups. Select **User flows** link on the left menu and then **New user flow** link at the top of the blade.

    ![On the Azure AD B2C screen, User Flows selected from the left menu and the +New user flow button is highlighted in the toolbar.](media/aad-b2c-user-flows.png "Azure AD B2C - User Flows selected")

3. Select the **Sign up and sign in** tile, then under Version, select **Recommended**, then select the **Create** button.
  
    ![The Select a user flow type section is displayed with the Sign up and sign in tile highlighted.](media/create-user-flow-select-type.png "Sign up and sign in tile")

4. On the **Create** screen, enter the following:

    **Name**:

    - **B2C_1_**: Enter `SignUp`.
  
    **Identity providers**:

    - **Local accounts**: Select **Email signup**.

    **Multifactor authentication**:

    - **Type of method**: Leave **Email** selected.
    - **MFA enforcement**: Choose **Conditional**. This will disable MFA for this exercise.

    **Conditional access**:

    - **Enforce conditional access policies**: Ensure this box is **unchecked**.

    **User attributes and token claims**:

    - Select **Show more...** and on the **User attributes and token claims** dialog, set the following and then select **OK**:

    | Attribute name                 | Collect Attribute | Return claim |
    | ------------------------------ | ----------------- | ------------ |
    | City                           | Unchecked         | Unchecked    |
    | Country/Region                 | **Checked**       | Unchecked    |
    | Display Name                   | **Checked**       | **Checked**  |
    | Email Address                  | Unchecked         | Unchecked    |
    | Given Name                     | Unchecked         | Unchecked    |
    | Identify Provider              | Unchecked         | **Checked**  |
    | Identify Provider Access Token | Unchecked         | Unchecked    |
    | Job Title                      | Unchecked         | Unchecked    |
    | Legal Age Group Classification | Unchecked         | Unchecked    |
    | Postal Code                    | **Checked**       | **Checked**  |
    | State/Province                 | Unchecked         | Unchecked    |
    | Street Address                 | Unchecked         | Unchecked    |
    | Surname                        | Unchecked         | Unchecked    |
    | User is new                    | Unchecked         | **Checked**  |
    | User's Object ID               | Unchecked         | **Checked**  |

    ![The create user flow dialog is populated with the values specified above.](media/user-flow-create-sign-up-sign-in.png "Create User Flow")

5. Select **Create**. The sign-in/sign-up policy appears as **B2C_1_SignUp** (the **B2C_1_** fragment is automatically added) in the **User flows** blade.

    > **Note**: The page may take a few minutes to load/refresh after you start creating the policy.

    ![Azure AD B2C - User flows list. Shows the newly created flow.](media/2019-03-28-12-46-48.png "Azure AD B2C User Flow List")

6. Open the policy by selecting **B2C_1_SignUp**.

7. Select **Run user flow** and open the dialog.

    ![In the Policies section, Sign-in policies is selected.](media/2019-03-28-12-52-27.png "Policies section")

8. Select **Run user flow** on the **Run user flow** dialog.

    ![Choose application options are displayed. Contoso B2C Application option is selected. Run user flow button is displayed.](media/2019-03-28-12-55-51.png "Test the user flow")

9. In the browser window that opens, select **Sign up now**.

    ![Sign up now fields are presented to the user.](media/user-flow-sign-up-now.png "Sign up now")

10. On the sign up dialog, enter your email address and select **Send verification code**.

    > **Important**: You must enter a valid email address that you have access to for this lab.

    ![An email address is entered and the send verification code button is highlighted.](media/user-flow-sign-up-send-verification-code.png "Send verification code")

11. Check your email for a message from **Microsoft on behalf of ContosoB2C** and copy the code provided.

    ![The verification email is displayed and the provided verification code is highlighted.](media/verification-email.png "Verify your email address")

12. Return to the **Sign Up** browser window and enter the code into the provided field, then select **Verify code**.

    ![The code retrieved from the verification email is entered into the sign up form and the verify code button is highlighted.](media/sign-up-verify-code.png "Verify code")

13. Enter a password and complete the remaining fields on the form and then select **Create**.

    ![The sign up form is fully populated.](media/sign-up-create.png "Sign up")

14. After you select **Create**, you will get a 404 error page which should look something like the below screenshot. This happens because the Contoso web app has not yet been configured to use Azure AD B2C. You will do this below, so **the error can be ignored**.

    ![Screenshot of 404 error message.](media/sign-up-error.png "Error")

### Task 4: Create a profile editing policy

To enable profile editing on your application, you will need to create a profile editing policy. This policy describes the experiences that consumers will go through during profile editing and the contents of tokens that the application will receive on successful completion.

1. On the **User flows** blade, select **New user flow** again on the toolbar.

2. For the **Select a user flow type**, select the **Profile editing** tile, then select **Recommended**, and then select **Create**.

    ![On the create a user flow dialog, profile editing is selected and highlighted under select a user flow type. Under version, recommended is selected and highlighted. The create button is highlighted.](media/create-user-flow-profile-editing.png "Create a user flow")

3. On the **Create** screen, enter the following:

    **Name**:

    - **B2C_1_**: Enter `EditProfile`.
  
    **Identity providers**:

    - **Local accounts**: Select **Email signin**.

    **Multifactor authentication**:

    - **Type of method**: Leave **Email** selected.
    - **MFA enforcement**: Choose **Conditional**. This will disable MFA for this exercise.

    **Conditional access**:

    - **Enforce conditional access policies**: Ensure this box is **unchecked**.

    **User attributes and token claims**:

    - Select **Show more...** and on the **User attributes and token claims** dialog, set the following and then select **OK**:

    | Attribute name                 | Collect Attribute | Return claim |
    | ------------------------------ | ----------------- | ------------ |
    | City                           | Unchecked         | Unchecked    |
    | Country/Region                 | **Checked**       | Unchecked    |
    | Display Name                   | **Checked**       | **Checked**  |
    | Email Address                  | Unchecked         | Unchecked    |
    | Given Name                     | Unchecked         | Unchecked    |
    | Identify Provider              | Unchecked         | Unchecked    |
    | Identify Provider Access Token | Unchecked         | Unchecked    |
    | Job Title                      | **Checked**       | Unchecked    |
    | Legal Age Group Classification | Unchecked         | Unchecked    |
    | Postal Code                    | **Checked**       | **Checked**  |
    | State/Province                 | **Checked**       | Unchecked    |
    | Street Address                 | **Checked**       | Unchecked    |
    | Surname                        | Unchecked         | Unchecked    |
    | User's Object ID               | Unchecked         | Unchecked    |

    ![The create user flow dialog is populated with the values specified above.](media/user-flow-create-edit-profile.png "Create User Flow")

4. Select **Create**. The edit profile policy appears as **B2C_1_EditProfile** in the **User flows** blade.

5. Optionally, you can run the edit profile user flow by selecting the **B2C_1_EditProfile** flow and then selecting **Run user flow**.

6. Select **Run user flow** and in the new browser window, sign in with the email address and password you used to sign up for an account, and then you can edit your profile details.

    > **Important**: As with the sign-up user flow, you will get an error after saving any profile updates, as the Contoso Sports web app has not yet been updated to use Azure AD B2C.

### Task 5: Create a password reset policy

To enable profile editing on your application, you will need to create a profile password reset. This policy describes the experiences that consumers will go through during password reset and the contents of tokens that the application will receive on successful completion.

1. On the **User flows** blade, select **New user flow** again on the toolbar.

2. For the **Select a user flow type**, select the **Password reset** tile, then select **Recommended**, and then select **Create**.

    ![On the create a user flow dialog, password reset is selected and highlighted under select a user flow type. Under version, recommended is selected and highlighted. The create button is highlighted.](media/create-user-flow-password-reset.png "Create a user flow")

3. On the **Create** screen, enter the following:

    **Name**:

    - **B2C_1_**: Enter `PasswordReset`.
  
    **Identity providers**:

    - **Local accounts**: Select **Reset password using email address**.

    **Multifactor authentication**:

    - **Type of method**: Leave **Email** selected.
    - **MFA enforcement**: Choose **Conditional**. This will disable MFA for this exercise.

    **Conditional access**:

    - **Enforce conditional access policies**: Ensure this box is **unchecked**.

    **User attributes and token claims**:

    - Select **Show more...** and on the **User attributes and token claims** dialog, set the following and then select **OK**:

    | Attribute name                 | Return claim |
    | ------------------------------ | ------------ |
    | City                           | Unchecked    |
    | Country/Region                 | Unchecked    |
    | Display Name                   | Unchecked    |
    | Email Address                  | **Checked**  |
    | Given Name                     | **Checked**  |
    | Job Title                      | Unchecked    |
    | Legal Age Group Classification | Unchecked    |
    | Postal Code                    | Unchecked    |
    | State/Province                 | Unchecked    |
    | Street Address                 | Unchecked    |
    | Surname                        | Unchecked    |
    | User's Object ID               | Unchecked    |

    ![The create user flow dialog is populated with the values specified above.](media/user-flow-create-reset-password.png "Create User Flow")

4. Select **Create**. The edit profile policy appears as **B2C_1_PasswordReset** in the **User flows** blade.

5. Optionally, you can run the password reset user flow by selecting the **B2C_1_PasswordReset** flow and then selecting **Run user flow**.

6. Select **Run user flow** and in the new browser window, enter the email address you used to sign up for an account, select **Send verification code** and then follow the remaining steps to reset your password.

    > **Important**: As with the sign-up user flow, you will get an error after saving any profile updates, as the Contoso Sports web app has not yet been updated to use Azure AD B2C.

### Task 6: Modify the Contoso.App.SportsLeague.Web

1. In Visual Studio, expand the **Contoso.Apps.SportsLeague.Web** project within the Solution Explorer. then locate and open the `Startup.cs` code file.

2. Add the following `using` directives to the top of the `Startup.cs` code file:

    ```csharp
    using Microsoft.AspNetCore.Authentication;
    using Microsoft.AspNetCore.Authentication.AzureADB2C.UI;
    ```

3. Locate the `public void ConfigureServices` method declaration and add the following line of code to the bottom of this method:

    ```csharp
    services.AddAuthentication(Microsoft.AspNetCore.Authentication.AzureADB2C.UI.AzureADB2CDefaults.AuthenticationScheme)
                .AddAzureADB2C(options => Configuration.Bind("AzureADB2C", options));
    ```

    ![The Startup.cs file with the "app.UseAuthorization();" line of code highlighted.](media/2019-04-19-15-08-40.png "Startup.cs")

4. Locate the `app.UseAuthorization();` line within the `public void Configure` method, and add the following line of code before it:

    ```csharp
    app.UseAuthentication();
    ```

    The result will look similar to the following:

    ![app.UseAuthentication code inserted.](media/2020-03-18-14-44-13.png "app.UseAuthentication code inserted")

5. Select **Save** on the toolbar to save the `Startup.cs` file.

### Task 7: Send authentication requests to Azure AD

Your app is now configured to communicate with Azure AD B2C by using ASP.NET Core Identity. OWIN has taken care of all of the details of crafting authentication messages, validating tokens from Azure AD, and maintaining user session. All that remains is to initiate each user's flow.

1. Right select the **Controllers** folder, and select **Add** -> **Controller**.

    ![In Solution Explorer, in the right-click menu for the Controllers folder, Add is selected, and from its menu, Controller is selected.](media/image177.png "Solution Explorer")

2. Select **MVC Controller - Empty** and then select **Add**. Replace default name of **HomeController1.cs** with the name of **AccountController.cs** for the new Controller being added.

    ![On the left of the Add Scaffold window, Installed / Controller is selected. In the center of the window, MVC 5 Controller - Empty is selected.](media/image178.png "Add Scaffold window")

3. Add the following using statements to the top of the controller, below the existing using statements:

    ```csharp
    using Microsoft.AspNetCore.Authentication;
    using Microsoft.AspNetCore.Authentication.AzureADB2C.UI;
    using Microsoft.Extensions.Configuration;
    ```

4. Locate the default controller **Index** method.

    ![The Default controller method Index is circled.](media/image179.png "Default controller method Index")

5. Replace the method with the following code:

    ```csharp
    private string _editProfilePolicyId;

    public AccountController(IConfiguration configuration)
    {
        _editProfilePolicyId = configuration.GetValue<string>("AzureADB2C:EditProfilePolicyId");
    }

    public ActionResult SignIn()
    {
        if (!User.Identity.IsAuthenticated)
        {
            return Challenge(new AuthenticationProperties() { RedirectUri = "/" }, AzureADB2CDefaults.AuthenticationScheme);
        }
        return RedirectToAction("Index", "Home");
    }

    public ActionResult SignUp()
    {
        if (!User.Identity.IsAuthenticated)
        {
            return Challenge(new AuthenticationProperties() { RedirectUri = "/" }, AzureADB2CDefaults.AuthenticationScheme);
        }
        return RedirectToAction("Index", "Home");
    }

    public ActionResult Profile()
    {
        if (User.Identity.IsAuthenticated)
        {
                var properties = new AuthenticationProperties() { RedirectUri = "/" };
                properties.Items[AzureADB2CDefaults.PolicyKey] = _editProfilePolicyId;
                return Challenge(
                    properties,
                    AzureADB2CDefaults.AuthenticationScheme);
        }
        return RedirectToAction("Index", "Home");
    }

    public ActionResult SignOut()
    {
        if (!User.Identity.IsAuthenticated)
        {
            return RedirectToAction("Index", "Home");
        }
        string redirectUri = Url.Action("Index", "Home", null, Request.Scheme);
        var properties = new AuthenticationProperties
        {
            RedirectUri = redirectUri
        };
        return SignOut(properties, AzureADB2CDefaults.CookieScheme, AzureADB2CDefaults.OpenIdScheme);
    }
    ```

6. Save the file by selecting **Save** on the Visual Studio toolbar.

### Task 8: Display user information

When you authenticate users by using OpenID Connect, Azure AD returns an ID token to the app that contains **claims**. These are assertions about the user. You can use claims to personalize your app. You can access user claims in your controllers via the ClaimsPrincipal.Current security principal object.

1. Open the **Controllers\\HomeController.cs** file and add the following using statements at the end of the other using statements at the top of the file, below the existing using statements:

    ```csharp
    using Microsoft.AspNetCore.Authorization;
    ```

2. Next, add the following method to the **HomeController** class:

    ```csharp
    [Authorize]
    public ActionResult Claims()
    {
        var displayName = User.Identity.Name;
        ViewBag.DisplayName = displayName;
        ViewBag.Claims = User.Claims;
        return View();
    }
    ```

3. To access the claims that your application receives, you will create a new claims view that will display a list of all the claims the app receives. In the Visual Studio Solution Explorer, expand the **Views -\> Home** folder under the **Contoso.Apps.SportsLeague.Web** project, right-click the **Home** folder, and then select **Add -\> View**.

    ![In Solution Explorer, on the right-click menu for Views\\Home, Add is selected, and from its menu, View is selected.](media/views-home-add-view.png "Solution Explorer")

4. On the **Add New Scaffolded Item** dialog, select **Razor View - Empty** and select **Add**.

    ![On the Add New Scaffolded Item dialog, Razor View - Empty is selected and highlighted.](media/add-new-scaffolded-item-razor-view-empty.png "Add New Scaffolded Item")

5. On the **Add New Item** dialog, enter **Claims.cshtml** as the name of the new view and then select **Add**.

    ![On the Add New Item dialog, Claims.cshtml is entered in to the name field and the Add button is highlighted.](media/add-new-item-claims.png "Add new item")

6. In the new **Claims.cshtml** file that opens in Visual Studio, replace all the file's contents with the following code:

    ```csharp
    @using System.Security.Claims
    @{
        ViewBag.Title = "Claims";
    }
    <h2>@ViewBag.Title</h2>

    <h4>Claims Present in the Claims Identity: @ViewBag.DisplayName</h4>

    <table class="table-hover claim-table">
        <tr>
            <th class="claim-type claim-data claim-head">Claim Type</th>
            <th class="claim-data claim-head">Claim Value</th>
        </tr>

        @foreach (Claim claim in ViewBag.Claims)
        {
            <tr>
                <td class="claim-type claim-data">@claim.Type</td>
                <td class="claim-data">@claim.Value</td>
            </tr>
        }
    </table>
    ```

7. Select **Save** on the toolbar in Visual Studio to save the `Claims.cshtml` file.

8. Next, you will create a partial view to handle logging users in and out under the **Shared** folder. Right-click on the **Views -\> Shared** folder, select **Add**, add a new **View**.

9. On the **Add New Scaffolded Item** dialog, select **Razor View - Empty** and select **Add**.

10. On the **Add New Item** dialog, enter **\_LoginPartial.cshtml** for the name (making sure to include the leading underscore, "_", in the file name) and then select **Add**.

11. Replace all contents of the file with the following code to create a razor partial view to provide a sign-in and sign-out link as well as a link to edit the user's profile:

    ```html
    @if (User.Identity.IsAuthenticated)
    {
        <text>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a id="profile-link">@User.Identity.Name</a>
                    <div id="profile-options" class="nav navbar-nav navbar-right">
                        <ul class="profile-links">
                            <li class="profile-link">
                                @Html.ActionLink("Edit Profile", "Profile", "Account")
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    @Html.ActionLink("Sign out", "SignOut", "Account")
                </li>
            </ul>
        </text>
    }
    else
    {
        <ul class="nav navbar-nav navbar-right">
            <li>@Html.ActionLink("Sign up", "SignUp", "Account", routeValues: null, htmlAttributes: new { id = "signUpLink" })</li>
            <li>@Html.ActionLink("Sign in", "SignIn", "Account", routeValues: null, htmlAttributes: new { id = "loginLink" })</li>
        </ul>
    }
    ```

12. Select **Save** on the toolbar in Visual Studio to save the `_LoginPartial.cshtml` file.

13. Open `Views\Shared\_Layout.cshtml` in Visual Studio.

14. Locate the **DIV** markdown element that has the class of `header-top` (line 46 of the file), and add the line that starts with `@Html.ActionLink` and the line that starts with `@Html.Partial`.

    ```html
    <div class="header-top">
        <div class="container">
            <div class="row">
                <div class="header-top-left">
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                </div>
                <div class="header-top-right">
                    <a href="#" class="top-wrap"><span class="icon-phone">Call today: </span> (555) 555-8000</a>
                    @Html.ActionLink("Claims", "Claims", "Home")
                </div>
                @Html.Partial("_LoginPartial")
            </div>
        </div>
    </div>
    ```

### Task 9: Update App Service configuration

In this task, you update the configuration settings for the deployed web app in the Azure portal.

1. Return to the [Azure portal](https://portal.azure.com/), navigate to the **hands-on-lab-SUFFIX** resource group, and locate the Azure AD B2C resource. Copy the name portion of the **B2C tenant** and pasted it into a text edit, such as Notepad.exe.

    > **Note**: The name portion of the tenant is everything leading up to the first period (.) in the resource name. So, you will exclude `.onmicrosoft.com` from what you copy and paste into the text editor.

    ![List of all of the resources within the hands-on-lab-SUFFIX resource group. Pointing to the B2C tenant name.](media/resource-group-b2c-tenant.png "Locate B2C tenant name")

2. While still on the **hands-on-lab-SUFFIX** resource group blade in the Azure portal, select the Contoso Web App resource, and then select **Configuration** on the web app blade.

3. Add the following settings in the **Application Settings** section:

   - AzureADB2C:Instance - `https://[your-AAD-B2C-tenant-name].b2clogin.com/tfp/`
   - AzureADB2C:ClientId - **B2C Application ID you copied down earlier**.
   - AzureADB2C:CallbackPath - `/signin-oidc-b2c`
   - AzureADB2C:Domain - `[your-AAD-B2C-tenant-name]`.onmicrosoft.com**
   - AzureADB2C:SignUpSignInPolicyId - `B2C_1_SignUp`
   - AzureADB2C:ResetPasswordPolicyId - `B2C_1_PasswordReset`
   - AzureADB2C:EditProfilePolicyId - `B2C_1_EditProfile`

4. Select **Save** on the toolbar.

### Task 10: Run the sample app

In this task, you re-deploy the web app to your App Service and test the app using Azure AD B2C.

1. Go back to Visual Studio, right-click on the **Contoso.Apps.SportsLeague.Web** project, and select **Publish**. Follow the steps to deploy the updated application to the Microsoft Azure Web App.

    Launch a browser outside of Visual Studio for testing if the page loads in Visual Studio.

2. Test out Sign up.

3. Next, test Sign out.

4. When you select Claims and are not signed in, it will bring you to the sign-in page and then display the claim information. Sign in, and test Edit Profile.

    ![On the Contoso website, the following links are circled: Claims, Sign up, and Sign in.](media/image182.png "Contoso website")

    Claims information page:

    ![On the Contoso website, the following links are circled: Russell, Sign out, and Edit Profile.](media/image183.png "Contoso website, Claims information page")

## Exercise 10: Enabling Telemetry with Application Insights

**Duration**: 30 Minutes

To configure the application for logging and diagnostics, you have been asked to configure Microsoft Azure Application Insights and add some custom telemetry.

### Task 1: Add Application Insights Telemetry to the e-commerce website project

1. Open the Solution **Contoso.Apps.SportsLeague** in Visual Studio.

2. Navigate to the **Contoso.Apps.SportsLeague.Web** project located in the **Web** folder using the **Solution Explorer** in Visual Studio.

3. Expand the **Contoso.Apps.SportsLeague.Web** project, then right-click on the **Dependencies** node, and select **Manage NuGet Packages...**.

4. Within the **NuGet Package Manager**, select the **Browse** tab, then search for and install the following NuGet package:

    - **Microsoft.ApplicationInsights.AspNetCore**

5. Open the file `\Helpers\TelemetryHelper.cs` located in the **Contoso.Apps.SportsLeague.Web** project.

6. Add the following using statements to the top of the file:

    ```csharp
    using Microsoft.ApplicationInsights;
    using Microsoft.ApplicationInsights.Extensibility;
    ```

7. Add the following code to the **TrackException** method to instantiate the telemetry client and track exceptions:

    ```csharp
    var client = new TelemetryClient(TelemetryConfiguration.CreateDefault());
    client.TrackException(new Microsoft.ApplicationInsights.DataContracts.ExceptionTelemetry(exc));
    ```

8. Add the following code to the **TrackEvent** method to instantiate the telemetry client and track event data:

    ```csharp
    var client = new TelemetryClient(TelemetryConfiguration.CreateDefault());
    client.TrackEvent(eventName, properties);
    ```

9. Save the `TelemetryHelper.cs` file.

### Task 2: Enable client side telemetry

1. Return to the **hands-on-lab-SUFFIX** Resource Group and select the **Application Insights** resource.

    ![The Application Insights resource is highlighted in the resource group.](media/resource-group-resources-app-insights.png "Application Insights resource")

2. Copy the **Instrumentation Key** value in the Essentials area of the Overview blade by selecting the **Copy to clipboard** icon to the right of the key value.

    ![Contoso.Apps.SportsLeague Application Insights Overview. Instrumentation Key selected.](media/2019-03-29-10-36-23.png "Instrumentation Key selected")

3. Select **Getting Started** on the toolbar of the Application Insights blade.

    ![From the Configure menu, Getting started is selected.](media/image196.png "Configure menu")

4. In the portal, navigate to **How-to Guides** -> **Application Insights** -> **Code-based monitoring** -> **JavaScript** -> **Client-side JavaScript**, then navigate to the **Snippet based setup** section under **Adding the JavaScript SDK** within the documentation page.

    ![Screenshot of the Monitor and Diagnose Client Side Application arrow.](media/image197.png "Monitor and Diagnose Client Side Application")

    > **Note**: You can find the documentation page at the following URL: <https://docs.microsoft.com/azure/azure-monitor/app/javascript#snippet-based-setup>.

5. Select and copy the full contents of the JavaScript under the **Snippet based setup** heading.

    ![Under Guidance in the Client application monitoring and diagnosis blade, JavaScript displays.](media/image198.png "Client application monitoring and diagnosis blade")

    Here's the JavaScript code to copy/paste for quick reference:

    ```javascript
    <script type="text/javascript">
        !function(T,l,y){var S=T.location,u="script",k="instrumentationKey",D="ingestionendpoint",C="disableExceptionTracking",E="ai.device.",I="toLowerCase",b="crossOrigin",w="POST",e="appInsightsSDK",t=y.name||"appInsights";(y.name||T[e])&&(T[e]=t);var n=T[t]||function(d){var g=!1,f=!1,m={initialize:!0,queue:[],sv:"4",version:2,config:d};function v(e,t){var n={},a="Browser";return n[E+"id"]=a[I](),n[E+"type"]=a,n["ai.operation.name"]=S&&S.pathname||"_unknown_",n["ai.internal.sdkVersion"]="javascript:snippet_"+(m.sv||m.version),{time:function(){var e=new Date;function t(e){var t=""+e;return 1===t.length&&(t="0"+t),t}return e.getUTCFullYear()+"-"+t(1+e.getUTCMonth())+"-"+t(e.getUTCDate())+"T"+t(e.getUTCHours())+":"+t(e.getUTCMinutes())+":"+t(e.getUTCSeconds())+"."+((e.getUTCMilliseconds()/1e3).toFixed(3)+"").slice(2,5)+"Z"}(),iKey:e,name:"Microsoft.ApplicationInsights."+e.replace(/-/g,"")+"."+t,sampleRate:100,tags:n,data:{baseData:{ver:2}}}}var h=d.url||y.src;if(h){function a(e){var t,n,a,i,r,o,s,c,p,l,u;g=!0,m.queue=[],f||(f=!0,t=h,s=function(){var e={},t=d.connectionString;if(t)for(var n=t.split(";"),a=0;a<n.length;a++){var i=n[a].split("=");2===i.length&&(e[i[0][I]()]=i[1])}if(!e[D]){var r=e.endpointsuffix,o=r?e.location:null;e[D]="https://"+(o?o+".":"")+"dc."+(r||"services.visualstudio.com")}return e}(),c=s[k]||d[k]||"",p=s[D],l=p?p+"/v2/track":config.endpointUrl,(u=[]).push((n="SDK LOAD Failure: Failed to load Application Insights SDK script (See stack for details)",a=t,i=l,(o=(r=v(c,"Exception")).data).baseType="ExceptionData",o.baseData.exceptions=[{typeName:"SDKLoadFailed",message:n.replace(/\./g,"-"),hasFullStack:!1,stack:n+"\nSnippet failed to load ["+a+"] -- Telemetry is disabled\nHelp Link: https://go.microsoft.com/fwlink/?linkid=2128109\nHost: "+(S&&S.pathname||"_unknown_")+"\nEndpoint: "+i,parsedStack:[]}],r)),u.push(function(e,t,n,a){var i=v(c,"Message"),r=i.data;r.baseType="MessageData";var o=r.baseData;return o.message='AI (Internal): 99 message:"'+("SDK LOAD Failure: Failed to load Application Insights SDK script (See stack for details) ("+n+")").replace(/\"/g,"")+'"',o.properties={endpoint:a},i}(0,0,t,l)),function(e,t){if(JSON){var n=T.fetch;if(n&&!y.useXhr)n(t,{method:w,body:JSON.stringify(e),mode:"cors"});else if(XMLHttpRequest){var a=new XMLHttpRequest;a.open(w,t),a.setRequestHeader("Content-type","application/json"),a.send(JSON.stringify(e))}}}(u,l))}function i(e,t){f||setTimeout(function(){!t&&m.core||a()},500)}var e=function(){var n=l.createElement(u);n.src=h;var e=y[b];return!e&&""!==e||"undefined"==n[b]||(n[b]=e),n.onload=i,n.onerror=a,n.onreadystatechange=function(e,t){"loaded"!==n.readyState&&"complete"!==n.readyState||i(0,t)},n}();y.ld<0?l.getElementsByTagName("head")[0].appendChild(e):setTimeout(function(){l.getElementsByTagName(u)[0].parentNode.appendChild(e)},y.ld||0)}try{m.cookie=l.cookie}catch(p){}function t(e){for(;e.length;)!function(t){m[t]=function(){var e=arguments;g||m.queue.push(function(){m[t].apply(m,e)})}}(e.pop())}var n="track",r="TrackPage",o="TrackEvent";t([n+"Event",n+"PageView",n+"Exception",n+"Trace",n+"DependencyData",n+"Metric",n+"PageViewPerformance","start"+r,"stop"+r,"start"+o,"stop"+o,"addTelemetryInitializer","setAuthenticatedUserContext","clearAuthenticatedUserContext","flush"]),m.SeverityLevel={Verbose:0,Information:1,Warning:2,Error:3,Critical:4};var s=(d.extensionConfig||{}).ApplicationInsightsAnalytics||{};if(!0!==d[C]&&!0!==s[C]){method="onerror",t(["_"+method]);var c=T[method];T[method]=function(e,t,n,a,i){var r=c&&c(e,t,n,a,i);return!0!==r&&m["_"+method]({message:e,url:t,lineNumber:n,columnNumber:a,error:i}),r},d.autoExceptionInstrumented=!0}return m}(y.cfg);(T[t]=n).queue&&0===n.queue.length&&n.trackPageView({})}(window,document,{
        src: "https://az416426.vo.msecnd.net/scripts/b/ai.2.min.js", // The SDK URL Source
        //name: "appInsights", // Global SDK Instance name defaults to "appInsights" when not supplied
        //ld: 0, // Defines the load delay (in ms) before attempting to load the sdk. -1 = block page load and add to head. (default) = 0ms load after timeout,
        //useXhr: 1, // Use XHR instead of fetch to report failures (if available),
        //crossOrigin: "anonymous", // When supplied this will add the provided value as the cross origin attribute on the script tag 
        cfg: { // Application Insights Configuration
            instrumentationKey: "YOUR_INSTRUMENTATION_KEY_GOES_HERE"
            /* ...Other Configuration Options... */
        }});
    </script>
    ```

    > **Note**: Make sure to replace the `YOUR_INSTRUMENTATION_KEY_GOES_HERE` placeholder with the Application Insights Instrumentation Key.

6. Navigate to the **Contoso.Apps.SportsLeague.Web** project located in the **Web** folder using the **Solution Explorer** in Visual Studio.

7. Open **Views \> Shared \> \_Layout.cshtml**.

    ![In Solution Explorer, under Views\\Shared, Layout.cshtml is selected.](media/2019-04-19-15-45-29.png "Solution Explorer")

8. Paste in the code before the `</head>` tag. Insert your **Instrumentation Key** from Notepad into the JavaScript code ``instrumentationKey:`` value.

    ![In Layout.cshtml, code displays, and several lines are selected.](media/image200.png "Layout.cshtml tab")

9. Save the `_Layout.cshtml` file.

### Task 3: Deploy the e-commerce Web App from Visual Studio

1. Navigate to the **Contoso.Apps.SportsLeague.Web** project located in the **Web** folder using the **Solution Explorer** in Visual Studio.

2. Right-click on the **Contoso.Apps.SportsLeague.Web** project, and select **Publish**.

    ![From the Contoso.Apps.SportsLeague.Web right-click menu, Publish is selected.](media/image202.png "Solution Explorer")

3. Select **Publish** again when the Publish dialog appears.

4. Launch a browser **outside of Visual Studio** for testing if the page is loaded in Visual Studio.

5. Select a few links on the published E-Commerce website, and submit several orders to generate some sample telemetry.

### Task 4: View the Application Insights logs

1. Return to the **hands-on-lab-SUFFIX** Resource Group and select the **Application Insights** resource.

    ![The Application Insights resource is highlighted in the resource group.](media/resource-group-resources-app-insights.png "Application Insights resource")

2. Select **Application Dashboard**. View the performance timeline to see the overall number of requests and page load time.

    ![Application Insights - Contoso.Apps.SportsLeague.Web - At the top of the page, the Application Dashboard link is highlighted and has an arrow pointing to it. Failed requests and server response metrics are displayed.](media/2019-03-29-11-10-04.png "Click the Dashboard link")

    ![The Contoso web metrics are displayed. Usage, reliability, and responsiveness graphs are displayed.](media/2019-03-29-11-12-13.png "Application Insights Default Dashboard")

3. Navigate back to the Application Insights overview for the **Application Insights** instance, then select **Performance** in the left-hand navigation menu to see individual endpoint render performance.
  
    ![Contoso.Apps.SportsLeague.Web Performance link selected.](media/2019-03-29-11-01-14.png "Performance link selected")

    ![Contoso.Apps.SportsLeague.Web Performance - Endpoint performance metrics are displayed for various types of HTTP requests.](media/2019-03-29-11-20-06.png "Endpoint performance")

4. Under **Usage** link area, select the **Events** menu option. Select the **View More Insights** button.

    ![A screenshot using the Events button under the Usage Preview section.](media/image218.png "The Usage Preview section")

5. Select **View More Insights**, then scroll down to see event list.

    ![In the Custom events section, event metrics are displayed for users and sessions. Different web pages are listed. e.g. OrderCompleted and SuccessfulPaymentAuth.](media/2020-06-21-11-09-04.png "Event Statistics")

## Exercise 11: Automating backend processes with Azure Functions and Logic Apps

**Duration**: 45 Minutes

Contoso wants to automate the process of generating receipts in PDF format and alerting users when their orders have been processed using Azure Logic App and Functions. To run custom snippets of C\# or node.js in logic apps, you can create custom functions through Azure Functions. [Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-overview) offers server-free computing in Microsoft Azure and are useful for performing these tasks:

- Advanced formatting or compute of fields in logic apps
- Perform calculations in a workflow
- Extend the logic app functionality with functions that are supported in C\# or node.js

### Task 1: Create an Azure Function to Generate PDF Receipts

1. In the [Azure portal](https://portal.azure.com), select **Resource groups** from the Azure services list.

   ![Resource groups is highlighted in the Azure services list.](media/azure-services-resource-groups.png "Azure services")

2. Select the **hands-on-lab-SUFFIX** resource group from the list.

   ![The "hands-on-lab-SUFFIX" resource group is highlighted.](./media/resource-groups.png "Resource groups list")

3. On the Resource group blade, select **Add** on the toolbar.

    ![The Add button is highlighted on the resource group toolbar.](media/resource-group-add.png "Add resource to resource group")

4. On the create a resource blade, enter "Function App" into the search box and select **Function App** in the search results and then select **Create**.

5. Provision and deploy the new function app, with the following settings:

    **Project Details**:

    - **Subscription**: Select the subscription you are using for this hands-on-lab.
    - **Resource Group**: Choose the **hands-on-lab-SUFFIX** resource group.

    **Instance Details**:

    - **Function App name**: Enter a globally unique name, such as `contoso-function-app-SUFFIX`.
    - **Publish**: Select **Code**.
    - **Runtime Stack**: Select **.NET**.
    - **Version**: Select **3.1**.
    - **Region**: Choose the same region used for the e-commerce web app in this lab.

    ![The values specified above are entered into the Create Function App basics tab.](media/create-function-app.png "Create Function App")

6. Select **Next: Hosting >** and on the **Hosting** tab, set the following:

    **Storage**:

    - **Storage account**: Select the lab storage account, prefixed with **contoso**.

    **Operating System**:

    - **Operating System**: Select **Windows**.

    **Plan**:

    - **Plan type**: Select **App service plan**.
    - **Windows Plan**: Select **ContosoSportsPlan**.
    - **Sku and size**: Select **Standard S1**.

    ![The values specified above are entered into the Create Function App hosting tab.](media/create-function-app-hosting.png "Create Function App")

7. Select **Review + create**, then **Create**.

8. Navigate to the **Function App** that was just created, and select **Configuration**.

    ![Display Contoso Function App, with the Configuration link highlighted.](media/2020-06-21-11-19-23.png "Contoso Function App Application Settings")

9. Add a new **Application Setting** with the following values:

   - **Name**: Enter `AppConfigConnectionString`.
   - **Value**: Enter the Connection String for the App Configuration Store.
  
10. Select the **OK** button.

11. Select the **Save** button.

## Task 2: Add Key Vault access using a managed identity

The function application resource needs access to the Key Vault. The App Configuration will use pass-through authentication to the Key Vault. To authenticate the application, it will utilize a system managed identity.

1. From the left-hand navigation menu, select **Identity**, and on the Identity blade, change the status to **On** and select **Save** on the toolbar.

    ![The Identity item is selected in the left-hand menu. The status is set to On. The Save button is highlighted.](media/call-center-identity.png "Identity")

2. Return to the **hands-on-lab-SUFFIX** resource group and select the **Key vault** resource from the list.

    ![The Key Vault resource is highlighted in the hands-on-lab-SUFFIX resource group.](media/resource-group-resources-key-vault.png "Key Vault resource")

3. From the left menu, select **Access policies** and then select the **Add Access Policy** link.

    ![Add Access Policy is highlighted on the Key Vault Access Policies blade.](media/key-vault-add-access-policy.png "Key Vault Access Policies")

4. In the **Add access policy** form:

    - **Secret permissions**: Expand the list and check the box next to **Get**.
    - **Select principal**: Select **None selected** and in the **Select principal** dialog, search for the name of the call center application you just created and choose the managed identity.

    ![The values specified above are entered into the Add access policy form.](media/key-vault-add-access-policy-receipt-function.png "Add access policy")

5. Select **Add** on the Add access policy dialog.

6. Select **Save** on the Access policies toolbar to commit the changes.

### Task 3: Configure and deploy the Function App

1. In Visual Studio, expand the **Web** folder and right-click on the **Contoso.Apps.FunctionApp** project, and select **Manage NuGet Packages**.

2. On the **Browse** tab, search for and select **Microsoft.Extensions.Configuration.AzureAppConfiguration**. In the right pane, select **Install**.

3. Repeat step 2, this time for the package **Azure.Identity**.

4. Within the **Contoso.Apps.FunctionApp** project, locate and open the `ContosoMakePdf.cs` source file.

5. Uncomment the following **using** statements:

    ```csharp
    using Microsoft.Extensions.Configuration;
    using Azure.Identity;
    ```  

6. Inside the static class **ContosoMakePdf**, uncomment the following code that sets up a connection to the App Configuration store and the Key Vault credential pass-through:

    ```csharp
    private static IConfiguration Configuration { set; get; }

    static ContosoMakePdf()
    {
        var builder = new ConfigurationBuilder();            
        builder.AddAzureAppConfiguration(options =>
        {
            options.Connect(Environment.GetEnvironmentVariable("AppConfigConnectionString"))               
                    .ConfigureKeyVault(kv =>
                    {
                        kv.SetCredential(new DefaultAzureCredential());
                    });
        });
        Configuration = builder.Build();
    }
    ```

7. In the **ProcessOrder** method, uncomment the following line of code:

    ```csharp
    Order.ReceiptUrl = await StorageMethods.UploadPdfToBlob(receipt, fileName, Configuration, log);
    ```

8. To publish the Function App, open the Visual Studio solution, Right-click on the **Contoso.Apps.FunctionApp** project, then select **Publish**.

9. For **Target**, choose **Azure** and then select **Next**.

10. For **Specific target**, choose **Azure Function App (Windows)**, then select **Next**.

11. For **Functions instance**, expand the lab resource group and select the **Function App**, then select **Finish**.

    ![The App Service dialog is shown with the resource group expanded and the Function App selected.](media/deployment_appservice_functionselection.png "Publish target app service selection")

12. Select **Publish**.

    > **Note**: The publish should only take a minute or so. You can check the **Output** window for any errors that may occur.

    ![The build Output window is displayed. Publish succeeded message is shown.](media/2019-04-15-15-33-20.png "Output window.")

13. To test your newly published Function App, start by navigating back to your Contoso Function App in the Azure Portal. Select the newly created **ContosoMakePDF** function listed in the functions.

    ![The Azure Functions shows the ContosoMakePDF function listed.](media/2020-06-21-11-25-59.png "Azure Functions")

14. Select the **Code + Test** link, then select the **Test/Run** button.

    ![The Code + Test link and Test/Run button are highlighted](media/2020-06-21-11-27-28.png "Function Test link")

15. Select **POST** for the HTTP method.

16. Open the **sample.dat** file found in the `C:\MCW\MCW-Modern-cloud-apps-master\Hands-on lab\lab-files\src\Contoso Sports League\Contoso.CreatePDFReport` directory on your LabVM. Copy the contents into the **Request body** text box.

    ![A small screenshot of Windows Explorer is shown emphasizing the file path to the sample.dat file.](media/2019-04-15-15-47-39.png "Sample.dat File")

17. Select the **Run** button located at the bottom of the blade.

    ![The screenshot displays the Test blade with sample.dat contents. The Request body field shows the Order JSON. There is an arrow pointing to Run button.](media/2020-06-21-11-29-48.png "Display Test blade with sample.dat contents")

    > **Note**: There is also a **Run** button located at the top of the Azure Function blade. Selecting either of these buttons will run the function just the same.

    After a few seconds, you should see logs like in the below image. You should see return status code of 200.  The **Output** text box should show recent Contoso purchase data. You should see a message stating the file has been created and stored in the blob storage.

    ![There is a screenshot displaying the Function App test result log.  A status code of 200 OK is displayed on the right side pane.](media/2020-06-21-11-30-54.png "Function App test result log.")

18. Check your receipt PDF in the storage account blob.

    - Navigate to the ContosoSports storage account.
    - Select the **Blobs** link.

    ![The Settings options are displayed. There is an arrow pointing to the Blobs link.](media/2020-06-21-11-32-12.png "Containers link")

19. Choose the newly created **receipts** blob container.

    ![The storage account blobs are listed. The receipts blob container is highlighted.](media/2019-04-15-16-08-35.png "Click the Blobs link")

20. Open **ContosoSportsLeague-Store-Receipt-XX.pdf** link.

    ![There is a screenshot displaying a list of the newly created PDF receipts. An arrow pointing to the Download link is located on the right side of the screen.](media/2019-04-15-16-11-24.png "PDF Receipts")

21. Open the `...` link and choose download menu item.

    ![A sample Contoso Sports League PDF receipt is displayed.](media/2019-04-15-16-15-06.png "Sample PDF receipt")

### Task 4: Create an Azure Logic App to Process Orders

Without writing any code, you can automate business processes more easily and quickly when you create and run workflows with Azure Logic Apps. Logic Apps provide a way to simplify and implement scalable integrations and workflows in the cloud. It provides a visual designer to model and automate your process as a series of steps known as a workflow. There are [many connectors](https://docs.microsoft.com/azure/connectors/apis-list) across the cloud and on-premises to quickly integrate across services and protocols.

The advantages of using Logic Apps include the following:

- Saving time by designing complex processes using easy to understand design tools
- Implementing patterns and workflows seamlessly, that would otherwise be difficult to implement in code
- Getting started quickly from templates
- Customizing your logic app with your own custom APIs, code, and actions
- Connect and synchronize disparate systems across on-premises and the cloud
- Build off BizTalk server, API Management, Azure Functions, and Azure Service Bus with first-class integration support

1. Next, we will create a Logic App that will trigger when an item is added to the **receiptgenerator** queue. In the Azure Management Portal, select the **+ Create a resource** button, search for and select **Logic App**, then select **Create**.

2. Fill out the name as **ContosoLogicApplication** along with your subscription, and use the existing resource group **contososports**. Choose the **same region** that you have been using for this lab. Select **Review + create**, then **Create** once validation has passed.

    ![In the Create logic app blade, ContosoLogicApplication is in the Name field. Under Resource group, the Use existing radio button is selected, and contososports is the name.](media/image237.png "Create logic app blade")

3. Open the newly created **ContosoLogicApplication** logic app resource after it is deployed.

4. In the Logic Apps Designer, under **Templates**, select **Blank Logic App**.

    ![In the Logic Apps Designer, the Blank Logic App tile is selected.](media/2019-03-29-12-56-10.png "Logic Apps Designer")

    >**Note**: The first time you access the Logic App resource, it will automatically enter the Logic App Designer. Otherwise, you can open the logic app designer by selecting the **Logic app designer** link from the left menu of the resource screen (beneath **Development Tools**).

5. Select the **All** tab, then select **Service Bus**.

    ![In the Services section, the Service Bus tile is selected.](media/2020-03-18-12-12-10.png "Services section")

6. Select **Service Bus - When a message is received in a queue (auto-complete)**.

    ![In the Search all triggers section, Service Bus - When a message is received in a queue (auto-complete).](media/2020-03-18-12-13-24.png "Search all triggers section")

7. Specify **ContosoQueue** as the connection name, select the Contoso storage account from the list.

    ![In When there are messages in a queue, the Connection Name is ContosoQueue, and under Service Bus Namespace, contosooiyxeonvhew7u is selected.](media/2020-03-18-12-15-23.png "When there are messages in a queue ")

8. Select the **RootManageSharedAccessKey** from the list of Service Bus Policies, then select **Create**.

    ![RootManageSharedAccessKey is selected.](media/2020-03-18-12-17-17.png "RootManageSharedAccessKey is selected")

9. Select the **receiptgenerator** queue from the drop-down.

    ![Under When there are messages in a queue, the Queue name is set to receiptgenerator.](media/2020-03-18-12-19-06.png "Queue name")

    >**Note**: If you wish, you can set the **Interval** and **Frequency** to check for new items to a shorter interval than the default; such as every 30 seconds. This could help reduce delay for when the Logic App is triggered when new messages are sent to the Service Bus Queue while you progress through this lab.

10. Select the **+ New step** button, choose the **All** tab, then select **Azure Functions**.

    ![In the Choose an action section, under Services ,the Azure Functions tile is selected.](media/2020-03-18-12-21-44.png "Choose an action")

11. Select the **Azure Function App** you just created.

    ![Under Azure Functions, on the Actions tab, a single Action, the Azure function ContosoFunctionApp, is listed.](media/2020-03-18-12-22-46.png "Azure Functions")

12. Select the Azure function **ContosoMakePDF**.

    ![Under Azure Functions, on the Actions tab, a single Action, the Azure function ContosoMakePDF, is listed.](media/2020-03-18-12-23-39.png "Azure Functions")

13. Type this in the Request Body:

    ```json
    {"Order": pick Content from list (see picture below) }
    ```

    Make sure the syntax is json format. Sometimes the ":" will go to the right side of Content by mistake. Keep it on the left. It should look like this:

    ![Under ContosoMakePDF, the previous JSON code is typed in the Request Body, and to the right of this, in Insert parameters from previous steps, Content is selected.](media/2020-03-18-12-25-29.png "ContosoMakePDF")

14. Select **Save** to save the Logic App.

15. Run the logic app by selecting the **Run** button of the Logic app designer toolbar. It should process the orders you have submitted previously to test PDF generation. Using Azure Storage Explorer or Visual Studio Cloud Explorer you can navigate to the storage account and open the receipts container to see the created PDFs.

    ![In Azure Storage Explorer, on the left, the following tree view is expanded: Storage Accounts\\contososportsstorage01r\\Blob Containers. Under Blob Containers, receipts is selected. On the right, the ContosoSportsLeague-Store-Receipt-72.pdf is selected.](media/image252.png "Azure Storage Explorer")

16. Double-click the PDF document to download and see the Purchase receipt.

17. Open the **ContosoLogicApplication** Logic Apps Designer. We will be adding another to the flow for updating the database. In the designer, select **+ New step**.

    ![In Designer, the New Step link is circled. Under New step, the Add an action tile is circled.](media/image254.png "Designer")

18. Select the **All** tab, then choose **SQL Server**.

    ![In the Services section, under Services, SQL Server is selected.](media/image255.png "Services section")

19. Select **Update row (V2)**.

    ![In the SQL Server section, on the Actions tab, SQL Server - Update row (V2) is selected.](media/2020-03-18-12-35-07.png "SQL Server section")

20. Enter the following values, then select **Create**:

    - Authentication Type: **SQL Server Authentication**

    - SQL server name: _Enter the DNS name of the SQL Database Failover Cluster Read/Write Listener Endpoint that was copied previously_.

    - SQL database name: `ContosoSportsDB`

    - Username: `demouser`

    - Password: `demo@pass123`

    ![The Update row section displays the previously defined settings.](media/2020-03-18-12-37-03.png "Update row")

21. Select the **Server name** and **Database name** previously specified, then from the drop-down select the name of the **Orders** table, and enter `OrderId` into the **Row id** field.

    ![In the Update row section, under Table name, Orders is selected.](media/2020-03-18-12-41-11.png "Update row section")

22. Press **Save**, then select the **Code View** button.

23. Add the following JSON within the `Update_row_(V2).inputs` object:

    ```json
    "body": {
        "OrderDate": "@{body('ContosoMakePDF')['OrderDate']}",
        "FirstName": "@{body('ContosoMakePDF')['FirstName']}",
        "LastName": "@{body('ContosoMakePDF')['LastName']}",
        "Address": "@{body('ContosoMakePDF')['Address']}",
        "City": "@{body('ContosoMakePDF')['City']}",
        "State": "@{body('ContosoMakePDF')['State']}",
        "PostalCode": "@{body('ContosoMakePDF')['PostalCode']}",
        "Country": "@{body('ContosoMakePDF')['Country']}",
        "Phone": "@{body('ContosoMakePDF')['Phone']}",
        "SMSOptIn": "@{body('ContosoMakePDF')['SMSOptIn']}",
        "SMSStatus": "@{body('ContosoMakePDF')['SMSStatus']}",
        "Email": "@{body('ContosoMakePDF')['Email']}",
        "ReceiptUrl": "@{body('ContosoMakePDF')['ReceiptUrl']}",
        "Total": "@{body('ContosoMakePDF')['Total']}",
        "PaymentTransactionId": "@{body('ContosoMakePDF')['PaymentTransactionId']}",
        "HasBeenShipped": "@{body('ContosoMakePDF')['HasBeenShipped']}"
    },
    ```

    After this has been added, the JSON will look as follows:

    ![JSON edits have been made.](media/2020-03-18-18-21-47.png "JSON edits have been made")

24. And modify the `path` variable for the `Update_row_(V2)` action to include the index key or OrderId as follows:

    ```json
    "path": "/v2/datasets/@{encodeURIComponent(encodeURIComponent('default'))},@{encodeURIComponent(encodeURIComponent('default'))}/tables/@{encodeURIComponent(encodeURIComponent('[dbo].[Orders]'))}/items/@{encodeURIComponent(encodeURIComponent(body('ContosoMakePDF')['OrderId']))}"
    ```

25. **Save** and return to the designer.

26. Your updated designer view should look like this:

    ![The Update row section displays the purchase fields.](media/image261.png "Update row section")

27. Select Run on the Logic App Designer, and then run the Contoso sports Web App and check out an Item.

28. Run the call center website app, and select the last Details link in the list.

    ![Screenshot of the Details link.](media/image264.png "Details link")

29. You should now see a Download receipt link because the database has been updated.

    ![In the Order Details window, the Download receipt link is circled.](media/image265.png "Order Details window")

30. Select the Download receipt link to see the receipt.

31. Return to the Logic app and you should see all green check marks for each step. If not, select the yellow status icon to find out details.

    ![In the Logic app, all steps have green checkmarks.](media/2020-03-18-19-05-39.png "Logic app")

### Task 5: Use Twilio to send SMS Order Notifications

<!-- omit in toc -->
#### Subtask 1: Configure your Twilio trial account

1. If you do not have a Twilio account, sign up for one for free at the following URL:

    [https://www.twilio.com/try-twilio](https://www.twilio.com/try-twilio)

   ![Screenshot of the Twilio account Sign up for free webpage.](media/image268.png "Twilio account Sign up webpage")

2. On the home dashboard, select **Get a Trial Number**.

   ![The Twilio dashboard is shown with the Get a Trial Number button highlighted.](media/twilio_gettrialnumberbutton.png "The Twilio Dashboard")

3. Record the **Phone Number**, select the **Choose this Number** button on the **Your first Twilio Phone Number** prompt, and select **Done**.

    ![On the Your first Twilio Phone Number prompt, the number is obscured.](media/image274.png "Your first Twilio Phone Number prompt")

4. Select **Home**, then **Settings**. Authenticate if needed and then record the **Account SID** and **Auth Token** for use when configuring the Twilio Connector.

    ![On the Console, on the left, the Home button and the Settings menu tab are selected. On the right, under API Credentials, Account SID and Auth Token are circled.](media/image275.png "Console")

<!-- omit in toc -->
#### Subtask 2: Create a new logic app

1. Open **Azure Data Studio** on the LabVM.

2. In Azure Data Studio, select **New connection** and in the connection dialog enter the details to connect to the SQL Database for the **ContosoSportsDB** database, as follows:

    - **Connection Type**: Select Microsoft SQL Server.
    - **Server**: Enter the server name of the primary **ContosoSportsDB**, which you can find in the **Server name** property within the Essentials area of the overview blade for the SQL Database.
    - **Authentication type**: Select **SQL Login**.
    - **User name**: Enter `demouser`.
    - **Password**: Enter `Password.1!!`.
    - **Remember password**: Check this box.
    - **Database**: Select **ContosoSportsDB**.

    ![The values specified above are entered into the Azure Data Studio connection dialog.](media/azure-data-studio-connection.png "Azure Data Studio New connection")

3. Select **Connect** to open the connection to the database.

4. In the open connection window, select **New Query** on the toolbar.

    ![New Query is highlighted on the Azure Data Studio toolbar.](media/azure-data-studio-new-query.png "New Query")

5. In the query window that opens, paste the following code:

    ```sql
    CREATE PROCEDURE [dbo].[GetUnprocessedOrders]
    AS
    declare @returnCode int 
    SELECT @returnCode = COUNT(*) FROM [dbo].[Orders] WHERE PaymentTransactionId is not null AND PaymentTransactionId <> '' AND Phone is not null AND Phone <> '' AND SMSOptIn = '1' AND SMSStatus is null
    return @returnCode

    GO
    ```

6. Select **Run** in the toolbar to execute the query.

    ![The Run button is highlighted on the Azure Data Studio toolbar..](media/azure-data-studio-run-query.png "Run button")

7. You should receive a message in the output panel that the commands completed successfully.

    ![The Commands completed successfully message is highlighted in the messages panel.](media/query-executed-successfully.png "Query executed successfully")

8. Delete the SQL script for the Stored Procedure from the query editor, and replace it with the following:

    ```sql
    CREATE PROCEDURE [dbo].[ProcessOrders]
    AS
    SELECT * FROM [dbo].[Orders] WHERE PaymentTransactionId is not null AND PaymentTransactionId <> '' AND Phone is not null AND Phone <> '' AND SMSOptIn = '1' AND SMSStatus is null;

    UPDATE [dbo].[Orders] SET SMSStatus = 'sent' WHERE PaymentTransactionId is not null AND PaymentTransactionId <> '' AND Phone is not null AND Phone <> '' AND SMSOptIn = '1' AND SMSStatus is null;
    ```

9. Select **Run** in the toolbar to execute the query.

10. Return to the **hands-on-lab-SUFFIX** resource group and select the **Logic App** resource from the list of resources.

    ![The Logic App resource is highlighted in the list of resources.](media/resource-group-resources-logic-app.png "Logic App resource")

11. In the Logic Apps Designer, select the **Blank Logic App** Template.

    ![In the Logic Apps Designer, the Blank Logic App tile is selected.](media/image282.png "Logic Apps Designer")

12. On the **Logic Apps Designer**, select the **All** tab, and choose **Schedule**. Then, select **Recurrence**.

    ![In the Logic Apps Designer, the Schedule tile is selected.](media/image283.png "Logic Apps Designer")

13. Set the **FREQUENCY** to **MINUTE**, and **INTERVAL** to 1.

    ![Under Recurrence, the Frequency field is Minute, and the Interval field is 1.](media/image284.png "Recurrence section")

14. Select the **+ New Step** button.

15. Type **SQL Server** into the filter box, and select the **SQL Server -- Execute stored procedure (V2)** action.

    ![Under Choose an action, sql server is typed in the search field. On the Actions tab, SQL Server (Execute stored procedure V2) is selected.](media/2020-03-19-11-34-57.png "Choose an action section")

16. In the **SQL Server** box, enter the following to create a connection to the **ContosoSportsDB** Azure SQL Database:

    - **Connection name**: Enter `ContosoSportsDB`.
    - **Authentication type**: Select **SQL Server Authentication**.
    - **SQL server name**: Enter the server name associated with the primary ContosoSportsDB database.
    - **SQL database name**: Enter `ContosoSportsDB`.
    - **Username**: Enter `demouser`.
    - **Password**: Enter `Password.1!!`.
    - **Subscription**: Select the subscription you are using for this hands-on lab.
    - **Connection Gateway**: Select **No gateways found**.

    ![The values above are entered into the SQL Server dialog.](media/logic-app-sql-server-connection.png "Create SQL Server Connection")

17. Select **Create**.

18. In the **Execute stored procedure (V2)** box:

    - **Server name**: Select **Use connection settings**
    - **Database name**: Select **Use connection settings**
    - **Procedure name**: Select `[dbo].[GetUnprocessedOrders]`.

    ![In the Execute stored procedure section, the Procedure name is \[dbo\].\[GetUnprocessedOrders\].](media/logic-app-execute-stored-procedure-unprocessed-orders.png "Execute stored procedure section")

19. Select **Add an action** and search for and select the **Control** object.

    ![The Control object is highlighted on the logic app designer pick tool.](media/image289.png "Buttons")

20. Under **Control**, select the **Condition** object.

    ![The Control Condition object is highlighted on the logic app designer pick tool.](media/image290b.png "Buttons")  

21. Select **Choose a value**, and then select **Return Code** from the Dynamic content tile.

    ![The Choose a value box and Return Code objects are highlighted in the Dynamic content tile in the Logic Designer.](media/image290c.png "Buttons")

22. Specify **ReturnCode**, set the RELATIONSHIP to **is greater than**, and set the VALUE to **0**.

    ![Under Condition, Object Name is ReturnCode, Relationship is greater than, and Value is 0.](media/image290.png "Condition section")

23. Select the **Add an action** link on the **If true** condition.

    ![Under If true, the Add an action button is selected.](media/image291.png "If yes section")

24. Select **SQL Server**, and then select the **SQL Server -- Execute stored procedure (V2)** action.

    ![Under If Yes, SQL Server - Execute stored procedure is circled.](media/2020-03-19-11-39-54.png "If yes section")

25. Select the **ProcessOrders** stored procedure in the Procedure name dropdown.

    ![Under If Yes, Execute stored procedure 2 is selected, and the Procedure name is \[dbo\].\[ProcessOrders\].](media/2020-03-19-11-40-49.png "If yes section")

26. Select the **Add an action** link.

    ![The Add an action button is selected.](media/image294.png "Add an action button")

27. Select **Control** and **For each**.

28. In the **Select an output from previous steps**, select **ResultsSets Table1**.

    ![A for each control object is displayed with ResultSets Table1 selected in the output from previous steps box.](media/logic-app-for-each.png "For each")

29. Select **Add an action** within the **For each** block, and search for **Twilio** in the filter box, and select the **Twilio -- Send Text Message (SMS)** item in the Actions box.

    ![In the Choose an operation tile, the Search box is set to Twilio, and below, Twilio - Send Text Message (SMS) is selected.](media/image295.png "Choose an Operation Tile.")

30. Set the Connection Name to Twilio, specify your Twilio **Account SID** and **Authentication Token**, then select the **Create** button.

    ![In the Twilio - Send Text Message (SMS) section, fields are set to the previously defined settings.](media/image296.png "Twilio - Send Text Message (SMS)")

31. Using the drop-down, select your Twilio number for the **FROM PHONE NUMBER** field.

32. In the **To phone number** field, select **ResultSets Phone**.

33. In the **Text** field, enter `Hello` followed by the dynamic value for **ResultsSets FirstName**, then followed by `, your order has shipped!`.

    ![Under Send Text Message (SMS), the From Phone Number and To Phone Number fields are circled, and in the Text field is the message, Hello, your order has shipped!](media/logic-app-for-each-email.png "Send Text Message (SMS)")

34. On the Logic App toolbar, select the **Code View** button to review the JSON code generated by the UI.

    ![The code view button is selected on the Logic App toolbar.](media/image298.png "Logic App toolbar")

35. Select **Save** on the toolbar to enable the logic app.

    ![On the Logic Apps Designer toolbar, the Save button is selected.](media/image304.png "Logic Apps Designer toolbar")

36. The completed JSON code should look similar to the following:

    ```json
    {
        "definition": {
            "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
            "actions": {
                "Condition": {
                    "actions": {
                        "Execute_stored_procedure_(V2)_2": {
                            "inputs": {
                                "body": {},
                                "host": {
                                    "connection": {
                                        "name": "@parameters('$connections')['sql']['connectionId']"
                                    }
                                },
                                "method": "post",
                                "path": "/v2/datasets/@{encodeURIComponent(encodeURIComponent('default'))},@{encodeURIComponent(encodeURIComponent('default'))}/procedures/@{encodeURIComponent(encodeURIComponent('[dbo].[ProcessOrders]'))}"
                            },
                            "runAfter": {},
                            "type": "ApiConnection"
                        },
                        "For_each": {
                            "actions": {
                                "Send_Text_Message_(SMS)": {
                                    "inputs": {
                                        "body": {
                                            "body": "Hello @{items('For_each')?['FirstName']}, your order has shipped.",
                                            "from": "+15708869103",
                                            "to": "@items('For_each')?['Phone']"
                                        },
                                        "host": {
                                            "connection": {
                                                "name": "@parameters('$connections')['twilio']['connectionId']"
                                            }
                                        },
                                        "method": "post",
                                        "path": "/Messages.json"
                                    },
                                    "runAfter": {},
                                    "type": "ApiConnection"
                                }
                            },
                            "foreach": "@body('Execute_stored_procedure_(V2)_2')?['resultsets']?['Table1']",
                            "runAfter": {
                                "Execute_stored_procedure_(V2)_2": [
                                    "Succeeded"
                                ]
                            },
                            "type": "Foreach"
                        }
                    },
                    "expression": {
                        "and": [
                            {
                                "greater": [
                                    "@body('Execute_stored_procedure_(V2)')?['returncode']",
                                    0
                                ]
                            }
                        ]
                    },
                    "runAfter": {
                        "Execute_stored_procedure_(V2)": [
                            "Succeeded"
                        ]
                    },
                    "type": "If"
                },
                "Execute_stored_procedure_(V2)": {
                    "inputs": {
                        "body": {},
                        "host": {
                            "connection": {
                                "name": "@parameters('$connections')['sql']['connectionId']"
                            }
                        },
                        "method": "post",
                        "path": "/v2/datasets/@{encodeURIComponent(encodeURIComponent('default'))},@{encodeURIComponent(encodeURIComponent('default'))}/procedures/@{encodeURIComponent(encodeURIComponent('[dbo].[GetUnprocessedOrders]'))}"
                    },
                    "runAfter": {},
                    "type": "ApiConnection"
                }
            },
            "contentVersion": "1.0.0.0",
            "outputs": {},
            "parameters": {
                "$connections": {
                    "defaultValue": {},
                    "type": "Object"
                }
            },
            "triggers": {
                "Recurrence": {
                    "recurrence": {
                        "frequency": "Minute",
                        "interval": 1
                    },
                    "type": "recurrence"
                }
            }
        },
        "parameters": {
            "$connections": {
                "value": {
                    "sql": {
                        "connectionId": "/subscriptions/e223f1b3-d19b-4cfa-98e9-bc9be62717bc/resourceGroups/hands-on-lab/providers/Microsoft.Web/connections/sql",
                        "connectionName": "sql",
                        "id": "/subscriptions/e223f1b3-d19b-4cfa-98e9-bc9be62717bc/providers/Microsoft.Web/locations/eastus/managedApis/sql"
                    },
                    "twilio": {
                        "connectionId": "/subscriptions/e223f1b3-d19b-4cfa-98e9-bc9be62717bc/resourceGroups/hands-on-lab/providers/Microsoft.Web/connections/twilio",
                        "connectionName": "twilio",
                        "id": "/subscriptions/e223f1b3-d19b-4cfa-98e9-bc9be62717bc/providers/Microsoft.Web/locations/eastus/managedApis/twilio"
                    }
                }
            }
        }
    }
    ```

37. Your workflow should look like the image below, and you should receive a text for each order you placed. If you did not use your own phone number, place another order and enter a phone number for which you can receive text messages.

    ![The Workflow diagram begins with Recurrence, then flows to Execute stored procedure, then to For each. The For each contains a condition based on the ReturnCode value being greater than 0. Below the Workflow diagram is an If Yes box, with a workflow that begins with Execute stored procedure 2, and flows to forEach email. There is also an If No, Do Nothing box.](media/logic-app-designer.png "Workflow diagram")

38. Select **Run** on the Logic App Designer toolbar to start the workflow.

## Exercise 12: Automate deployments using GitHub actions

Duration: 30 minutes

The Contoso Sports League would like to move their existing source control to GitHub. In addition to this, they wish to implement automatic deployments of their projects into production. The desired workflow is that features are developed in their own branch and once complete, pull requests are issued to the master branch. The pull requests are then reviewed for quality assurance, and once approved, the pull request is then merged into the master branch of the repository. Upon this merge, the projects in the solution should be automatically released into the production Azure environment using the code from the master branch. In this exercise, you will learn how to deploy code to Azure from GitHub Actions in two different ways: via a Service Principal created in Active Directory, as well as via Application Service Publish Profiles.

### Task 1: Create a GitHub repository

1. Open a web browser, and navigate to <https://www.github.com>. Log in using your GitHub account credentials.

2. In the upper-right corner, expand the user drop down menu and select **Your repositories**.

    ![The user menu is expanded with the Your repositories item selected.](media/github_yourrepositoriesmenu.png "GitHub user menu")

3. Next to the search criteria, locate and select the **New** button.

    ![The GitHub Find a repository search criteria is shown with the New button selected.](media/github_newbutton.png "New repository button")

4. On the **Create a new repository** screen, name the repository **ContosoSports** and select the **Create repository** button.

    ![The Create a new repository screen is shown with the Repository name set to ContosoSports and the Create repository button is highlighted.](media/github_createrepositoryform.png "Create a new repository form")

5. On the **Quick setup** screen, copy the **HTTPS** GitHub URL for your new repository, paste this in notepad for future use.

    ![The Quick setup screen is displayed with the copy button next to the GitHub URL textbox selected.](media/github_copygithuburl.png "The quick setup screen")

### Task 2: Commit the existing lab files to source control

1. Open a command prompt and change directory to the folder that contains the lab files solution file (Contoso.Apps.SportsLeague.sln).

2. At the command prompt, issue the following command to initialize the git repository:

    ```shell
    git init
    ```

3. Set the remote origin to the GitHub Url from the previous task by executing the following command (replace the URL with your own):

   ```shell
   git remote add origin <your GitHub Url>
   ```

4. Commit the initial code, and push it to the master branch by issuing the following commands:

    ```shell
    git add -a
    git commit -m "initial commit"
    git push -u origin master
    ```

### Task 3: Create a service principal in Active Directory

One method to deploy code using GitHub actions is to create a Service Principal that has the necessary access to deploy the web applications in the solution. In this exercise, we will be releasing the Call Center Admin Portal application using this service principal. This service principal is created in Azure Active Directory, and is granted the Contributor role to the deployed lab resources, scoped by the resource group.

1. In the Azure portal, select the icon to open the Cloud Shell located on the top toolbar.

    ![A portion of the Azure Portal top toolbar is displayed with the Cloud Shell menu item highlighted.](media/azureportal_cloudshellmenuitem.png "The cloud shell taskbar item")

    > **Note**: You may be prompted to create a storage account to support cloud shell activities, this is required in order to utilize the cloud shell.

2. Obtain the Subscription ID and Resource Group name by opening the resource group where you have deployed all of the applications in this lab. The Subscription ID is available in the Overview pane.

3. In the Cloud Shell, execute the following to create the service principal scoped by the resource group we've been using in this lab (replace Subscription ID and resource group name):

    ```PowerShell
    az ad sp create-for-rbac --name 'mcw-modern-cloud-apps' --role contributor --scopes /subscriptions/<Subscription ID>/resourceGroups/<Resource Group Name> --sdk-auth
    ```

4. This will output a JSON data result, copy and paste this result and save it for a future step in this lab.

    ![The output of the previous command is displayed with the JSON result highlighted.](media/azurecloudshell_serviceprincipaljson.png "JSON output in the cloud shell")

### Task 4: Create repository secrets

You have the ability to add secrets to the repository in GitHub. Secrets contain sensitive information that should never be checked into source control. These secrets are kept encrypted by GitHub and are made available to GitHub actions through the **secrets** collection (which you will see in the next task). We will be creating many secrets, as we have five projects that we are configuring for auto-deployment.

<!-- omit in toc -->
#### Subtask 1: Create the service principal credentials secret

1. In GitHub, return to the **ContosoSports** repository screen and select the **Settings** tab.

2. From the left menu, select **Secrets**.

3. Select the **New secret** button.

   ![The Settings tab of the ContosoSports repository is shown with the Secrets menu item and the New secret button highlighted.](media/github_newsecretbutton.png "GitHub repository settings")

4. In the New secret form, enter the name **AZURE_CREDENTIALS**, and for the value, paste in the JSON data obtained when creating the Service Principal in the previous task. Select **Add secret**.

<!-- omit in toc -->
#### Subtask 2: Create the e-commerce web application publish profile secret

1. In the Azure Portal, open the e-commerce web application service, it is the one named contosoapp{randomcharacters}.

2. From the top toolbar of the App Service screen, select **Get publish profile** item. This will download a file. Open this file in a text editor.

    ![On the App service screen, the Get publish profile button is highlighted on the toolbar menu.](media/azureportal_appservice_getpublishprofile.png "Get Publish profile")

3. Return to the ContosoSports repository GitHub Secrets screen, and add a new secret named **AZURE_WEBAPP_PUBLISH_PROFILE**, for the value, paste the contents of the publish profile from the previous step, then select the **Add secret** button.

<!-- omit in toc -->
#### Subtask 3: Create publish profile secrets for the remaining projects

Repeat Subtask 2 for the remaining projects by obtaining the publish profiles from the Azure Portal. Create the secrets as follows:

| Secret Name | Value |
|-------------|--------------------------|
| AZURE_API_PAYMENT_PUBLISH_PROFILE | Contents of the publish profile for the Payments API |
| AZURE_API_OFFERS_PUBLISH_PROFILE | Contents of the publish profile for the Offers API |
| AZURE_FUNCTIONAPP_PUBLISH_PROFILE | Contents of the publish profile for the Receipt Function Application |

![The GitHub repository secrets screen is displayed with a table containing all the secrets added in this lab.](media/github_secretslisting.png "GitHub repository secrets")

### Task 5: Define the production deployment workflow

1. In the web browser, return to the ContosoSports repository on GitHub, and select the **Actions** tab.

    ![On the ContosoSports repository screen, the Actions tab is selected.](media/github_actionstab.png "Repository Actions")

2. Beneath the **Get started with GitHub Actions** heading, select the **set up a workflow yourself** link.

3. Above the editor, name the workflow **productiondeployment.yml**. Remove all code in the file editor.

    ![The Actions workflow editor is displayed with an empty code listing with the name productiondeployment.yml highlighted.](media/github_actions_namedandempty.png "The Actions workflow editor")

4. Copy and paste the following workflow to the text editor. The code is documented inline.

    ```yml
    name: Contoso Sports Production Deployment

    # This workflow is triggered on push to the master branch of the repository
    on:
    push:
        branches:
        - master

    # Environment variables are defined so that they can be used throughout the job definitions.
    # Be sure to replace the tokens in the AZURE_*_NAME variables with the names of the resources in Azure
    env:  
    AZURE_WEBAPP_NAME: '<E-Commerce Web Application Name - named similar to contosoapp{random characters}>'
    AZURE_WEBAPP_PROJECT_NAME: 'Contoso.Apps.SportsLeague.Web'  
    AZURE_WEBAPP_PUBLISH_PROFILE: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}

    AZURE_ADMINAPP_NAME: '<The name of the Call Center admin App Service in Azure>'
    AZURE_ADMINAPP_PROJECT_NAME: 'Contoso.Apps.SportsLeague.Admin'

    AZURE_API_PAYMENT_NAME: '<The name of the Payments API App Service in Azure>'
    AZURE_API_PAYMENT_PROJECT_NAME: 'Contoso.Apps.PaymentGateway'
    AZURE_API_PAYMENT_PUBLISH_PROFILE: ${{ secrets.AZURE_API_PAYMENT_PUBLISH_PROFILE }}

    AZURE_API_OFFERS_NAME: '<The name of the Offers API App Service in Azure>'
    AZURE_API_OFFERS_PROJECT_NAME: 'Contoso.Apps.SportsLeague.Offers'
    AZURE_API_OFFERS_PUBLISH_PROFILE: ${{ secrets.AZURE_API_OFFERS_PUBLISH_PROFILE }}

    AZURE_FUNCTIONAPP_NAME: '<The name of the Function App in Azure>'
    AZURE_FUNCTIONAPP_PROJECT_NAME: 'Contoso.Apps.FunctionApp'
    AZURE_FUNCTIONAPP_PUBLISH_PROFILE: ${{ secrets.AZURE_FUNCTIONAPP_PUBLISH_PROFILE }}

    DOTNET_VERSION: '3.1.102'

    # Jobs define the actions that take place when code is pushed to the master branch
    jobs:

    # Build and deploy the E-Commerce Web Application using the Publish Profile
    build-and-deploy-webapp:
        runs-on: ubuntu-latest
        steps:
        # Checkout the repo
        - uses: actions/checkout@master

        # Setup .NET Core SDK
        - name: Setup .NET Core
            uses: actions/setup-dotnet@v1
            with:
            dotnet-version: ${{ env.DOTNET_VERSION }}

        # Run dotnet build and publish on the project
        - name: dotnet build web portal and publish
            run: |
            dotnet build ${{ env.AZURE_WEBAPP_PROJECT_NAME }} --configuration Release
            dotnet publish ${{ env.AZURE_WEBAPP_PROJECT_NAME }} -c Release -o './webdeploy'

        # Deploy to Azure Application Service
        - name: 'Deploy public web portal'
            uses: azure/webapps-deploy@v2
            with:
            app-name: ${{ env.AZURE_WEBAPP_NAME }}
            publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}
            package: './webdeploy'

    # Build and deploy the Call Center admin using the Service Principal credentials
    build-and-deploy-admin:
        runs-on: ubuntu-latest
        steps:
        # Checkout the repo
        - uses: actions/checkout@master

        # Setup .NET Core SDK
        - name: Setup .NET Core
            uses: actions/setup-dotnet@v1
            with:
            dotnet-version: ${{ env.DOTNET_VERSION }}

        # Run dotnet build and publish
        - name: dotnet build web portal and publish on the project
            run: |
            dotnet build ${{ env.AZURE_ADMINAPP_PROJECT_NAME }} --configuration Release
            dotnet publish ${{ env.AZURE_ADMINAPP_PROJECT_NAME }} -c Release -o './admindeploy'

        # Login to Azure
        - name: Login via Az module
            uses: azure/login@v1.1
            with:
            creds: ${{ secrets.AZURE_CREDENTIALS }}

        # Deploy to Azure Application Service
        - name: 'Deploy admin web portal'
            uses: azure/webapps-deploy@v2
            with:
            app-name: ${{ env.AZURE_ADMINAPP_NAME }}
            credentials: ${{ secrets.AZURE_CREDENTIALS }}
            package: './admindeploy'

        ##Azure logout
        - name: logout
            run: |
            az logout

    # Build and deploy the Payments API using the Publish Profile
    build-and-deploy-payment-api:
        runs-on: ubuntu-latest
        steps:
        # Checkout the repo
        - uses: actions/checkout@master

        # Setup .NET Core SDK
        - name: Setup .NET Core
            uses: actions/setup-dotnet@v1
            with:
            dotnet-version: ${{ env.DOTNET_VERSION }}

        # Run dotnet build and publish on the project
        - name: dotnet build web portal and publish
            run: |
            dotnet build ${{ env.AZURE_API_PAYMENT_PROJECT_NAME }} --configuration Release
            dotnet publish ${{ env.AZURE_API_PAYMENT_PROJECT_NAME }} -c Release -o './paymentapideploy'

        # Deploy to Azure App Service 
        - name: 'Deploy payments API'
            uses: azure/webapps-deploy@v2
            with:
            app-name: ${{ env.AZURE_API_PAYMENT_NAME }}
            publish-profile: ${{ env.AZURE_API_PAYMENT_PUBLISH_PROFILE }}
            package: './paymentapideploy'

    # Build and deploy the Offer API using the Publish Profile
    build-and-deploy-offer-api:
        runs-on: ubuntu-latest
        steps:
        # Checkout the repo
        - uses: actions/checkout@master

        # Setup .NET Core SDK
        - name: Setup .NET Core
            uses: actions/setup-dotnet@v1
            with:
            dotnet-version: ${{ env.DOTNET_VERSION }}

        # Run dotnet build and publish on the project
        - name: dotnet build web portal and publish
            run: |
            dotnet build ${{ env.AZURE_API_OFFERS_PROJECT_NAME }} --configuration Release
            dotnet publish ${{ env.AZURE_API_OFFERS_PROJECT_NAME }} -c Release -o './offerapideploy'

        # Deploy to Azure App Service
        - name: 'Deploy offers API'
            uses: azure/webapps-deploy@v2
            with:
            app-name: ${{ env.AZURE_API_OFFERS_NAME }}
            publish-profile: ${{ env.AZURE_API_OFFERS_PUBLISH_PROFILE }}
            package: './offerapideploy'

    # Build and deploy the PDF receipt generation function app using the publish profile
    build-and-deploy-pdffunctionapp:
        runs-on: ubuntu-latest
        steps:
        # Checkout the repo
        - uses: actions/checkout@master

        # Setup .NET Core SDK
        - name: Setup .NET Core
            uses: actions/setup-dotnet@v1
            with:
            dotnet-version: ${{ env.DOTNET_VERSION }}

        # Run dotnet build and publish on the project
        - name: dotnet build web portal and publish
            run: |
            dotnet build ${{ env.AZURE_FUNCTIONAPP_PROJECT_NAME  }} --configuration Release
            dotnet publish ${{ env.AZURE_FUNCTIONAPP_PROJECT_NAME  }} -c Release -o './pdfappdeploy'

        - name: 'Deploy to Azure Function App service'
            uses: Azure/functions-action@v1
            with:
            app-name: ${{ env.AZURE_FUNCTIONAPP_NAME }}
            package: './pdfappdeploy'
            publish-profile: ${{ secrets.AZURE_FUNCTIONAPP_PUBLISH_PROFILE }}
    ```

    >**Note**: Due to the nature of some browsers, you may need to adjust the whitespace of the yml document after it has been pasted into GitHub.

5. Select the **Start commit** button to commit the workflow to the repository.

6. Enter a commit title and comment, and select **Commit new file**.

    ![The Commit new file dialog is shown with the title and description populated.](media/github_commitworkflowform.png "Commit new file dialog")

7. Committing this file is a push to the master branch. This means that the workflow that we just created is triggered. Select the **Actions** tab to view the currently running/historical record of workflow executions.

    ![The workflow we just defined is triggered and is displayed on the Actions tab.](media/github_workflowsstatus.png "GitHub repository Actions tab")

8. You are able to drill into each workflow, and each job executed by the workflow. Furthermore, as you drill into the job, you are able to see the output of each step contained in the job by expanding the section in the console runner window.

    ![The workflow is currently running, the workflow run displays the current status each job.](media/github_runningworkflowsteps.png "Running workflow")

    ![A completed workflow job console is shown with one of the steps expanded so that the output of the step is displayed.](media/github_jobstepexpanded.png "Completed workflow")

### Task 6: Trigger the Production Deployment Workflow

In this task, we will be making a modification to the e-commerce web application in a branch and issuing a pull request to the master branch. We will manually merge the pull request into the master branch to trigger the production deployment workflow.

1. Open a command prompt, and change directory to where the Visual Studio solution file is found.

2. Execute the following commands to create a branch for this modification. Keep this command window open.

    ```shell
    git pull
    git branch textchange
    git checkout textchange
    ```

3. In Visual Studio, expand the e-commerce website project (Web/Contoso.Apps.SportsLeague.Web), and edit and save the **Views/Home/Index.cshtml** file.

    ![The code listing for Views/Home/Index.cshtml is shown with some modified text highlighted.](media/visualstudio_edithomeindex.png "Visual Studio file editor")

4. Return to the command window, and execute the following commands to commit the text change to the branch.

    ```shell
    git commit -am "Changed some text"
    git push --set-upstream origin textchange
    ```

5. In a web browser, return to the ContosoSports source code repository.

6. Above the file listing table, you should see a notification that **textchange had recent pushes**. Select the **Compare &amp; pull request** button.

    ![The textchange had recent pushes notification is shown with the Compare and pull request button highlighted.](media/github_compareandpullrequest.png "Recent push notification")

7. On the **Open a pull request** form, feel free to write a comment, and select the **Create pull request** button.

8. You should now see a message indicating that there are no conflicts with the base branch.

    ![A message indicating there are no conflicts is shown.](media/github_pullrequest_noconflicts.png "No conflicts on the branch")

9. Select the **Actions** tab of the repository to verify that the deployment workflow has not been triggered by the recent file commits on the textchange branch.

10. Return to the pull request that was just created, by selecting the **Pull requests** tab, and selecting the pull request in the list.

11. Select the **Merge pull request** button on the pull request, then select **Confirm merge**.

12. Return to the **Actions** tab, and you should see that the workflow has been triggered (merging pushes new code to the branch, thus the production workflow is triggered).

    ![The workflows list is displayed with an in progress workflow that has been triggered by the merge of the pull request.](media/github_mergeworkflowtriggered.png "Workflow in progress")

13. Once the deployment workflow has completed. Navigate to the E-commerce web application and ensure the changes you made are visible.

    ![A portion of the e-commerce website is shown with the textual change highlighted.](media/ecommerce_textchangevisible.png "Screenshot demonstrating the text change")

## After the hands-on lab

Duration: 10 minutes

### Task 1: Delete resources

1. Since the HOL is now complete, go ahead and delete all the Resource Groups that were created for this HOL. You will no longer need those resources and it will be beneficial to clean up your Azure Subscription.

2. In GitHub, open the ContosoSports repository and select **Settings**. Scroll to the bottom of the screen, and select the **Delete this repository** button in the **Danger Zone** section.

You should follow all steps provided *after* attending the hands-on lab.
