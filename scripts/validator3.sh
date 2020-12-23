#!/bin/sh

cd ../validators/validator3 && ../../utils/geth --nousb --datadir=$pwd --syncmode 'full' --port 30312 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr 'localhost' --http.port 8547 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock "0xc701373BfEB21913ddfD8a8De0b08476be84A067" --password password.txt