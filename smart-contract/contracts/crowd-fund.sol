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
    uint256 public numRequests = 0;
    address public owner;
    uint256 public minContibution;
    mapping(address => bool) public approvers;
    uint256 public approversCount = 0;
    Request[] public requests;

    constructor(uint256 minimumContribution) {
        owner = msg.sender;
        minContibution = minimumContribution;
    }

    function contribute() public payable {
        require(msg.value >= minContibution);
        approvers[msg.sender] = true;
        approversCount++;
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
        Request storage request = requests.push();
        request.description = description;
        request.amount = amount;
        request.beneficiary = beneficiary;
        request.approved = false;
        request.approvalCount = 0;
        numRequests++;
    }

    function approveRequest(uint256 requestId) public restricted {
        Request storage request = requests[requestId];
        require(!request.approved);
        require(!request.approvals[msg.sender]);
        request.approvals[msg.sender] = true;
        request.approvalCount++;
        if (request.approvalCount >= approversCount / 2) {
            request.approved = true;
            payable(request.beneficiary).transfer(request.amount);
        }
    }
}
