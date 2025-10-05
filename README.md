# 🐦 TweeterApplication – A Decentralized Microblogging Platform

**TweeterApplication** is a Solidity-based decentralized social media (microblogging) contract inspired by Twitter (X). It enables users to post tweets, follow others, send private messages, and delegate tweet permissions securely on the Ethereum blockchain.

---

## 🚀 Features

### 📝 Tweet System
- Users can post tweets publicly on-chain.
- Each tweet includes:
  - **Unique ID**
  - **Author address**
  - **Content**
  - **Timestamp**
- Supports **proxy tweeting** — authorized users (operators) can post on behalf of another account.

### 💬 Messaging System
- Enables **private messages** between users.
- Each message includes:
  - **Message ID**
  - **Sender & receiver address**
  - **Message content**
  - **Timestamp**

### 👥 Follow Mechanism
- Users can follow other accounts.
- Maintains an on-chain following list.

### 🔐 Operator Access
- Users can **grant** or **revoke** operator access.
- Operators can post tweets or send messages on behalf of the owner.

### 📜 Data Retrieval
- Retrieve latest tweets globally or from a specific user.
- Each retrieval returns an array of `Tweet` structs with metadata.

---

## 🧩 Smart Contract Structure

| Component | Type | Description |
|:----------|:-----|:------------|
| `Tweet` | Struct | Stores tweet data (id, author, content, timestamp) |
| `Message` | Struct | Stores message details (id, content, from, to, timestamp) |
| `tweets` | Mapping | Maps tweet ID → Tweet |
| `tweetsOf` | Mapping | Maps user address → list of tweet IDs |
| `conversations` | Mapping | Maps user → list of sent messages |
| `operators` | Mapping | Tracks delegated access permissions |
| `following` | Mapping | Tracks which accounts a user follows |

---

## ⚙️ Functions Overview

### **1. Tweet Functions**
| Function | Access | Description |
|:----------|:--------|:------------|
| `tweet(string _content)` | Public | Create a tweet as the sender |
| `tweet(address _from, string _content)` | Public | Create a tweet on behalf of another user (if authorized) |

### **2. Message Functions**
| Function | Access | Description |
|:----------|:--------|:------------|
| `sendMessage(string _content, address _to)` | Public | Send a private message |
| `sendMessage(address _from, address _to, string _content)` | Public | Send message as an operator on behalf of `_from` |

### **3. Follow System**
| Function | Access | Description |
|:----------|:--------|:------------|
| `follow(address _followed)` | Public | Follow another user |

### **4. Operator Management**
| Function | Access | Description |
|:----------|:--------|:------------|
| `allow(address _operator)` | Public | Grant operator permission |
| `disAllow(address _operator)` | Public | Revoke operator permission |

### **5. Read Functions**
| Function | Type | Description |
|:----------|:-----|:------------|
| `getLatestTweet(uint count)` | View | Retrieve latest global tweets |
| `getLatestOfUser(address _user, uint count)` | View | Retrieve latest tweets of a specific user |

---

## 🧪 Example Usage

```solidity
// 🐤 Post a Tweet
tweet("Hello Blockchain World!");

// 💬 Send a Message
sendMessage("Hey there!", 0xAbC123...);

// 🔑 Grant Operator Access
allow(0xDef456...); // Allow another address to post on your behalf

// 📜 Retrieve Latest Tweets
getLatestTweet(5); // Returns last 5 tweets


---

## 🛠️ Requirements & Deployment

### Requirements
- **Solidity Version**: `^0.8.0`
- **Compiler Compatibility**: Remix IDE / Hardhat / Truffle
- **Blockchain**: Ethereum-compatible (EVM-based)

### ⚡ Deployment (Using Remix)
1.  Open **Remix IDE**.
2.  Create a new file `TweeterApplication.sol`.
3.  Paste the smart contract code.
4.  Compile using Solidity version **0.8.x**.
5.  Deploy under any environment (**JavaScript VM** / **Injected Provider**).
6.  Interact using Remix’s UI panel.

---

## 🔒 Security Notes
- Always test **operator permissions** thoroughly before deploying on a mainnet.
- Avoid posting **sensitive or excessively long content** due to gas constraints and the public nature of the blockchain.
- Consider integrating **event logs** for efficient off-chain tracking of new tweets, messages, and follows.

---

## 🧠 Future Enhancements
- Add **events**: `TweetCreated`, `MessageSent`, `Followed` for better off-chain indexing.
- Implement **`unfollow()`** and **`getFollowingList()`** functions.
- Include **pagination** for efficient tweet and message retrieval.
- Develop a **Frontend integration** with Web3.js or Ethers.js.

---

## 📄 License

This project is licensed under the **MIT License** — you are free to use, modify, and distribute it with proper attribution.

---

## 👨‍💻 Author

**Ritik Raushan**

Blockchain & Web Developer | Open Source Enthusiast

📧 ritikraushan9534@gmail.com