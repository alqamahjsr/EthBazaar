pragma solidity ^0.5.0;

library LibraryDemo {
    uint constant private ALLOCATION_FOR_STRING = 32;

    function getSize(string memory str)
    internal
    pure
    returns(uint size)
    {
        size = bytes(str).length / ALLOCATION_FOR_STRING;
        if(bytes(str).length % ALLOCATION_FOR_STRING != 0)
        {
            size++;
        }
        size++;
        size *= ALLOCATION_FOR_STRING;
        return size;
    }

    function stringToBytes(uint offset, bytes memory input, bytes memory buffer)
    internal
    pure
    {
        uint256 stackSize = input.length / ALLOCATION_FOR_STRING;
        if (input.length % ALLOCATION_FOR_STRING > 0) {
            stackSize++;
        }
        assembly
        {
            stackSize := add(stackSize, 1)
            for
            {
                let index := 0
            }
            lt(index, stackSize) {}
            {
                mstore(add(buffer, offset), mload(add(input, mul(index, 32))))
                offset := sub(offset, 32)
                index := add(index, 1)
            }
        }
    }
}