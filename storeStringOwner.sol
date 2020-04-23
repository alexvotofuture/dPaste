pragma solidity >=0.4.22 <0.7.0;

contract Owner {

    string phrase = "test";
    
    address private owner;
    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }
    
    constructor() public {
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
        emit OwnerSet(address(0), owner);
    }
    
    function changeOwner(address newOwner) public isOwner {
        emit OwnerSet(owner, newOwner);
        owner = newOwner;
    }

    function getOwner() external view returns (address) {
        return owner;
    }
    
    function store(string memory phraseIn) public isOwner{
        phrase = phraseIn;
    }
    
    function retreive() public view returns (string memory){
        return phrase;
    }
}
