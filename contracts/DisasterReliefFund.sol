// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title Crowdsourced Disaster Relief Fund
/// @author Mrinal Singh
/// @notice Donation-based contract that distributes funds during disasters (triggered via DAO or oracle)

contract DisasterReliefFund {
    address public admin;
    address public verifier; // DAO address 
    bool public isDisasterVerified;

    mapping(address => uint256) public donations;
    uint256 public totalFunds;

    address[] public recipients;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    modifier onlyVerifier() {
        require(msg.sender == verifier, "Not verifier");
        _;
    }

    modifier onlyIfDisasterVerified() {
        require(isDisasterVerified, "Disaster not verified");
        _;
    }

    event Donated(address indexed donor, uint256 amount);
    event DisasterVerified(address indexed by);
    event FundDistributed(address indexed recipient, uint256 amount);

    constructor(address _verifier) {
        admin = msg.sender;
        verifier = _verifier;
    }

    function donate() external payable {
        require(msg.value > 0, "Must send some ETH");
        donations[msg.sender] += msg.value;
        totalFunds += msg.value;
        emit Donated(msg.sender, msg.value);
    }

    function verifyDisaster() external onlyVerifier {
        isDisasterVerified = true;
        emit DisasterVerified(msg.sender);
    }

    function setRecipients(address[] memory _recipients) external onlyAdmin {
        require(_recipients.length > 0, "No recipients set");
        recipients = _recipients;
    }

    function distributeFunds() external onlyAdmin onlyIfDisasterVerified {
        require(recipients.length > 0, "No recipients");
        uint256 share = totalFunds / recipients.length;
        for (uint256 i = 0; i < recipients.length; i++) {
            payable(recipients[i]).transfer(share);
            emit FundDistributed(recipients[i], share);
        }
        totalFunds = 0;
    }

    function resetDisasterStatus() external onlyAdmin {
        isDisasterVerified = false;
    }

    function getRecipients() external view returns (address[] memory) {
        return recipients;
    }
}
