from brownie import *


def main():
    acct = accounts.add('93f69be64e957400a1c47da1448756d0925b5824103c2b49d3c8180a40884cb5')
    token = Token.deploy("GameInn", "GINN", 1e27, {'from': acct})
    private_round = PrivateRound.deploy(token.address, '0xaf9Cc07EC5b4Ed31EED3E2Ba1157AC99e06aA432', 1375000, acct, acct, 500e18, 500e20, {'from': acct})
    token.mint(private_round.address, 17272727e18, {'from': acct})


