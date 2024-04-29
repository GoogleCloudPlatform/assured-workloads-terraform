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

 resource "google_project" "dependency_project" {
  project_id      = "${var.dependency_project_id}"
  name            = "${var.dependency_project_id}"
  billing_account = var.billing_account
  org_id          = var.organization_ID
}

# Enable the Assured Workloads API in the dependency project
resource "google_project_service" "enable_api" {
  service                    = "assuredworkloads.googleapis.com"
  project                    = google_project.dependency_project.project_id
  disable_on_destroy         = false
  disable_dependent_services = false
  depends_on                 = [google_project.dependency_project]
}

resource "google_assured_workloads_workload" "primary" {
  provider                  = google-beta.service
  compliance_regime         = var.compliance_regime
  display_name              = var.display_name
  location                  = var.location
  organization              = var.organization_ID
  billing_account           = "billingAccounts/${var.billing_account}"
  enable_sovereign_controls = var.sovereignty
  
 //Creates a Key Management project in the Assured Workloads folder
  resource_settings {
    display_name = "${var.compliance_regime}-Key-Management"
    resource_type = "ENCRYPTION_KEYS_PROJECT"
  }

  //Creates a Key Ring in the Key Management project
  resource_settings {
    resource_id   = "${var.compliance_regime}-Key-Ring"
    resource_type = "KEYRING"
  }

/*OPTIONAL
Format constraints:
The value can only contain lowercase letters, numeric characters, underscores and dashes. 
The value can be at most 63 characters long. International characters are allowed. */
  labels = {
    label-one = "compliance-boundary"
  }

  depends_on = [
    google_project_service.enable_api,
  ]
}
