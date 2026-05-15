# Modular PowerShell Security Framework

A hardened, modular PowerShell environment designed for **Operational Security (OpSec)** and automated workflow management.

## 🛡️ Core Security Features

### 1. VPN-Gated Execution
To prevent IP leakage, the framework includes a wrapper that performs a "Pre-Flight" check on the system VPN status before allowing web-facing applications to launch.

### 2. Modular Architecture
Separates public automation logic from private configurations. Sensitive paths and credentials remain in a Git-ignored `PrivateProfile.ps1` file to maintain repository integrity.

### 3. Automated Data Lifecycle
Includes an `Invoke-Backup` engine that automates the transition of data from local storage to archival storage while preserving directory structures.

## 🛠️ Technical Stack
* **Language:** PowerShell 7+
* **Security Principle:** Defense in Depth
* **Environment:** Hardened Windows/Linux (SOC-focused)

## 👨‍💻 Author
**Barrie Bingham** (bbingham8)
