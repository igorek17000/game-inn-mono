import Web3 from 'web3';
import Onboard from "bnc-onboard";
import Onboardv2 from '@web3-onboard/core'
import injectedModule from '@web3-onboard/injected-wallets'
import fortmaticModule from '@web3-onboard/fortmatic'

export let web3 = null;
export let initOnboard = null;

let account = {};

export const success = (res) => ({
  ok: true,
  result: res,
});
export const error = (code = 90000, msg = '', data = null) => ({
  ok: false,
  code,
  msg,
  data,
});
const getChainTypeById = (chainId) => {
  if (+chainId === 1 || +chainId === 4) {
    return 0;
  }
  if (+chainId === 56 || +chainId === 97) {
    return 1;
  }
  if (+chainId === 80001 || +chainId === 137) {
    return 2;
  }
  return -1;
};
export const initWeb3Contract = async (abi, address) => {
  try {
    return await new web3.eth.Contract(abi, address, {from: account.address});
  } catch (e) {
    return error(500, '', e.message);
  }
};
export const signTrx = async (amount, address) => {
  try {
    const data = Web3.utils.soliditySha3({ type: 'uint256', value: amount });
    return {
      sign: await web3.eth.personal.sign(data, address),
      msgHash: data,
    };
  } catch (e) {
    console.log(e);
    return error(500, 'signTrx err', e);
  }
};
export const initWeb3 = async () => {
  try {
    if (typeof window.ethereum !== 'undefined') {
      try {
        await window.ethereum.send('eth_requestAccounts');
        web3 = new Web3(window.ethereum)
        await switchChain();

        account = {
          address: await web3.eth.getCoinbase(),
        };

        return success(account);
      } catch (error) {
        console.log('User denied web3 access', error);
        return error(404, 'Connection select fail')
      }
    }
    else {
      console.error('No web3 provider detected');
    }
  } catch (err) {
    web3 = undefined;
    console.log('initWeb3', err)
  }
};

export const switchChain = async () => {
  const CHAIN_NAME = process.env.CHAIN_NAME;
  const CHAIN_CURRENCY = process.env.CHAIN_CURRENCY;
  const CHAIN_DECIMALS = process.env.CHAIN_DECIMALS;
  const CHAIN_RPC = process.env.CHAIN_RPC;
  const NETWORK_ID = process.env.CHAIN_NETWORK_ID;

  if (window.ethereum.networkVersion !== NETWORK_ID) {
    try {
      await window.ethereum.request({
        method: 'wallet_switchEthereumChain',
        params: [{ chainId: web3.utils.toHex(NETWORK_ID) }]
      });
    } catch (err) {
      // This error code indicates that the chain has not been added to MetaMask
      if (err.code === 4902) {
        await window.ethereum.request({
          method: 'wallet_addEthereumChain',
          params: [
            {
              chainName: CHAIN_NAME,
              chainId: web3.utils.toHex(NETWORK_ID),
              nativeCurrency: { name: CHAIN_CURRENCY, decimals: CHAIN_DECIMALS, symbol: CHAIN_CURRENCY },
              rpcUrls: [CHAIN_RPC]
            }
          ]
        });
      }
    }
  }
}

// export const onboard = async () => {
//   const BLOCKNATIVE_KEY = process.env.BLOCKNATIVE_KEY;
//   const NETWORK_ID = process.env.NETWORK_ID;
//
//   const wallets = [
//     { walletName: "metamask", preferred: true },
//     // {
//     //   walletName: "walletConnect",
//     //   rpc: {
//     //     56: "https://bsc-dataseed.binance.org/",
//     //     97: "https://data-seed-prebsc-1-s1.binance.org:8545/",
//     //   },
//     //   preferred: true
//     // },
//   ];
//
//   initOnboard = await Onboard({
//     dappId: BLOCKNATIVE_KEY,
//     networkId: +NETWORK_ID,
//     networkName: "BSC Testnet",
//     hideBranding: true,
//     darkMode: true,
//     walletSelect: {
//       wallets: wallets,
//       heading: 'Wallet select',
//       description: 'Please select a wallet:',
//     },
//   });
// }

// export const onboardV2 = async () => {
//   const injected = injectedModule();
//
//   initOnboard = Onboardv2({
//     wallets: [injected],
//     chains: [
//       {
//         id: '0x61',
//         token: 'BNB',
//         label: 'Smart Chain - Testnet',
//         rpcUrl: 'https://data-seed-prebsc-1-s1.binance.org:8545/'
//       },
//     ],
//     appMetadata: {
//       name: 'Game Hotel',
//       icon: '../favicon.svg',
//       description: 'Game Hotel using Onboard',
//       recommendedInjectedWallets: [
//         { name: 'Coinbase', url: 'https://wallet.coinbase.com/' },
//         { name: 'MetaMask', url: 'https://metamask.io' }
//       ]
//     }
//   })
// }

export const getAccount = () => account;
