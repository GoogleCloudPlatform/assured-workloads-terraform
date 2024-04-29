
## About

Assured Workloads provides Google Cloud users with the ability to apply controls to a folder in support of regulatory, regional, or sovereign requirements.
Assured Workloads provides control packages to support the creation of compliant boundaries in Google Cloud. A control package is a set of controls that, when combined together, supports the regulatory baseline for a compliance statute or regulation. These controls include mechanisms to enforce data residency, data sovereignty, personnel access, and more.

Control packages are organized into control package families according to the type of controls they provide:

1.Regional controls provide data residency with optional personnel controls and regional support.
2.Sovereign controls provide data residency, personnel controls, regional support, and enhanced controls for data sovereignty such as Cloud External Key Manager (Cloud EKM), Cloud HSM, and Key Access Justifications. Additional partner-managed control packages are available through Sovereign Controls by Partners.
3.Regulatory controls provide certified controls tailored to meet specific regulatory and compliance statute requirements.
4.This page provides more information about each control package and control package available in Assured Workloads, which are available in two pricing tiers: Free and Premium. See Assured Workloads pricing for more information about these tiers.

Before proceeding, it is important to understand that Assured Workloads is comprised of two tiers: Free and Premium. More information is available on the [Assured Worklods pricing page](https://cloud.google.com/assured-workloads/pricing)  

## Prerequisites

To create an Assured Workloads folder, you must be granted the Assured Workloads Administrator (roles/assuredworkloads.admin) role, which contains the minimum IAM permissions to create and manage Assured Workloads folders.

To launch a Premium Platform Control, you must [Enable Access Transparency](https://cloud.google.com/cloud-provider-access-management/access-transparency/docs/enable)

## Recommendations

Many Google Cloud services send out notifications to share important information with Google Cloud users. With [Essential Contacts](https://cloud.google.com/resource-manager/docs/managing-notification-contacts), you can customize who receives notifications by providing your own list of contacts. This is important because different individuals and teams within your organization care about different types of notifications. To reduce the impact of personnel changes, we recommend adding groups as contacts, then managing the membership of those groups to determine who receives notifications. This practice helps ensure that notifications always go to active employees.

1. Enable the [Essential Contacts API](https://console.cloud.google.com/flows/enableapi?apiid=essentialcontacts.googleapis.com&_ga=2.178924196.1685767107.1678727190-215554569.1678472440)
2. Visit the [Essential Contacts page](https://console.cloud.google.com/iam-admin/essential-contacts?_ga=2.217834006.1685767107.1678727190-215554569.1678472440)
3. Ensure the Google Cloud Organization is selected
5. [Add an Essential Contact](https://cloud.google.com/resource-manager/docs/managing-notification-contacts#add) for **Legal**

We recommend adding three Contacts for the Legal category: representatives from your Legal, Compliance, and Security departments. **This group will receive notifications of compliance violations**, so this will ensure that Legal and Compliance remain informed, and acts as an immediate notification to Security for remediation actions. We also recommend that you enact a plan of action for addressing these alerts.

## Tips

We also strongly recommend that you do not nest an Assured Workloads folder within another Assured Workloads folder - even if they are the same compliance framework - as this will cause errors. You can, however, nest Assured Workloads folders and non-Assured Workloads folders with each other.
