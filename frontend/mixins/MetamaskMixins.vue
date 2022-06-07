<script>
import {mapGetters} from "vuex";

export default {
  name: "MetamaskMixins",
  computed: {
    ...mapGetters({
      isConnected: 'web3/isConnected',
      tokens: 'web3/getTokens',
      account: 'web3/getAccount',
    }),
  },
  methods: {
    async tryConnect() {
      try {
        await this.ConnectToMetamask();
        this.SetLoader(true);
        if(this.isConnected) {
          await this.getContractsData();
        }
        this.SetLoader(false);
      } catch (e) {
        this.SetLoader(false);
        console.log(e);
      }
    },
    async getContractsData() {
      await Promise.all([
        this.$store.dispatch('web3/getGINNBalance',
        {
          instance: this.tokens.GINNContract.instance,
          address: this.account.address,
        }),
        this.$store.dispatch('web3/getStacks',
        {
          instance: this.tokens.PrivateContract.instance,
          address: this.account.address,
        }),
        this.$store.dispatch('web3/setRounds',
        {
          instance: this.tokens.AdminWalletContract.instance,
        }),
      ]);
    },
  }
}
</script>
