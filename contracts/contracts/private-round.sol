pragma solidity ^0.8.2;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "./tokensale.sol";

contract  PrivateRound is AccessControl{
    using SafeERC20 for ERC20;

    uint256 public month = 2628000;//600 10 mins against 30 days

    address public GIToken;
    address public USDTToken;

    uint256 public totalSold;

    uint256 public swapRate;
    uint256 public ratesPrecision = 10**7;
    uint256 public factor = 10**12;

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant CLAIMER_ROLE = keccak256("CLAIMER_ROLE");
    bytes32 public constant SERVICE_ROLE = keccak256("SERVICE_ROLE");

    uint256 public min_amount_to_buy;
    uint256 public max_amount_to_buy;

    struct Stake{
        uint256 stake_date;
        uint256 stake_amount;
        bool isClaimed;
        bool auto_confirm;
        uint256 guid;
        address owner;
        uint8 period;
    }

    uint256 public guid = 0;

    mapping(address => uint256[]) public owners;

    mapping(uint256 => Stake) public stake_storage;

    event StakeEvent(uint256 amount);

    event ClaimStakeEvent(uint256 stake_date, uint256 claimed_amount);

    event TokenExchanged(
        address indexed spender,
        uint256 usdAmount,
        uint256 GHAmount
    );

    constructor (
        address _ghTokenAddress,
        address _USDTToken,
        uint256 _swapRate,
        address _claimer_address,
        address _admin_role,
        uint256 _min_amount_to_buy,
        uint256 _max_amount_to_buy)
    public {
        _setupRole(ADMIN_ROLE, _admin_role);
        _setupRole(SERVICE_ROLE, msg.sender);
        _setupRole(CLAIMER_ROLE, _claimer_address);

        GIToken = _ghTokenAddress;
        USDTToken = _USDTToken;
        swapRate    = _swapRate;
        min_amount_to_buy = _min_amount_to_buy;
        max_amount_to_buy = _max_amount_to_buy;
    }

    function swap(uint256 _value, uint8 stake_period, bool autoConfirm) external{
        require(_value >= min_amount_to_buy && _value <= max_amount_to_buy, "Incorrect value amount.");
        ERC20(USDTToken).safeTransferFrom(msg.sender, address(this), _value);
        uint256 amountInBaseAsset = _value * ratesPrecision / swapRate;
        Stake memory stake = Stake({stake_date : block.timestamp, stake_amount : amountInBaseAsset,
            isClaimed: false, guid: guid, owner: msg.sender, period: stake_period, auto_confirm: autoConfirm});
        stake_storage[guid] = stake;
        owners[msg.sender].push(guid);
        guid++;
        emit TokenExchanged(msg.sender, _value, amountInBaseAsset);
    }


    function getPercentAmount(uint8 stake_per, uint256 stake_amount, uint256 bonusPeriods) private returns(uint256 result){
        uint256 result = stake_amount;
        for(uint256 i = 0; i<bonusPeriods; i++){
            if (stake_per == 3){
                result += stake_amount * 20 / 100;
            } else if (stake_per == 6){
                result += stake_amount * 50 / 100;
            } else if (stake_per == 12){
                result += stake_per * 70 / 100;
            } else if (stake_per == 36){
                result += stake_per * 3;
            }
            stake_amount = result;
        }

        return result;
    }


    function stake(uint256 _value, uint8 stake_period, bool _auto_confirm) external {
        require(ERC20(GIToken).balanceOf(msg.sender) >= _value,"Your balance does not allow you to stake");
        ERC20(GIToken).safeTransferFrom(msg.sender, address(this), _value);
        Stake  memory stake = Stake({stake_date : block.timestamp,stake_amount : _value,
            isClaimed: false, guid: guid, owner: msg.sender, period: stake_period, auto_confirm: _auto_confirm});
        owners[msg.sender].push(guid);
        stake_storage[guid] = stake;
        guid++;
        emit StakeEvent(_value);
    }


    function getStake(uint256 _guid) external view returns(Stake memory stake){
        return stake_storage[_guid];
    }

    function changeOwner(uint256 _guid, address newOwner) external{
        Stake storage stake = stake_storage[_guid];
        require(stake.owner == msg.sender, "Only owner can change ownership");
        removeStakeFromOldOwner(_guid, msg.sender);
        stake.owner = newOwner;
    }

    function removeStakeFromOldOwner(uint256 _guid, address oldOwner) internal {
        uint256[] storage stakes = owners[oldOwner];
        uint256 indexRemove;
        bool findRemovalElement = false;
        for(uint256 i = 0; i<stakes.length; i++){
            if(stakes[i] == _guid){
                indexRemove = i;
                findRemovalElement = true;
            }
        }
        if(findRemovalElement){
            stakes[indexRemove] = stakes[stakes.length-1];
            stakes.pop();
        }
    }

    function updateTimePeriod(uint256 new_time) external{
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        month = new_time;
    }

    function claimStake(uint256 _guid) external{
        Stake storage stake = stake_storage[_guid];
        require(stake.owner == msg.sender, '');
        require(!stake.isClaimed, 'Stake is already claimed');
        require(!stake.auto_confirm, 'Stake is auto-confirm');
        uint256 bonusPeriods = calcBonusPeriods(stake.stake_date, stake.period);
        require(bonusPeriods > 0, 'Stake time is not over');
        uint256 result = getPercentAmount(stake.period, stake.stake_amount, bonusPeriods);
        ERC20(GIToken).safeTransfer(msg.sender, result);
        stake.isClaimed = true;
        emit ClaimStakeEvent(stake.stake_date, result);
    }

    function calcBonusPeriods(uint256 startTime, uint8 stake_period) internal returns(uint256 bonusPeriods){
        return (block.timestamp - startTime) / (month * stake_period);
    }

    function unsetAutoConfirm(uint256 _guid) external {
        Stake storage stake = stake_storage[_guid];
        require(hasRole(SERVICE_ROLE, msg.sender) || stake.owner == msg.sender, 'Only owner or Service admin allowed to change owner');
        stake.auto_confirm = false;
    }

    function getStakesByOwner(address owner_address) external view returns(Stake[] memory){
        uint256[] memory ids = owners[owner_address];
        Stake[] memory result = new Stake[](ids.length);
        for (uint256 i; i < ids.length; i++){
            result[i] = stake_storage[ids[i]];
        }
        return result;
    }

}
