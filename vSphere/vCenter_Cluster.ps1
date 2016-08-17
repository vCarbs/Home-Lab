# Initial Cluster Configuration - Created with Project Onyx


# ------- CreateDatacenter -------

$_this = Get-View -Id 'Folder-group-d1'
$_this.CreateDatacenter("New Datacenter")


# ------- Rename_Task -------

$_this = Get-View -Id 'Datacenter-datacenter-47'
$_this.Rename_Task("Datacenter_Name")


# ------- CreateClusterEx -------

$spec = New-Object VMware.Vim.ClusterConfigSpecEx
$spec.vmSwapPlacement = "vmDirectory"
$spec.dasConfig = New-Object VMware.Vim.ClusterDasConfigInfo
$spec.dasConfig.enabled = $true
$spec.dasConfig.vmMonitoring = "vmMonitoringDisabled"
$spec.dasConfig.hostMonitoring = "enabled"
$spec.dasConfig.admissionControlPolicy = New-Object VMware.Vim.ClusterFailoverLevelAdmissionControlPolicy
$spec.dasConfig.admissionControlPolicy.failoverLevel = 1
$spec.dasConfig.admissionControlEnabled = $false
$spec.dasConfig.defaultVmSettings = New-Object VMware.Vim.ClusterDasVmSettings
$spec.dasConfig.defaultVmSettings.restartPriority = "medium"
$spec.dasConfig.defaultVmSettings.isolationResponse = "none"
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings = New-Object VMware.Vim.ClusterVmToolsMonitoringSettings
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.enabled = $true
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.failureInterval = 30
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.minUpTime = 120
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.maxFailures = 3
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.maxFailureWindow = 3600
$spec.drsConfig = New-Object VMware.Vim.ClusterDrsConfigInfo
$spec.drsConfig.enabled = $true
$spec.drsConfig.defaultVmBehavior = "fullyAutomated"
$spec.drsConfig.vmotionRate = 3
$spec.dpmConfig = New-Object VMware.Vim.ClusterDpmConfigInfo
$spec.dpmConfig.enabled = $false
$spec.dpmConfig.hostPowerActionRate = 3

$_this = Get-View -Id 'Folder-group-h49'
$_this.CreateClusterEx("Cluster_Name", $spec)


# ------- QueryConnectionInfo -------

$_this = Get-View -Id 'Datacenter-datacenter-47'
$_this.QueryConnectionInfo("esx.host.name", -1, "root", "password", "thumbprint")


# ------- ReconfigureComputeResource_Task -------

$spec = New-Object VMware.Vim.ClusterConfigSpecEx
$spec.vmSwapPlacement = "vmDirectory"
$spec.dasConfig = New-Object VMware.Vim.ClusterDasConfigInfo
$spec.dasConfig.vmMonitoring = "vmMonitoringDisabled"
$spec.dasConfig.defaultVmSettings = New-Object VMware.Vim.ClusterDasVmSettings
$spec.dasConfig.defaultVmSettings.restartPriority = "medium"
$spec.dasConfig.defaultVmSettings.isolationResponse = "none"
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings = New-Object VMware.Vim.ClusterVmToolsMonitoringSettings
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.enabled = $true
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.vmMonitoring = "vmMonitoringOnly"
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.failureInterval = 30
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.minUpTime = 120
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.maxFailures = 3
$spec.dasConfig.defaultVmSettings.vmToolsMonitoringSettings.maxFailureWindow = 3600
$spec.drsConfig = New-Object VMware.Vim.ClusterDrsConfigInfo
$spec.drsConfig.enabled = $true
$spec.drsConfig.defaultVmBehavior = "fullyAutomated"
$spec.drsConfig.vmotionRate = 3
$spec.dpmConfig = New-Object VMware.Vim.ClusterDpmConfigInfo
$spec.dpmConfig.enabled = $false
$spec.dpmConfig.hostPowerActionRate = 3

$_this = Get-View -Id 'ClusterComputeResource-domain-c52'
$_this.ReconfigureComputeResource_Task($spec, $true)
