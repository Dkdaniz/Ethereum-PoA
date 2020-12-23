#!/bin/sh

cd ../validators/validator2 && ../../utils/geth --nousb --datadir=$pwd --syncmode 'full' --port 30311 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr 'localhost' --http.port 8546 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock "0x18f300418Fb6b1Dfa4e808C3A46381ABC8B7878d" --password password.txt