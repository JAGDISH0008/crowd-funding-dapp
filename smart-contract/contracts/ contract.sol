//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Main {
    struct Project {
        uint256 id;
        uint256 amount;
        uint256 deadline;
        string reward;
        uint256 balance;
        address owner;
        bool status;
    }

    Project[] public projects;

    constructor() {}

    function createProject(
        uint256 amount,
        uint256 deadline,
        string memory reward
    ) public {
        Project memory project = Project({
            id: projects.length,
            amount: amount,
            deadline: deadline,
            reward: reward,
            balance: 0,
            owner: msg.sender,
            status: true
        });
        projects.push(project);
    }

    function getById(uint256 id) public view returns (Project memory) {
        return projects[id];
    }

    function getAll() public view returns (Project[] memory) {
        return projects;
    }
}
