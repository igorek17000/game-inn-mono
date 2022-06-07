<template>
  <div class="ctm-modal__box">
    <div
      v-if="isHeader === true"
      class="ctm-modal__header"
    >
      <div class="ctm-modal__title">
        {{ title || 'Default' }}
      </div>
      <button
        class="ctm-modal__x"
        @click="close()"
      >
        <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M12.59 0L7 5.59L1.41 0L0 1.41L5.59 7L0 12.59L1.41 14L7 8.41L12.59 14L14 12.59L8.41 7L14 1.41L12.59 0Z" fill="#7256ff"/>
        </svg>
      </button>
    </div>
    <slot />
  </div>
</template>
<script>
import { mapGetters } from 'vuex';

export default {
  name: 'ModalBox',
  props: {
    title: {
      type: String,
      default: '',
    },
    isUnclosable: {
      type: Boolean,
      default: false,
    },
    isHeader: {
      type: Boolean,
      default: true,
    },
  },
  methods: {
    close() {
      this.$store.dispatch('modals/hide');
      this.$emit('close');
    },
  },
};
</script>
<style lang="scss" scoped>
.ctm-modal {
  padding: 10px;
  position: fixed;
  overflow: auto;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(#fff, .4);
  z-index: 1400;
  text-align: center;
  white-space: nowrap;
  font-size: 0;
  &:after {
    display: inline-block;
    vertical-align: middle;
    width: 0;
    height: 100%;
    content: "";
  }
  &__box {
    font-size: 16px;
    white-space: normal;
    word-break: break-word;
    display: inline-block;
    vertical-align: middle;
    width: 100%;
    position: relative;
    max-width: 500px;
    text-align: left;
    border: 1px solid #7256ff;
    box-shadow: 0 85px 147px rgba(10, 27, 61, 0.17), 0 47.1676px 61.4131px rgba(10, 27, 61, 0.078707), 0 26.7219px 32.8344px rgba(10, 27, 61, 0.0629546), 0 14.4955px 18.4067px rgba(10, 27, 61, 0.0598272), 0 6.96225px 9.77565px rgba(10, 27, 61, 0.0584222), 0 2.43911px 4.06787px rgba(10, 27, 61, 0.0492837);

    &::after {
      content: '';
      position: absolute;
      right: 0;
      top: 0;
      border: 10px solid #7256ff;
      border-bottom: 10px solid transparent;
      border-left: 10px solid transparent;
    }
  }
  &__text {
  }
  &__content {
    padding: 28px;
  }
  &__header {
    padding: 30px 28px 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  &__title {
    color: #7256ff;
    font-weight: 400;
    font-size: 28px;
    line-height: 32px;
  }
  &__sub {
    padding-top: 10px;
    color: #000000;
    font-style: normal;
    font-weight: 500;
    font-size: 23px;
    line-height: 130%;
  }
  &__desc {
    text-align: center;
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 130%;
    color: #000000;
  }
}
</style>
