pragma solidity >=0.4.25 <0.6.0;

contract BlockCharging
{
    enum StateType { 
      ChargerAvailable,
      OrderPlaced,
      Charging,
      ChargingComplete
    }

    address public InstanceOwner;
    string public Description;
    int public AskingPrice;
    StateType public State;

    address public InstanceBuyer;


    constructor(string memory description, int price) public
    {
        InstanceOwner = msg.sender;
        AskingPrice = price;
        Description = description;
        State = StateType.ChargerAvailable;
    }

    function PlaceOrder() public
    {
        if (State != StateType.ChargerAvailable)
        {
            revert();
        }
        
        if (InstanceOwner == msg.sender)
        {
            revert();
        }

        InstanceBuyer = msg.sender;
        State = StateType.OrderPlaced;
    }

    function Reject() public
    {
        if ( State != StateType.OrderPlaced )
        {
            revert();
        }

        if (InstanceOwner != msg.sender)
        {
            revert();
        }

        InstanceBuyer = 0x0000000000000000000000000000000000000000;
        State = StateType.ChargerAvailable;
    }

    function AcceptOrder() public
    {
        if ( msg.sender != InstanceOwner )
        {
            revert();
        }

        State = StateType.Charging;
    }
    function FinishCharging() public
    {
        if (State != StateType.Charging)
        {
            revert();
        }

        if (InstanceOwner == msg.sender)
        {
            revert();
        }
        
        InstanceBuyer = msg.sender;
        State = StateType.ChargingComplete;
    }
}