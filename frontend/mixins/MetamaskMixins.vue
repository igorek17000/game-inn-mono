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
        this.SetLoader(true);
        await this.ConnectToMetamask();
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
    async setDefaultDialog() {
      await this.$store.dispatch('modals/setStartedStage', 1);
      await this.$store.dispatch('modals/setCompletedStage', 0);
      await this.$store.dispatch('modals/setOrderInProgress', false);
      await this.$store.dispatch('modals/setStepsCount', 1);
    },
  }
}
</script>
