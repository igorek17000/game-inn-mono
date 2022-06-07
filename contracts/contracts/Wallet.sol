// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Wallet is AccessControl, ReentrancyGuard {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant CLAIMER_ROLE = keccak256("CLAIMER_ROLE");
    uint256 public percentPrecision = 10**5;

    mapping(uint256 => Round) rounds;

    uint8 roundsAmount = 0;

    struct Round {
        uint256 totalAmount;
        uint256 totalClaimed;
        Lock[] locks;
        string name;
        uint256 currentLockNumber;
    }

    struct Lock {
        uint256 unlockDate;
        uint256 percent;
        uint256 claimed;
    }

    struct UserInfo {
        bool inWhitelist;
        uint256 amount;
        bool pubSale;
        bool priSale;
        bool seedSale;
    }

    mapping(address => UserInfo) public users;

    // address of main token
    address public govTokenAddress;

    event TokensClaimed(
        address indexed claimer,
        uint256 amountClaimed,
        uint256 availableAmount,
        uint256 timestamp
    );

    /**
     * @dev Constructor of Wallet.
     *
     */
    constructor(address _govTokenAddress) public {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(ADMIN_ROLE, msg.sender);
        _setupRole(CLAIMER_ROLE, msg.sender);
        _setRoleAdmin(CLAIMER_ROLE, ADMIN_ROLE);
        govTokenAddress = _govTokenAddress;
    }

    function addRound(
        string memory _name,
        uint256 _totalAmount,
        uint256 index
    ) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        require(index <= roundsAmount, "Index is not in order");
        Round storage round = rounds[index];

        round.name = _name;
        round.totalAmount = _totalAmount;
        round.totalClaimed = 0;
        round.currentLockNumber = 1;
        roundsAmount++;
    }

    function addRounds(
        string[] memory names,
        uint256[] memory totalAmounts
    ) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        require(names.length == totalAmounts.length, "Error: arrays size doesn't match");

        for (uint256 i = 0;i<names.length;i++){
            Round storage round = rounds[i];
            round.name = names[i];
            round.totalAmount = totalAmounts[i];
            round.totalClaimed = 0;
            round.currentLockNumber = 1;
            roundsAmount++;
        }
    }


    function claim(
        uint256 _amount,
        address _recepient,
        uint256 _roundId
    ) external nonReentrant {
        UserInfo storage user = users[msg.sender];
        Round storage round = rounds[_roundId];
        require(user.inWhitelist, "User must be in whitelist!");
        require(_roundId >= 0, "RoundId must be >= 0");

        updateCurrentLock(round);

        uint256 availableAmount = calcAvailableAmount(round);

//        require(_amount <= availableAmount, "Not enough tokens to claim");
        IERC20(govTokenAddress).safeTransfer(_recepient, _amount);
        round.totalClaimed = round.totalClaimed.add(_amount);
        emit TokensClaimed(_recepient, _amount, availableAmount, block.timestamp);
    }

    function updateCurrentLock(Round memory round) private {

        uint256 newLock = round.currentLockNumber;

        if (newLock <= round.locks.length) {
            while (block.timestamp >= round.locks[newLock - 1].unlockDate) {
                newLock = newLock + 1;
                if (newLock == round.locks.length + 1) {
                    break;
                }
            }
            round.currentLockNumber = newLock;
        }

    }

    function calcAvailableAmount(Round memory round)
        public
        view
        returns (uint256 availableToken)
    {

        uint256 availablePercent = 0;

        for (uint i = 0; i<round.currentLockNumber-1;i++){
            availablePercent += round.locks[i].percent;
        }

        uint256 availableToken = round
            .totalAmount
            .mul(availablePercent)
            .div(1000);

        if (availableToken >= round.totalClaimed) {
            availableToken = availableToken.sub(round.totalClaimed);
        } else {
            return 0;
        }

        return availableToken;
    }

    function addLock(
        uint256[] memory _unlockDate,
        uint256[] memory _percent,
        uint256 _roundId
    ) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        require(
            _unlockDate.length == _percent.length,
            "unlockDate and percent arrays must be the same length!"
        );

        for (uint256 i = 0; i < _unlockDate.length; i++) {
            rounds[_roundId].locks.push(
                Lock({
                    percent: _percent[i],
                    unlockDate: _unlockDate[i],
                    claimed: 0
                })
            );
        }
    }

    function removeToken(
        address _recepient,
        uint256 _amount,
        address tokenAddress
    ) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        IERC20(tokenAddress).safeTransfer(_recepient, _amount);
    }

    function updateLock(
        uint256 _indexLock,
        uint256 _indexRound,
        uint256 _percent,
        uint256 _unlockDate,
        uint256 _claimed
    ) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        rounds[_indexRound].locks[_indexLock].percent = _percent;
        rounds[_indexRound].locks[_indexLock].unlockDate = _unlockDate;
        rounds[_indexRound].locks[_indexLock].claimed = _claimed;
    }

    function updateUserInfo(
        address _user,
        uint256 _amount,
        bool _inWhitelist
    ) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        UserInfo storage user = users[_user];
        user.amount = _amount;
        user.inWhitelist = _inWhitelist;
    }

    function updateTokenAddress(address _govTokenAddress) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        govTokenAddress = _govTokenAddress;
    }

    function migrateUsers(address[] memory _users, uint256[] memory _amounts)
        external
    {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        require(
            _users.length == _amounts.length,
            "Array users and amounts must be the same length!"
        );

        for (uint256 i = 0; i < _users.length; i++) {
            UserInfo storage user = users[_users[i]];
            user.amount = _amounts[i];
            user.inWhitelist = true;
        }
    }

    function getRoundInfo(uint256 _roundId)
        external
        view
        returns (
            uint256 totalAmount,
            uint256 availableAmountInRound,
            uint256 nextClaimDate,
            uint256 claimed,
            string memory name
        )
    {
        Round storage round = rounds[_roundId];

        totalAmount = round.totalAmount;
        name = round.name;

        if (round.currentLockNumber == round.locks.length - 1) {
            nextClaimDate = round.locks[round.currentLockNumber].unlockDate;
        } else {
            nextClaimDate = round.locks[round.currentLockNumber + 1].unlockDate;
        }
        claimed = round.totalClaimed;
        availableAmountInRound = calcAvailableAmount(round);
        return (
            totalAmount,
            availableAmountInRound,
            nextClaimDate,
            claimed,
            name
        );
    }

    function getRounds()
    external
    view
    returns (Round[] memory){
        Round[] memory result = new Round[](roundsAmount);
        for (uint i = 0;i<roundsAmount;i++){
            result[i] = rounds[i];
        }
        return result;
    }

    function getUserInfo(address _user, uint256 _roundId)
        external
        view
        returns (
            uint256 amount_,
            uint256 available_,
            uint256 amountWithClaimed_,
            uint256 currentLockTime_
        )
    {
        Round storage round = rounds[_roundId];

        UserInfo storage user = users[_user];

        uint256 newLock = round.currentLockNumber;
        if (_roundId != 0) {
            if (newLock <= round.locks.length + 1) {
                while (block.timestamp >= round.locks[newLock - 1].unlockDate) {
                    newLock = newLock + 1;
                    if (newLock == round.locks.length + 1) {
                        break;
                    }
                }
            }
        } else {
            newLock = 0;
        }

        amount_ = user.amount;
        amountWithClaimed_ = round.totalAmount.sub(round.totalClaimed);
        available_ = calcAvailableAmount(round);

        if (newLock == round.locks.length - 1) {
            currentLockTime_ = round.locks[newLock].unlockDate;
        } else {
            currentLockTime_ = round.locks[newLock + 1].unlockDate;
        }

        return (amount_, available_, amountWithClaimed_, currentLockTime_);
    }

    function addToWhiteList(address _user) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        users[_user].inWhitelist = true;
    }

    function removeFromWhiteList(address _user) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        users[_user].inWhitelist = false;
    }

    function addBatchToWhiteList(address[] calldata _user) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        for (uint256 i = 0; i < _user.length; i++) {
            users[_user[i]].inWhitelist = true;
        }
    }

    function removeBatchFromWhiteList(address[] calldata _user) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");

        for (uint256 i = 0; i < _user.length; i++) {
            users[_user[i]].inWhitelist = false;
        }
    }

    function updateCurrentLockNumber(
        uint256 _currentLockNumber,
        uint256 _roundId
    ) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        rounds[_roundId].currentLockNumber = _currentLockNumber;
    }

    function updatePercentPrecision(uint256 _precision) external {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        percentPrecision = _precision;
    }
}
