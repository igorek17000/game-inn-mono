<template>
  <div />
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  name: 'Shell',
  computed: {
    ...mapGetters({
      userType: 'user/getUserType',
    }),
  },
  created() {
    this.$router.push('/invest')
  },
}
</script>
