//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// import "hardhat/console.sol";

contract CrowdFund {
    struct Request {
        string description;
        uint256 amount;
        address beneficiary;
        bool approved;
        uint256 approvalCount;
        mapping(address => bool) approvals;
    }
    uint256 numRequests;
    address public owner;
    uint256 public minContibution;
    mapping(address => bool) public approvers;
    mapping(uint256 => Request) requests;

    constructor(uint256 minimumContribution) {
        owner = msg.sender;
        minContibution = minimumContribution;
    }

    function contribute() public payable {
        require(msg.value >= minContibution);
        approvers[msg.sender] = true;
    }

    modifier restricted() {
        require(msg.sender == owner);
        _;
    }

    function createRequest(
        string memory description,
        uint256 amount,
        address beneficiary
    ) public restricted {
        Request storage request = requests[numRequests++];
        request.description = description;
        request.amount = amount;
        request.beneficiary = beneficiary;
        request.approved = false;
        request.approvalCount = 0;
    }
}
