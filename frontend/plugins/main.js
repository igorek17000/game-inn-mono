import Vue from 'vue';
import {BigNumber} from "@ethersproject/bignumber";

Vue.mixin({
  methods: {
    SetLoader(value) {
      this.$store.dispatch('main/setLoading', value);
    },
    async initEthContracts() {
      await Promise.all([
        this.$store.dispatch('web3/initGINNContract'),
        this.$store.dispatch('web3/initBUSDContract'),
        this.$store.dispatch('web3/initPrivateWallet'),
        this.$store.dispatch('web3/initPublicWallet'),
        this.$store.dispatch('web3/initAdminWalletContract'),
      ]);
    },
    async ConnectToMetamask() {
      await this.$store.dispatch('web3/connect');
      if(!this.$store.getters['web3/isConnected']) return

      this.SetLoader(true);
      await this.initEthContracts();
      this.SetLoader(false);
    },
    getAmount(amount) {
      return Math.round10(amount * 10e-19, -4) || 0;
    },
    toBigNumber(val, decimal) {
      return BigNumber.from(val).mul(BigNumber.from(10).pow(BigNumber.from(decimal)))
    },
  },
  filters: {
    filterAmount(value) {
      if (!value) return ''
      const s = value.toString().length;
      const chars = value.toString().split('');
      const strWithSpaces = chars.reduceRight((acc, char, i) => {
        const spaceOrNothing = ((((s - i) % 3) === 0) ? ' ' : '');
        return (spaceOrNothing + char + acc);
      }, '');

      return ((strWithSpaces[0] === ' ') ? strWithSpaces.slice(1) : strWithSpaces);
    }
  }
});
