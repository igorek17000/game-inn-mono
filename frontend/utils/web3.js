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
    if (initOnboard === null) await onboardV2();
    let selectStatus = await initOnboard.connectWallet();
    await initOnboard.setChain({
      chainId: '0x61'
    });

    if (selectStatus) {
      account = {
        address: selectStatus[0].accounts[0].address,
      };

      web3 = new Web3(window.ethereum)

      return success(account);
    } else return error(404, 'Connection select fail');
  } catch (err) {
    web3 = undefined;
    localStorage.removeItem('walletconnect');
    return error(500, '', err.message);
  }
};

// export const onboard = async () => {
//   const BLOCKNATIVE_KEY = process.env.BLOCKNATIVE_KEY;
//   const FORTMATIC_KEY = process.env.FORTMATIC_KEY;
//   const NETWORK_ID = process.env.NETWORK_ID;
//
//   const wallets = [
//     { walletName: "metamask", preferred: true },
//     { walletName: 'coinbase', preferred: true },
//     { walletName: 'binance', preferred: true },
//     { walletName: "fortmatic", apiKey: FORTMATIC_KEY, preferred: true },
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

export const onboardV2 = async () => {
  const FORTMATIC_KEY = process.env.FORTMATIC_KEY;

  const injected = injectedModule();
  const fortmatic = fortmaticModule({ apiKey: FORTMATIC_KEY })

  initOnboard = Onboardv2({
    wallets: [injected, fortmatic],
    chains: [
      {
        id: '0x61',
        token: 'BNB',
        label: 'Smart Chain - Testnet',
        rpcUrl: 'https://data-seed-prebsc-1-s1.binance.org:8545/'
      },
    ],
    appMetadata: {
      name: 'Game Hotel',
      icon: '../favicon.svg',
      description: 'Game Hotel using Onboard',
      recommendedInjectedWallets: [
        { name: 'Coinbase', url: 'https://wallet.coinbase.com/' },
        { name: 'MetaMask', url: 'https://metamask.io' }
      ]
    }
  })
}

export const getAccount = () => account;
