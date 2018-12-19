pragma solidity ^0.5.0;

contract Booking {
    uint ticketId;         //チケットの発行番号
    struct Ticket {
        address issuer;       //チケットの発行者
        string  ticketName;   //チケット名
        uint    price;        //チケットの価格
        uint    issuedAmount; //チケットの発行枚数の総量
        uint    salesCount;   //発行済みチケットの枚数
    }
    Ticket[] tickets;
    mapping (address => uint256[]) ticketIds; //チケットの連想配列
    //mapping(uint => Ticket) tickets;
    
    constructor() public {
        // コンストラクタ
    }

    // チケットを発行する
    function issueTicket(address _issuerId, string memory _ticketName, uint _price,uint _issuedAmount) public returns (uint256) {
        Ticket memory ticket = Ticket({
           issuer: _issuerId,
           ticketName: _ticketName,
           price: _price,
           issuedAmount: _issuedAmount,
           salesCount: 0
        });
        uint256 newId = tickets.push(ticket) - 1;            
        ticketIds[_issuerId].push(newId);
        return ticketId;
    }
    
    // 現在のチケット発行番号を取得（参照）する
    function getCurrentTicketId() view public returns (uint) {
        return tickets.length;
    }
    
    // チケットの情報を取得（参照）する
    function getTicketInfo(uint _ticketId) public view returns(address, string memory ticketName, uint, uint, uint) {
        
        return (
            tickets[_ticketId].issuer,
            tickets[_ticketId].ticketName,
            tickets[_ticketId].price,
            tickets[_ticketId].issuedAmount,
            tickets[_ticketId].salesCount
        );
    }
}