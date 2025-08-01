# 🌍 Crowdsourced Disaster Relief Fund Smart Contract

## 🧠 What is it?

This smart contract enables anyone to **donate ETH** to a pool that automatically distributes funds to **verified victims or charities** when a **natural disaster** is confirmed.
 
Disaster verification is done by either:

- A trusted **oracle** (e.g., Chainlink external data feed).
- A decentralized **DAO vote** (or designated multisig wallet).

## 🎯 Why?

Disasters strike without warning. Traditional relief fund disbursements often face:

- **Delays** in releasing funds
- **Lack of transparency**
- **Centralized inefficiencies**

This contract:

- Enables **fast and transparent relief** based on public donations.
- Allows DAO/oracle-triggered verification to **mitigate fraud**.
- Makes **fund distribution automatic** and tamper-proof.

## 🛠️ Features

- ✅ Donation tracking by wallet
- ✅ Verifier-controlled disaster status toggle
- ✅ Admin sets recipients once disaster is verified
- ✅ Equal fund distribution to all recipients
- ✅ Fully open-source and on-chain

## 🧪 How it Works

1. Donors send ETH to the contract via `donate()`.
2. A disaster is **verified** using `verifyDisaster()` by a trusted verifier (e.g., DAO multisig).
3. Admin sets recipient wallets using `setRecipients([...])`.
4. Funds are equally distributed using `distributeFunds()`.

## ⚙️ Roles

- **Admin**: Deploys contract, manages recipients, triggers fund distribution.
- **Verifier**: Oracle/DAO that confirms a real disaster has occurred.

## 🔐 Security Notes

- Ensure verifier is a trusted source.
- Consider adding a **timelock** or **community DAO** for transparency.

## 🧩 Future Enhancements

- ✅ Integration with Chainlink or API3 oracle
- ✅ Quadratic distribution based on severity or votes
- ✅ Frontend dashboard for donations and disaster updates

## 📜 License

MIT License
