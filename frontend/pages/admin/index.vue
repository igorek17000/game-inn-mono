<template>
  <main class="claim-page">
    <section class="claim-page-content">
      <div class="claim-table__header">
        <div class="container">
          <div class="flex-header">
            <h2 class="text-24">Claim</h2>
          </div>
        </div>
      </div>
      <div class="claim-table__content">
        <CustTable :list="adminRounds" @toggle="openDialog"/>
      </div>
    </section>
    <ClaimDialog ref="claimDialog"/>
  </main>
</template>

<script>
import { mapGetters } from 'vuex';
import MetamaskMixins from "~/mixins/MetamaskMixins";
import {BigNumber} from "@ethersproject/bignumber";
import globalMixins from "~/mixins/globalMixins";

export default {
  name: "AdminPage",
  components: {
    CustomButton: () => import('~~/components/UI/CustBtn'),
    ClaimDialog: () => import('~/components/CtmDialogs/ClaimDialog'),
    CustTable: () => import('~/components/common/AdminPageTable')
  },
  computed: {
    ...mapGetters({
      isConnected: 'web3/isConnected',
      GINNBalance: 'web3/getGINNBalance',
      rounds: 'web3/getRounds',
    }),
    getRoundBalance() {
      return Math.round(this.GINNBalance)
    },
    adminRounds() {
      return this.rounds.map((item, index) => {
        let {0: amount, 3: title} = item
        return {
          id: index + 1,
          title,
          amount: this.getAmount(amount)
        }
      })
    },
  },
  mixins: [MetamaskMixins, globalMixins],
  head() {
    return {
      title: 'Game hotel - Invest',
    }
  },
  async mounted() {
    this.SetLoader(false);
  },
  methods: {
    openDialog(id) {
      this.$refs.claimDialog.toggleDialog(id);
    },
  },
}
</script>
