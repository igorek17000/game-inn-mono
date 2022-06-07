from brownie import *
import pytest
import brownie
from brownie.network.state import Chain


@pytest.fixture
def usdt_token():
    usdt_token = accounts[0].deploy(Token, "Usdt", "Usdt", 1e36)
    for i in range(len(accounts)):
        usdt_token.mint(accounts[i], 1e27, {'from': accounts[0]})
    return usdt_token


@pytest.fixture
def gh_token():
    return accounts[0].deploy(Token, "GameInn", "GINN", 1e27)


@pytest.fixture
def private_round(gh_token, usdt_token):
    private_round = accounts[0].deploy(PrivateRound, gh_token.address, usdt_token.address, 1375000, accounts[0], accounts[0], 5e20, 5e22)
    gh_token.mint(private_round.address, 17272727e18, {'from': accounts[0]})
    for i in range(len(accounts)):
        usdt_token.approve(private_round.address, 1e24, {'from': accounts[i]})
    return private_round


def test_balance(gh_token, private_round):
    assert gh_token.balanceOf(private_round.address) == 17272727e18


def test_basic_flow(gh_token, private_round, usdt_token):
    private_round.swap(1375e18, 1, False, {'from': accounts[0]})
    assert usdt_token.balanceOf(private_round.address) == 1375e18
    with brownie.reverts('Stake time is not over'):
        private_round.claimStake(0, {'from': accounts[0]})
    assert gh_token.balanceOf(accounts[0]) == 0
    chain = Chain()
    chain.sleep(2628000+100)
    private_round.claimStake(0, {'from': accounts[0]})
    assert gh_token.balanceOf(accounts[0]) == 10000e18
    with brownie.reverts('Stake is already claimed'):
        private_round.claimStake(0, {'from': accounts[0]})
    stake = parse_stake(private_round.getStake(0))
    assert stake['owner'] == accounts[0]
    private_round.changeOwner(0, accounts[1], {'from': accounts[0]})
    stake = parse_stake(private_round.getStake(0))
    assert stake['owner'] == accounts[1]
    private_round.swap(1375e18, 3, False, {'from': accounts[2]})
    stake_1 = parse_stake(private_round.getStake(1))
    assert stake_1['stake_amount'] == 10000e18
    assert stake_1['owner'] == accounts[2]
    assert stake_1['period'] == 3
    with brownie.reverts('Stake time is not over'):
        private_round.claimStake(1, {'from': accounts[2]})
    chain.sleep(2628000*3+100)
    private_round.claimStake(1, {'from': accounts[2]})
    assert gh_token.balanceOf(accounts[2]) == 12000e18


def test_autocompile(gh_token, private_round, usdt_token):
    private_round.swap(1375e18, 3, True, {'from': accounts[0]})
    assert gh_token.balanceOf(accounts[0]) == 0
    assert usdt_token.balanceOf(private_round.address) == 1375e18
    with brownie.reverts('Stake is auto-confirm'):
        private_round.claimStake(0, {'from': accounts[0]})
    chain = Chain()
    chain.sleep(2628000 * 6 + 100)
    private_round.unsetAutoConfirm(0, {'from': accounts[0]})
    private_round.claimStake(0, {'from': accounts[0]})
    assert gh_token.balanceOf(accounts[0]) == 14400e18
    stake = parse_stake(private_round.getStake(0))
    assert parse_stake(private_round.getStakesByOwner(accounts[0])[0]) == stake


def parse_stake(stake):
    return dict(zip(("stake_date", "stake_amount", "isClaimed", "auto_confirm", "guid", "owner", "period"), stake))
