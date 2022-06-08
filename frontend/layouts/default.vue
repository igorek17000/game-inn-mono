<template>
 <div class="wrapper">
   <Header />
   <nuxt />
   <Footer />
   <CustomPayStatusDialog />
 </div>
</template>

<script>
import { mapGetters } from 'vuex';
import CustomPayStatusDialog from '../components/UI/CustPayStatusDialog'

export default {
  name: "DefaultLayout",
  components: {
    Header: () => import('~~/components/header'),
    Footer: () => import('~~/components/footer'),
    CustomPayStatusDialog
  },
  computed: {
    ...mapGetters({
      isConnected: 'web3/isConnected',
      tokens: 'web3/getTokens',
      account: 'web3/getAccount',
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
