import Vue from 'vue';

const methods = {
  SetLoader(value) {
    this.$store.dispatch('main/setLoading', value);
  },
  async initEthContracts() {
    await Promise.all([
      this.$store.dispatch('web3/initUSDTContract'),
      this.$store.dispatch('web3/initHardcoinContract'),
    ]);
  },
  async ConnectToMetamask() {
    await this.$store.dispatch('web3/connect');
    if(!this.$store.getters['web3/isConnected']) return

    this.SetLoader(true);
    await this.initEthContracts();
    this.SetLoader(false);
  },
}

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
  }
});
