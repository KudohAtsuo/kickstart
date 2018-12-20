pragma solidity ^0.4.17;

contract CampaignFactory {
    address[] public deployedCampaign;
    
    function createCapmpaign(uint minimum) public {
        address newCampaign = new Campaign(minimum, msg.sender);
        deployedCampaign.push(newCampaign);
    }
    
    function getDeployedCampaign() public view returns(address[]) {
        return deployedCampaign;
    }
}

contract Campaign {
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool) approvals;
    }
    
    address public manager;
    uint public mininmumContribution;
    mapping(address => bool) public approvers;
    uint public approversCount;
    Request[] public requests;
    
    function Campaign(uint minimum, address creator) public {
        manager = creator;
        mininmumContribution = minimum;
    }
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    function contribute() public payable{
        require(msg.value > mininmumContribution);
        
        approvers[msg.sender] = true;
        approversCount++;
    }
    
    function createRequest(string description, uint value, address recipient) public restricted {
        Request memory newRequest = Request({
            description: description,
            value: value,
            recipient: recipient,
            complete: false,
            approvalCount: 0
        });
        
        requests.push(newRequest);
    }
    
    function approveRequest(uint index) public {
        Request storage request = requests[index];
        
        require(approvers[msg.sender]);
        require(!request.approvals[msg.sender]);
        
        request.approvals[msg.sender] = true;
        request.approvalCount++;
    }
    
    function finalizeRequest(uint index) public restricted {
        Request storage request = requests[index];
        
        require(!request.complete);
        require(request.approvalCount > approversCount / 2);
        
        
        request.complete = true;
        
        request.recipient.transfer(request.value);
    }

    function getSummary() public view returns(uint, uint, uint, uint, address){
        return (
            mininmumContribution,
            address(this).balance,
            requests.length,
            approversCount,
            manager
        );
    }

    function getRequestsCount() public view returns(uint) {
        return requests.length;
    }
}








