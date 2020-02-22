pragma solidity > 0.5.0;
import "./LibraryDemo.sol";

contract Web3Security {
    address internal owner;
    bool internal reentryProtector = false;
    bool internal isContractActive = true;
    uint internal withdrawalSuspendedUntilTime = 0;
    uint internal constant MAX_STRING_LENGTH = 25;
    uint internal constant IPFS_HASH_STRING_LENGTH = 46;

    modifier externalFunctionCallIsNotOngoing() {
        require(!reentryProtector, "External call is ongoing. Function call denied.");
        _;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not contract owner");
        _;
    }

    modifier isContractActivated {
        require(isContractActive, "Contract is deactive. Function call denied.");
        _;
    }

    modifier isContractDeactivated {
        require(!isContractActive, "Contract is actived. Function call denied.");
        _;
    }

    modifier isWithdrawalAllowed() {
        require(block.timestamp >= withdrawalSuspendedUntilTime, "Withdrawals are suspended temporarily");
        _;
    }

    modifier isValidString(string memory str) {
        require(stringValidation(str),
            "Invalid string. Valid charactes a-z, A-Z, 0-9, dot and space. Max length is 25");
        _;
    }

    modifier isValidIpfsHashString(string memory str) {
        require(ipfsHashValidation(str),
            "Invalid string. Valid charactes a-z, A-Z, 0-9, dot and space. Max length is 46. Starting with 'Qm'");
        _;
    }

    function disown()
    public
    isOwner()
    {
        delete owner;
    }

    function suspendWithdrawals(uint time)
    public
    isOwner()
    {
        withdrawalSuspendedUntilTime = now + time;
    }

    function kill()
    public
    isOwner()
    {
        selfdestruct(address(uint160(owner)));
    }

    function toggleContractActive()
    public
    isOwner()
    {
        isContractActive = !isContractActive;
    }

    function externalEnter()
    internal
    externalFunctionCallIsNotOngoing()
    {
        reentryProtector = true;
    }

    function externalLeave()
    internal
    {
        reentryProtector = false;
    }

    function stringValidation(string memory str)
    private
    pure
    returns (bool isValid)
    {
        bytes memory b = bytes(str);
        if(b.length > MAX_STRING_LENGTH) {
            return false;
        }

        for(uint i; i < b.length; i++) {
            bytes1 char = b[i];
            if (!(char >= 0x30 && char <= 0x39) && // 9-0
                !(char >= 0x41 && char <= 0x5A) && // A-Z
                !(char >= 0x61 && char <= 0x7A) && // a-z
                !(char == 0x2E) && // .
                !(char == 0x20) // space
            ) {
                return false;
            }
        }
        return true;
    }

    function ipfsHashValidation(string memory ipfsHash)
    private
    pure
    returns (bool isValid)
    {
        bytes memory b = bytes(ipfsHash);
        if (b.length != IPFS_HASH_STRING_LENGTH) {
            return false;
        }

        // starting with "Qm"
        if (b[0] != 0x51 || b[1] != 0x6D) {
            return false;
        }

        for (uint i; i < b.length; i++) {
            bytes1 char = b[i];
            if (!(char >= 0x30 && char <= 0x39) && // 9-0
                !(char >= 0x41 && char <= 0x5A) && // A-Z
                !(char >= 0x61 && char <= 0x7A) // a-z
            ) {
                return false;
            }
        }
        return true;
    }
}