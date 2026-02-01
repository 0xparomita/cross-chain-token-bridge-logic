# Cross-Chain Token Bridge Logic

This repository explores the fundamental architecture of blockchain bridges. It focuses on the **Lock & Mint** and **Burn & Unlock** models, which are the industry standards for interoperability.

## Core Mechanism
1. **L1 (Source):** User locks their tokens in the `BridgeL1` contract.
2. **Validator/Relayer:** An off-chain service detects the `Locked` event and verifies it.
3. **L2 (Destination):** The `BridgeL2` contract mints an equivalent amount of "Wrapped" tokens for the user.



## Security Features
* **Threshold Signatures:** Requires multiple validator signatures to mint tokens on the destination chain.
* **Emergency Stop:** Built-in circuit breakers to pause the bridge in case of suspicious activity.

## Warning
This is a demonstration of bridge logic. Real-world bridges require complex off-chain relayer infrastructure and rigorous security audits.
