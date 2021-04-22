![Microsoft Cloud Workshops](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/main/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
Modern cloud apps
</div>

<div class="MCWHeader2">
Before the hands-on lab setup guide
</div>

<div class="MCWHeader3">
November 2020
</div>

Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2020 Microsoft Corporation. All rights reserved.

Microsoft and the trademarks listed at <https://www.microsoft.com/en-us/legal/intellectualproperty/Trademarks/Usage/General.aspx> are trademarks of the Microsoft group of companies. All other trademarks are property of their respective owners.# Modern Cloud Apps setup

**Contents**

<!-- TOC -->

- [Modern cloud apps before the hands-on lab setup guide](#modern-cloud-apps-before-the-hands-on-lab-setup-guide)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
    - [Task 1: Download GitHub resources](#task-1-download-github-resources)
    - [Task 2: Deploy Lab VM Resources to Azure](#task-2-deploy-lab-vm-resources-to-azure)
    - [Task 3: Deploy Environment Resources to Azure](#task-3-deploy-environment-resources-to-azure)
    - [Task 4: Explore the Contoso Sports League sample](#task-4-explore-the-contoso-sports-league-sample)

<!-- /TOC -->

# Modern cloud apps before the hands-on lab setup guide

## Requirements

- Microsoft Azure MSDN subscription

  - You will need permissions within the Azure Subscription and Azure Active Directory (Azure AD) to create users and setup Azure AD B2C.

- Local machine or Azure virtual machine configured with:

  - Visual Studio 2019 Community Edition or later
  - Windows Server 2019

## Before the hands-on lab

Duration: 30 minutes

Before initiating the hands-on lab, you will setup an environment to use for the rest of the exercises.

### Task 1: Download GitHub resources

1. Open a browser window to the Cloud Workshop GitHub repository (<https://github.com/microsoft/MCW-Modern-cloud-apps>).

2. Select **Clone or download**, then select **Download Zip**.

    ![The GitHub Clone or download menu is expanded with the Download ZIP button highlighted.](media/github-download-zip.png "The GitHub clone or download menu.")

3. Extract the zip file to your local machine, be sure to keep note of where you have extracted the files. You should now see a set of folders:

    ![Windows Explorer showing the extracted files.](media/file-explorer-hands-on-lab.png "Windows Explorer")

### Task 2: Deploy Lab VM Resources to Azure

1. Select the following **Deploy to Azure** button to deploy the ARM Template with the Lab VM resources for this lab. This link will deep link into the Azure Portal, passing in the ARM Template for deploying the resources for this lab.

    [![Deploy to Azure button.](images/azure-deploy-button-small.png "Deploy to Azure")](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FMCW-Modern-cloud-apps%2Fmaster%2FHands-on%20lab%2Fscripts%2Flabvm%2Ftemplate.json)

    >**Note**: If you have issues with the **Deploy to Azure** link, then do a new **Custom deployment** in the Azure Portal using the `/Hands-on lab/scripts/labvm/template.json` ARM Template within the lab files.

2. On the **Custom deployment** form, select **Edit parameters**.

    ![A portion of the Custom deployment form is displayed with the Edit parameters button highlighted.](media/custom-deployment-edit.png "The Edit parameters button")

3. On the **Edit parameters** pane, select the **Load file** button.

4. Locate and open the `\Hands-on lab\scripts\labvm\parameters.json` file within the extracted files.

5. Select **Save**.

6. In the **Subscription** field, select the appropriate subscription.

7. Select **Create new** for the **Resource group** field, and enter `ContosoSports-[your initials or first name]`.

8. Select your desired region in the **Region** field.

9. Select **Review + create**.

    ![The Custom deployment form is shown populated with the values described above.](media/custom-deployment.png "The custom deployment form")

10. Once validation has succeeded, select the **Create** button.

11. The deployment will take 15-30 minutes to complete. Continue to the next Task while this is deploying.

    To view the progress, select the **Deployments** link, then select the **Microsoft.Template** deployment.

    ![The template deployment status is shown.](media/deployments-microsoft-template.png "Resource group deployments")

    > **Note**: A configuration script to install SSMS and the requires lab files will run after the deployment of the LabVM completes. The task will be listed on the deployment progress screen as `LabVM/CustomScriptExtension`. You should wait for this task to complete before attempting to log into the LabVM in the next task, as it downloads and installs files you will need.
    >
    > ![The CustomScriptExtension task in highlighted in the list of deployment tasks.](media/deployment-progress.png "Deployment progress")

### Task 3: Deploy Environment Resources to Azure

1. Select the following **Deploy to Azure** button to deploy the ARM Template with the Environment resources for this lab. This link will deep link into the Azure Portal, passing in the ARM Template for deploying the resources for this lab.

    [![Deploy to Azure button.](images/azure-deploy-button-small.png "Deploy to Azure")](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FMCW-Modern-cloud-apps%2Fmaster%2FHands-on%20lab%2Fscripts%2Fenvironment%2Ftemplate.json)

    >**Note**: If you have issues with the **Deploy to Azure** link, then do a new **Custom deployment** in the Azure Portal using the `/Hands-on lab/scripts/environment/template.json` ARM Template within the lab files.

2. Select **Edit parameters**.

    ![A portion of the Custom deployment form is displayed with the Edit parameters button highlighted.](media/custom-deployment-edit.png "The Edit parameters button.")

3. On the **Edit parameters** pane, select the **Load file** button.

4. Locate and open the `\Hands-on lab\scripts\environment\parameters.json` file within the extracted files.

5. Select **Save**.

6. On the **Custom deployment** form, select your desired subscription for this lab.

7. For the **Resource group** field, select the resource group that you created in the previous task, **ContosoSports-{suffix}**.

8. On the **Location** field for the Custom deployment, choose the Azure Region closest to you.

    > **Note**: For this lab, it is recommended you use the **East US**, **North Europe**, or **Australia East** Azure Region. There are certain Azure regions that don't support all the resources provisioned by the ARM Template. This limitation can also vary depending on restrictions applied to the type of Azure Subscription you are using.

9. Select **Review + create**.

    ![The Custom deployment form is shown populated with the values described above.](media/custom-deployment.png "The Custom deployment form")

    > **Note**: The deployment may fail if you have not registered the `Microsoft.AppConfiguration` resource provider for the subscription you are using. To fix this, just navigate to your subscription and locate **Settings --> Resource providers**. Then search for `Microsoft.AppConfiguration`, select the resource provider, and select **Register**.
    >
    > ![Demonstrating how to register the AppConfiguration resource provider.](media/registering-appconfiguration-resource-provider.png "Registering Microsoft.AppConfiguration within portal")

10. The deployment will take 5 - 10 minutes to complete.

### Task 4: Explore the Contoso Sports League sample

1. In the Azure Portal, open the Resource group that you created for the lab.

2. Locate and select the **LabVM** resource.

3. From the top toolbar, expand the **Connect** button and select **RDP**.

   ![The Connect button is expanded with the RDP item selected.](media/connectvm-rdp.png "The LabVM Connect menu")

4. From the **Connect** screen, select the **Download RDP File** button and save it to the desired location on your local computer.

5. Connect to the **LabVM** that was deployed using the previous template using Remote Desktop by double-clicking the RDP file that you downloaded in the previous step. Authenticate to the VM using these credentials:

    - **Admin username**: `demouser`
    - **Admin password**: `demo@pass123`

    > **Note**: Be sure to wait until the **Lab VM** ARM Template deployment has completed before connecting to the **LabVM** virtual machine.

6. Using **File Explorer**, open the `C:\MCW` folder.

7. From the **Contoso Sports League** folder under **MCW**, open the Visual Studio Solution file: `Contoso.Apps.SportsLeague.sln`. Be sure to sign into Visual Studio using your Azure credentials.

8. The solution contains the following projects:

    | Project | Description |
    |:----------|:-------------|
    | Contoso.Apps.SportsLeague.Web |   Contoso Sports League e-commerce application |
    | Contoso.Apps.SportsLeague.Admin |   Contoso Sports League call center admin application |
    | Contoso.Apps.Common  |   Shared tier |
    | Contoso.Apps.SportsLeague.Data  |   Shared tier |
    | Contoso.Apps.FunctionApp  |   Function app tier |
    | Contoso.Apps.SportsLeague.Offers |  API for returning list of available products |
    | Contoso.Apps.PaymentGateway   |     API for payment processing |

You should follow all the steps provided *before* performing the Hands-on lab.
