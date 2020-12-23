#!/bin/sh

rm -rf ../validators/validator1/geth
rm -rf ../validators/validator2/geth
rm -rf ../validators/validator3/geth

../utils/geth --datadir ../validators/validator1 init ../genesis.json 
../utils/geth --datadir ../validators/validator2 init ../genesis.json 
../utils/geth --datadir ../validators/validator3 init ../genesis.json 