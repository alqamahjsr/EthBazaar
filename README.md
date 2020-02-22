# EthBazaar - Ecommerce Marketplace 

## Tools required to access locally
**  Windows Powershell was used to compile and run the project**

1, Metamask extension: https://metamask.io

2, npm - JavaScript package manager: https://www.npmjs.com/package/npm

3, Truffle (A Blockchain Development Framework): https://truffleframework.com

4, Truffle Ganache (A Private Testnet for Blockchain Development): https://truffleframework.com/ganache

5, IPFS (a global, versioned, peer-to-peer filesystem): https://github.com/ipfs/go-ipfs#install

## Background

Web3Bazaar is online decentralized market place for people to set up stores and sell their goods without the hassle of complex ecommerce hosting or set up. All their payments are securely made in Ethereum blockchain with new web3 providing secure interface between the front end and blockchain back-end.

Blockchain ecommerce would be help in reducing transaction costs provided to third party, reduce ecommerce fraud and hacks, protect identities of the buyers and reduce chargebacks which had been costing millions to ecommerce sellers. With smart contracts it would also help in provenance tracking, cost reduction and inventory management.  Web3Bazaar just shows how robust ecommerce platform can be set up without the need of expensive servers and third party payment processors.

Here we discuss user stories, implementation, requirements to run the code and what can be improved.

## Description:
Web3Bazaar is user friendly online ecommerce shop where the interface and control are divided between administrators, Shop owners and Shoppers.

Administrators manage the stores which prospective shop owners bid to open. If the central Web3Bazaar administrators approve the shop is opened and shope owners can start creating stores and uploading pictures with price and quantity. Shoppers can visit the stores and purchase using ether. All transactions are transparent and secure.

## User Stories:
The administrator of Web3Bazaar opens the store interface where prospective shop owners can applu. The app reads and stores the address of the admin and recognized everytime the address is used where the administrator will only see admin only functions. 

An administrator opens the web app. The web app reads the address and identifies that the user is an admin, showing them admin only functions, such as managing store owners. An admin can grant shop owner rights for shoppers that has requested shop owner rights. Once shop owner logs into the app, they have access to the store owner functions. Note that each of the function of adding and deleting store owners would cost ether gas.

The store owner can add or remove the products, remove or change the price and change the pictures and finally withdraw the funds fom the store it has collected. Every activity of adding products, withdrawing and removing products would cost gas.

When a shopper which is usually unidentified generic shopper application is logged, the shopper sees the storefront and browse all the goods created in the marketplace. If one clicks on the storefront it will take on product page where all the products is listed and offered by the store. The shopper can view the products and see the quanitity and price . Everytime they purchase their account is debited and sent to the store owner who can withdraw the funds. The shopper can use metamask to connect to the ecommerce blockchain and transact easily.


## How to run the project
1, First you clone the project

2, Make sure truffle and npm package are installed.

3, Run ganache gui or command line `ganache-cli`

4, Go to the main folder in final-project-shanzz

5, Compile by running `truffle compile`

6, Run tests by running `truffle test`

7, Migrate contract to development environment by running `truffle migrate --reset`

8, Install dependencies by going to client folder: `cd client && npm install`

9, Install IPFS and initialize it by   cmd: `ipfs init` 

10, Enable CORS by reading instructions here https://github.com/fbaiodias/ipfs-chrome-station/issues/16

11, start IPFS daemon, cmd: `ipfs daemon`

12, Start lite or local server that pops up in default browser at http://localhost:3000 by executing: `npm run start` 

13, Install Metamask in your browser

14, Interface opens in default

15, Copy and paste mnemonic to metamask (printed in ganache-cli's console) to access admin rights. Account 1 is Contract creator and will be always administrator.

16, Go to Metamask and select account 2 you will see Status as Shopper go and request for store then head to Account 1 the status changes to Admin , provide permission to open store got back to account 2 and create stores and upload pictures. Using random account or account 3 you can shop as a Shopper. You can also as a shop owner ask for refund.

17, Project is also deployed on Rinkeby network


##Project Requirements

**User Interface Requirements:**
 
[x] 1, Project includes a README.md that explains the project.
- The README should include a description of what the app does and how to set it up for evaluation.

[x]2,The project is a Truffle project that allows you to easily compile, migrate and test the provided Solidity contracts .

[x]3, Project is commented as outline in the documentation.

[x]4, At least one contract uses a library or inherits from another contract.
 -This can be done via EthPM or OpenZeppelin or with extending your own contract (LibraryDemo.sol was used).
Run the app on a dev server locally for testing/grading

[x] 5, I can run the app on a development server locally for testing/grading (or connecting to Rinkeby/Ropsten if required) 

[x] 6, The app displays the current ethereum account

[x] 7, I can sign transactions using Metamask (or another web3 provider) 

[x]8, The app interface reflects updates to to the contract state 

**Testing Requirements**

[x]9, 5 tests written in Javascript or Solidity (or both) *
- If the contract is so simple as to not require 5 tests for full coverage, it is okay to issue 5 points for less than 5 tests.

[x]10, Tests are properly structured *
 - Each test sets up context, executes a call on the function to be tested, and verifies that the result is correct.

[x]11, All tests pass *

**Design Pattern Requirements**

[x]12, At least one of the contracts implements a circuit breaker / emergency stop pattern. *
 Circuit breaker pattern outlined here 

[x]13, Project includes a file called design_pattern_decisions.md that adequately describes the design patterns implemented in the project *


**Testnet Deployment**

[x] 14, Project includes a file called avoiding_common_attacks.md that explains at least 2 common attacks and how the app mitigates user risk. *


**Stretch Goals**
These stretch goals are not requirements. Implementing them will grant bonus points

[x]15, Project uses IPFS
The app is hosted on IPFS or allows users to interact with IPFS.

[x]16, The project uses an upgradable design pattern for the smart contracts


[ ] 17, At least one contract is written in Vyper or LLL

[ ] 18, The app uses uPort for user authentication and/or signing and sending transactions
2 points for authentication, 3 points for authentication + sending transactions with uPort

[ ] 19, The app uses the Ethereum Name Service to resolve human readable names to Ethereum addresses

[ ] 20, The project uses an Oracle service such as Oraclize
