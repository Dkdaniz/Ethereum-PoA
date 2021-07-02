# Ethereum Proof of Authority 

In this repository your will find a step by step for setup an Ethereum private network with the Consensus PoA (Proof of Authority).

## Install Geth + Tools

- build for your SO

- Access the link: https://geth.ethereum.org/downloads/ 

- In the **Stable Releases** do the Download of **Geth & Tools** current stable release

- Create a new folder with name **utils**

- Move the geth and tools for this folder.

## Setting Files

- Open **Terminal** in Folder of your **Project**

```
mkdir validators && cd validators && mkdir validator1 validator2 validator3 && cd ../
```

## Create Accounts of Validators

- Open **Terminal** in Folder of your **Project**

```
./utils/geth --datadir validators/validator1/ account new
```
```
./utils/geth --datadir validators/validator2/ account new
```
```
./utils/geth --datadir validators/validator3/ account new
```

## Save Public Keys

- Open **Terminal** in Folder of your **Project**

```
echo '0xc701373BfEB21913ddfD8a8De0b08476be84A067' >> accounts.txt
```
```
echo 'PUBLIC-KEY-VALIDATOR2' >> accounts.txt
```
```
echo 'PUBLIC-KEY-VALIDATOR3' >> accounts.txt
```

## Save Passwords

- Open **Terminal** in Folder of your **Project**

```
echo '123456789' > validators/validator1/password.txt
```
```
echo '123456789' > validators/validator2/password.txt
```
```
echo '123456789' > validators/validator3/password.txt
```

## Create your Genesis file using Puppeth 

- Open **Terminal** in Folder of your **Project**

- ```./utils/puppeth```
### **1 - Specify network name**

```
Please specify a network name to administer (no spaces, hyphens or capital letters please)
```
- Enter name: ```YOUR-NETWORK-NAME```

### **2 - Generate a new genesis file**

```
What would you like to do? (default = stats)
```

- Choose: ```2```

```
What would you like to do? (default = stats)
```

- Choose: ```1```

### **3 - Select Consensus Type (proof-of-authority)**

```
Which consensus engine to use? (default = clique)
```

- Choose: ```2```

### **4 - Time to generate a new Block**

```
How many seconds should blocks take? (default = 15)
```

- Choose: ```1```

### **5 - Pre-funded Config**

```
Which accounts should be pre-funded? (advisable at least one)
```

- Choose: ```0x```

```
Should the precompile-addresses (0x1 .. 0xff) be pre-funded with 1 wei? (advisable yes)
```

- Choose: ```yes```

### **6 - Specify your chain/network ID**

```
Specify your chain/network ID if you want an explicit one (default = random)

```

- Choose: ```1717```

### **6 - Backup Genesis File**

#### **Manage existing genesis**

```
What would you like to do? (default = stats)
 1. Show network stats
 2. Manage existing genesis
 3. Track new remote server
 4. Deploy network components
```

- Choose: ```2```

#### **Export genesis configurations**

``` 
 1. Modify existing configurations
 2. Export genesis configurations
 3. Remove genesis configuration
 ```
 - Choose: ```2```

 ### **7 - Rename File for genesis.json**

 - Open **Terminal** in Folder of your **Project**

 ```
  mv YOUR-NETWORK-NAME.json genesis.json && rm -rf YOUR-NETWORK-NAME-harmony.json
```
 ### **8 - Modify the Genesis file**

- Alter **period** of **1** for **0**.

 ```json
  "clique": {
      "period": 0,
      "epoch": 30000
    }
```
### **9 - Initialize the Nodes**

 - Open **Terminal** in Folder of your **Project**

```
./utils/geth --datadir validators/validator1 init genesis.json 
```
```
./utils/geth --datadir validators/validator2 init genesis.json 
```
```
./utils/geth --datadir validators/validator3 init genesis.json 
```

### **10 - Run the Nodes**

#### **Validator1**

```
cd validators/validator1 && ../../utils/geth --nousb --datadir=$pwd --syncmode 'full' --port 30310 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr 'localhost' --http.port 8545 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock "PUBLIC-KEY-VALIDATOR1" --password password.txt
```
- Copy Enode:
```
INFO [12-23|15:19:04.669] Started P2P networking self=enode://061128ea0a67e04017832cf85d6c560a6464db7b475da2161cb8f97341969c8cfe3b749a14fca28b3e3cd0965c4dc6a5d8978a8c85b53881d2e99d602c6379e7@127.0.0.1:30310
```
In my case is ```enode://061128ea0a67e04017832cf85d6c560a6464db7b475da2161cb8f97341969c8cfe3b749a14fca28b3e3cd0965c4dc6a5d8978a8c85b53881d2e99d602c6379e7@127.0.0.1:30310```

#### **Validator2**

```
cd validators/validator2 && ../../utils/geth --nousb --datadir=$pwd --syncmode 'full' --port 30311 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr 'localhost' --http.port 8546 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock "PUBLIC-KEY-VALIDATOR2" --password password.txt && cd ../../.
```

- Copy Enode:
```
INFO [12-23|15:23:49.558] Started P2P networking self=enode://ca3a50686129eb9cae43f1b6d1bb14fd47dbd5845ca7a0f3ea5a40e6d8364ec5c10fe634e9a6fbdf5cea662937d0093cd238c24abbe114804132232289bbb83e@127.0.0.1:30311
```
#### **Validator3**

```
cd validators/validator3 && ../../utils/geth --nousb --datadir=$pwd --syncmode 'full' --port 30312 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr 'localhost' --http.port 8547 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock "PUBLIC-KEY-VALIDATOR3" --password password.txt && cd ../../.
```

```
INFO [12-23|15:23:49.558] Started P2P networking self=enode://5e0a0e476051c69f24914c5880e682567c745ddcc43f844d8816f838688e415347df096d82e990e45736b75df7db80ea2c2c815052cc202df3583b7a6e52ae8c@127.0.0.1:30312
```

### **11 - Create static-nodes.json file**

At this stage, you will create a static-nodes.json with all the Enode that was previously created.

```json
[
  "enode://4511239b3b16175dc4ea4f93ed6439e4bdaafa89fb45b0aa77b8849491f872633f1204fb0a6b0cb14bec5d6adafcdd93d6531d8fbfe7f30fd76de34a82737b2b@127.0.0.1:30310",
  "enode://6180de6f00d28833fbde6b6787ae18a5c8505b0d03c5e3b563e9ca7fb3d92117ea08d88fe5f1b013eb8ac5d81cf539d77817cb662791ead1e79f653fffe5184c@127.0.0.1:30311",
  "enode://1675d24f25cad9df731c3b0308ff720d251672b20deb5b294bbc77df82a825f0a45a2d3881918bb98f03eb834f37213c0b77e576d6165a168fc2a8f28a85e7fd@127.0.0.1:30312"
]
```

#### Copy static-nodes.json for validators

```
cp static-nodes.json validators/validator1/static-nodes.json && cp static-nodes.json validators/validator2/static-nodes.json && cp static-nodes.json validators/validator3/static-nodes.json
```

## 12 - Run Validators

- Open **Terminal** in Folder of your **Project**

```
cd scripts && bash validator1.sh
```
- Open new **Terminal**

```
cd scripts && bash validator2.sh
```
- Open new **Terminal**

```
cd scripts && bash validator3.sh
```
