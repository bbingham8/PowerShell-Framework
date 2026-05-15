\# Modular PowerShell Security Framework



A hardened, modular PowerShell environment designed for \*\*Operational Security (OpSec)\*\* and \*\*Workflow Automation\*\*. This framework separates public automation logic from private environment configurations and implements security gating for web-facing applications.



\## 🛡️ Core Security Features



\### 1. VPN-Gated Execution

To prevent IP leakage, the framework includes a `Start-SecureProcess` wrapper. This function performs a "Pre-Flight" check on the system's VPN status before allowing browsers or other web-facing tools to launch.



\### 2. Modular Architecture (Public/Private Split)

The repository implements a \*\*Zero-Footprint\*\* strategy for sensitive data. 

\* \*\*`Microsoft.PowerShell\_profile.ps1`\*\*: Contains the logic, functions, and public aliases.

\* \*\*`PrivateProfile.ps1` (Git-Ignored)\*\*: Houses local paths, server IPs, and sensitive credentials.



\### 3. Automated Data Lifecycle Management

The `Invoke-Backup` function automates the transition of data from "Hot" local storage to "Archival" storage. It preserves directory structures (containers) while clearing local file contents to maintain a clean workspace.



\---



\## 📊 System Logic Flow



```mermaid 

graph TD

&#x20;   A\[User Command] --> B{VPN Active?}

&#x20;   B -- No --> C\[Write-Warning: VPN Required]

&#x20;   B -- Yes --> D\[Start-SecureProcess]

&#x20;   D --> E\[Launch Application with Privacy Flags]

&#x20;   

&#x20;   subgraph Data Management

&#x20;   F\[Invoke-Backup] --> G\[Create Dated Archive]

&#x20;   G --> H\[Mirror Folder Tree]

&#x20;   H --> I\[Purge Local Files]

&#x20;   end



