from brownie import *


def main():
    acct = accounts.add('93f69be64e957400a1c47da1448756d0925b5824103c2b49d3c8180a40884cb5')
    wallet = Wallet.deploy('0xB0b2c3463A2136EEEF16EF14d88CB29348FDAAf7', {'from': acct}, publish_source=True)
