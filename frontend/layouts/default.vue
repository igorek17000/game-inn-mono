<template>
 <div class="wrapper">
   <Header />
   <nuxt />
   <PortfolioBlock />
   <Footer />
   <CustomPayStatusDialog />
   <transition name="fade">
     <loader v-if="isLoading"/>
   </transition>
 </div>
</template>

<script>
import { mapGetters } from 'vuex';
import globalMixins from "~/mixins/globalMixins";

export default {
  name: "DefaultLayout",
  components: {
    Header: () => import('~~/components/header'),
    Footer: () => import('~~/components/footer'),
    CustomPayStatusDialog: () => import('~~/components/CtmDialogs/CustPayStatusDialog'),
    PortfolioBlock: () => import('~~/components/common/PortfolioBlock'),
    loader: () => import('~~/components/UI/loader'),
  },
  mixins: [globalMixins],
  async mounted() {
    this.UpdateMath();
  },
  computed: {
    ...mapGetters({
      isConnected: 'web3/isConnected',
      tokens: 'web3/getTokens',
      account: 'web3/getAccount',
      isLoading: 'main/getIsLoading',
    }),
  },
  watch: {
    $route: {
      immediate: true,
      handler() {
        if (!this.isConnected) {
          this.$router.push('/invest')
        }
      }
    }
  }
}
</script>

<style scoped lang="scss">

</style>
