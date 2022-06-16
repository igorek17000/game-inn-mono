import {
  web3,
  initWeb3,
  initWeb3Contract,
} from '~/utils/web3';
import * as abi from '~/abis';

export default {
  async connect({ commit, dispatch }) {
    try {
      const response = await initWeb3();
      if (response.ok) {
        await commit('setAccount', response.result);
        await commit('setIsConnected', true);
      } else {
        console.log('Web3 connect error', response);
        commit('setIsConnected', false);
      }
    } catch (e) {
      console.log('connect', e)
    }
  },
  async initGINNContract({ commit }) {
    try {
      const [abs, address] = [abi.GINN_ABI, process.env.GINN_TOKEN];
      const instance = await initWeb3Contract(abs, address);

      const decimals = +await instance.methods.decimals().call()

      const payload = {
        address,
        instance,
        decimals
      };
      commit('setGINNToken', payload);
    } catch (e) {
      console.log('initGINNContract', e)
    }
  },
  async initBUSDContract({ commit }) {
    try {
      const [abs, address] = [abi.BUSDabi, process.env.BUSD_TOKEN];
      const instance = await initWeb3Contract(abs, address);

      const decimals = +await instance.methods.decimals().call()

      const payload = {
        address,
        instance,
        decimals
      };
      commit('setBUSDToken', payload);
    } catch (e) {
      console.log('initBUSDContract', e)
    }
  },
  async initPrivateWallet({ commit }) {
    try {
      const [abs, address] = [abi.PrivateAbi, process.env.PRIVATE_CONTRACT];
      const instance = await initWeb3Contract(abs, address);

      const payload = {
        address,
        instance,
      };
      commit('setPrivateToken', payload);
    } catch (e) {
      console.log('initPrivateWallet', e)
    }
  },
  async initPublicWallet({ commit }) {
    try {
      const [abs, address] = [abi.PublicAbi, process.env.PUBLIC_CONTRACT];
      const instance = await initWeb3Contract(abs, address);

      const payload = {
        address,
        instance,
      };
      commit('setPublicToken', payload);
    } catch (e) {
      console.log('initPublicWallet', e)
    }
  },
  async initAdminWalletContract({ commit }) {
    try {
      const [abs, address] = [abi.AdminWalletAbi, process.env.ADMIN_WALLET];
      const instance = await initWeb3Contract(abs, address);

      const payload = {
        address,
        instance,
      };
      commit('setAdminWalletContract', payload);
    } catch (e) {
      console.log('initAdminWalletContract', e)
    }
  },
  async getGINNBalance({commit}, { instance, address }) {
    try {
      const result = await instance.methods.balanceOf(address).call();
      commit('setGINNBalance', web3.utils.fromWei(result));
    } catch (e) {
      console.log('getGINNBalance', e)
    }
  },
  async getStacks({commit}, { instance, address }) {
    try {
      let result = await instance.methods.getStakesByOwner(address).call();
      commit('setStacks', result);
    } catch (e) {
      console.log('getStacks: ', e);
    }
  },
  async setRounds({commit}, { instance }) {
    try {
      const result = await instance.methods.getRounds().call();
      commit('setRounds', result);
    } catch (e) {
      console.log('setRounds: ', e)
    }
  },
  async allowance({commit}, { instance, spender, address }) {
    try {
      let res;
      res = await instance.methods.allowance(spender, address)
          .call({ from: address})
      return res;
    } catch (e) {
      console.log('allowance', e);
    }
  },
  async approve({commit}, { contract, spender, amount, address }) {
    try {
      const estimateGas = await contract.instance.methods
          .approve(spender, amount)
          .estimateGas({ from: contract.address });
      await contract.instance.methods
          .approve(spender, amount)
          .send({
            from: address,
            gas: estimateGas,
          });
    } catch (e) {
      console.log('Approve', e);
    }
  },
  async swap({ commit, dispatch }, {
    contract, address, value, stake_period, auto_renewal
  }) {
    try {
      return contract.instance.methods.swap(value, stake_period, auto_renewal).send({ from: address, gas: '300000'})
    } catch (e) {
      console.log('swapUsdt', e);
    }
  },
  async publicSwap({ commit, dispatch }, {
    contract, address, value
  }) {
    try {
      return contract.instance.methods.swap(value).send({ from: address, gas: '300000'})
    } catch (e) {
      console.log('swapUsdt', e);
    }
  },
  async adminClaim({ commit, dispatch }, { instance, _amount, _recepient, _roundId }) {
    try {
      const from = await web3.eth.getCoinbase();
      return instance.methods.claim(_amount, _recepient, _roundId)
          .send({ from })
    } catch (e) {
      console.log('claimHardcoin', e);
    }
  },
};
