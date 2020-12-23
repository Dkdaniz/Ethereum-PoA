#!/bin/sh

cd ../validators/validator1 && ../../utils/geth --nousb --datadir=$pwd --syncmode 'full' --port 30310 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr 'localhost' --http.port 8545 --http.api admin,eth,miner,net,txpool,personal,web3 --mine --allow-insecure-unlock --unlock "0xc6b8399673020831Ab38a3197AAe52B4246A176C" --password password.txt