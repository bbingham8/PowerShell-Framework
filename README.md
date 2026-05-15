# Modular PowerShell Security Framework

A hardened, modular PowerShell environment designed for **Operational Security (OpSec)**.

## 📊 System Logic Flow

`mermaid 
graph TD
    A[User Command] --> B{VPN Active?}
    B -- No --> C[Write-Warning: VPN Required]
    B -- Yes --> D[Start-SecureProcess]
    D --> E[Launch Application with Privacy Flags]
    
    subgraph Data Management
    F[Invoke-Backup] --> G[Create Dated Archive]
    G --> H[Mirror Folder Tree]
    H --> I[Purge Local Files]
    end

`

