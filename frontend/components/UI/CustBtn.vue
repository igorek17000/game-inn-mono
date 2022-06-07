<template>
  <div>
    <div v-if="!disable" class="investrounds-card__button">
      <button class="button" @click="$emit('click')">{{ text }}</button>
    </div>
    <div v-else class="investrounds-card__button">
      <button class="button">{{ text }}</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "CustomButton",
  props: {
    disable: {
      type: Boolean,
      default: false,
    },
    text: {
      type: String,
      default: 'go',
    }
  }
}
</script>

<style scoped>

</style>
