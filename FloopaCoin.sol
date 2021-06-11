pragma solidity >=0.5.0 <0.7.0;

contract FloopaCoin {
    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

    string public _name;
    uint8 public _decimals;
    string public _symbol;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor() public{
        _name = "FloopaCoin";
        _decimals = 8;
        _symbol = "FLUP";
        _balances[msg.sender] = 69696969;
        _totalSupply = 69696969;
    }

    function name() public view returns (string memory tokenName){
        return _name;
    }
    
    function symbol() public view returns (string memory tokenSymbol){
        return _symbol;
    }
    function decimals() public view returns (uint8 tokenDecimals){
        return _decimals;
    }

    function totalSupply() public view returns (uint256 tokenTotalSupply){
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256 balance){
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(_balances[msg.sender] >= _value);
        _balances[msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_balances[_from] >= _value);
        _balances[_from] -= _value;
        _balances[_to] += _value;
        _allowed[_from][msg.sender] -= _value;
        emit Transfer(msg.sender, _to, _value);
        return true;

    }
    function approve(address _spender, uint256 _value) public returns (bool success){
        _allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return _allowed[_owner][_spender];
    }
}
