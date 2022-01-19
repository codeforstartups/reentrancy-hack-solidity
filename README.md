# ridox-contract
 
# create smart structure
brownie init

# test contract
brownie test

# compile smart contract
brownie compile

# deploy locally
brownie run scripts/deploy.py
brownie run scripts/1_deploy_token.py
brownie run scripts/helpful_scripts.py

# deploy on rinkeby network
brownie run scripts/1_deploy_token.py --network rinkeby
