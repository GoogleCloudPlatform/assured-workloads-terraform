/*
 Copyright 2024 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

variable "enable_assured"{
  description = "Boolean value to enable/disable Assured Workloads"
  type = object({
    enabled = optional(bool, true)
    })
    default = {}
}

variable "organization_ID" {
  description = "Your Google Cloud Org ID"
  type        = string
  default = "{Add the desired value}"
}

variable "billing_account" {
  description = "Your Google Cloud Billing Account ID"
  type        = string
  default     = "XXXXXX-XXXXXX-XXXXXX"
}

/*
API calls to create an Assured Workloads folder rely on an existing Billing Project's ID
Therefore, we must create a new project, whose ID is used in provider.tf, to create the Assured Workloads folder
*/

variable "dependency_project_id" {
  description = "Billing Project ID Required for Assured Workloads creation"
  type        = string
  default     = "{Add the desired value}"
}

/*
Free Tier: FEDRAMP_MODERATE 

Premium:
CJIS, FEDRAMP_HIGH, US_REGIONAL_ACCESS, HIPAA, HITRUST, 
EU_REGIONS_AND_SUPPORT, CA_REGIONS_AND_SUPPORT, ITAR, AU_REGIONS_AND_US_SUPPORT, ASSURED_WORKLOADS_FOR_PARTNERS, 
ISR_REGIONS, ISR_REGIONS_AND_SUPPORT, CA_PROTECTED_B, IL2, IL4, IL5, JP_REGIONS_AND_SUPPORT  
compliance_regime: Supported Compliance Regimes. 
See https://cloud.google.com/assured-workloads/docs/reference/rest/Shared.Types/ComplianceRegime .
*/
variable "compliance_regime" {
  description = "The Assured Workloads Control Package"
  type        = string
  default     = "{Add the desired value}"
}

/*Optional.  
Should only be set to True if the compliance_regime is set to ASSURED_WORKLOADS_FOR_PARTNERS*/
variable "sovereignty"{
     description = "Indicates the sovereignty status of the given workload."
     type = string
     default = false
}

variable "display_name" {
  description = "The display name for the Assured Workloads folder"
  type        = string
  default     = "{Add the desired value}"
}

/*
Region codes available at https://cloud.google.com/about/locations
We recommend selecting multi-regions to allow for resource deployment across multiple regions.
*/
variable "location" {
  description = "The location of the Assured Workloads folder"
  type        = string
  default = "{Add the desired value}"
}
