<template>
 <div class="wrapper">
   <Header />
   <nuxt />
   <Footer />
   <CustomPayStatusDialog />
   <transition name="fade">
     <loader v-if="isLoading"/>
   </transition>
 </div>
</template>

<script>
import { mapGetters } from 'vuex';
import CustomPayStatusDialog from '../components/CtmDialogs/CustPayStatusDialog'

export default {
  name: "DefaultLayout",
  components: {
    Header: () => import('~~/components/header'),
    Footer: () => import('~~/components/footer'),
    loader: () => import('~~/components/UI/loader'),
    CustomPayStatusDialog
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
