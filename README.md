## Modular PowerShell Security Framework

A hardened, modular PowerShell environment designed for **Operational Security (OpSec)**.

### 📊 System Logic Flow

`mermaid
graph TD
    A[User Command] --> B{VPN Active?}
    B -->|No| C[Write-Warning]
    B -->|Yes| D[Start-Process]
    
    subgraph Data
    F[Invoke-Backup] --> G[Archive]
    G --> H[Mirror]
    H --> I[Purge]
    end
@
