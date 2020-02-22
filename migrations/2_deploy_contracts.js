var Web3Bazaar = artifacts.require("./Web3Bazaar.sol");
var LibraryDemo = artifacts.require("./LibraryDemo.sol");

module.exports = function(deployer) {
  // deploy library and link it to Web3Bazaar which
  // is the main contract.
  deployer.deploy(LibraryDemo);
  deployer.link(LibraryDemo, Web3Bazaar);
  // Web3Bazaar inherits from Web3Security
  // so deploying Web3Bazaar is enough
  deployer.deploy(Web3Bazaar);
};
