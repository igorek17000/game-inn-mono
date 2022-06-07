// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract Tokensale is AccessControl {
    using SafeERC20 for ERC20;

    // For market GINN/USD => GINN base asset, USD - quote asset
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
        uint256 _max_amount_to_buy
    ) public {
        _setupRole(ADMIN_ROLE, _admin_role);
        _setupRole(SERVICE_ROLE, msg.sender);
        _setupRole(CLAIMER_ROLE, _claimer_address);

        GIToken = _ghTokenAddress;
        USDTToken = _USDTToken;
        swapRate    = _swapRate;
        min_amount_to_buy = _min_amount_to_buy;
        max_amount_to_buy = _max_amount_to_buy;
    }

    function swap(
        uint256 _value
    ) external {
        require(_value >= min_amount_to_buy && _value <= max_amount_to_buy, "Incorrect value amount.");
        ERC20(USDTToken).safeTransferFrom(msg.sender, address(this), _value);
        uint256 amountInBaseAsset = _value * ratesPrecision / swapRate;
        ERC20(GIToken).safeTransfer(msg.sender, amountInBaseAsset);

        emit TokenExchanged(msg.sender, _value, amountInBaseAsset);

    }


    /**
     * @dev update exchange rate in direct round
     */
    function updateRate(uint256 _rate) external {
        require(hasRole(SERVICE_ROLE, msg.sender), "Caller is not an admin");
        swapRate = _rate;
    }

    /*
     * @dev update min_amount_to_buy
     */
    function updateMinAmountToBuy(uint256 _min_amount_to_buy) external{
        require(hasRole(SERVICE_ROLE, msg.sender), "Caller is not an admin");
        min_amount_to_buy = _min_amount_to_buy;
    }

    /*
     * @dev update min_amount_to_buy
     */
    function updateMaxAmountToBuy(uint256 _max_amount_to_buy) external{
        require(hasRole(SERVICE_ROLE, msg.sender), "Caller is not an admin");
        max_amount_to_buy = _max_amount_to_buy;
    }

    /*
     * @dev update USDTAddress
     */
    function updateUsdtAddress(address _usdtAddress) external{
        require(hasRole(SERVICE_ROLE, msg.sender), "Caller is not an admin");
        USDTToken = _usdtAddress;
    }

    /**
     * @dev add users with info
     * @param _users users addresses array
     * @param _amounts amounts array
     */
    function migrateUsers(
        address[] memory _users,
        uint256[] memory _amounts
    ) external {
        require(hasRole(SERVICE_ROLE, msg.sender), "Caller is not an admin");
        require(
            _users.length == _amounts.length,
            "Array users and amounts must be the same length"
        );

        for (uint256 i = 0; i < _users.length; i++) {
            ERC20(GIToken).safeTransfer(_users[i], _amounts[i]);
        }
    }

    /**
     * @dev returns current rate for contract
     */
    function getRate() external view returns (uint256) {
        return swapRate;
    }

    /**
     * @dev returns current usdt address for contract
     */
    function getUsdtAddress() external view returns (address) {
        return USDTToken;
    }

    /** @dev claim usdt from this contract
     *  @param _token address of token contract
     *  @param _receiver address, who gets tokens
     *  @param _amount amount of token transfer
     */
    function claimTokens(address _token, address _receiver, uint256 _amount) external {
        require(hasRole(CLAIMER_ROLE, msg.sender), "Caller is not a claimer");
        ERC20(_token).safeTransfer(
            _receiver,
            _amount);
    }


}
