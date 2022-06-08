<template>
  <v-dialog
      v-model="orderInProgress"
      width="500"
  >

    <div class="pay-progress-wrapper" data-modal="payProgress" @click="closeDialog()">
      <div class="page-modal pay-progress" @click.stop>
        <div class="page-modal__header">
          <div class="text-16">Подтверждаем транзакцию...</div>
          <button class="close-btn" data-close="data-close" @click="closeDialog()">&#10006;</button>
        </div>
        <div class="page-modal__body">
          <div class="pay-progress__list">
            <div class="pay-progress-item">
              <div class="pay-progress__icon"></div>
              <div class="pay-progress__text">Отправили USDT</div>
            </div>
            <div class="pay-progress-item">
              <div class="pay-progress__icon"></div>
              <div class="pay-progress__text">Начисляем GINN..</div>
            </div>
            <div class="pay-progress-item">
              <div class="pay-progress__icon"></div>
              <div class="pay-progress__text">Создаем слот фарминга</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </v-dialog>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "CustPayStatusDialog",
  components: {
    "ctm-modal-box": () => import('./CtmModalBox')
  },
  computed: {
    ...mapGetters({
      startedStage: 'modals/getStartedStage',
      completedStage: 'modals/getCompletedStage',
      orderInProgress: 'modals/getOrderInProgress',
      steps: 'modals/getStepsCount',
    }),
  },
  methods: {
    closeDialog() {
      this.$store.dispatch('modals/setOrderInProgress', false)
    }
  }
}
</script>

<style lang="scss" scoped>
::v-deep.v-dialog__container {
  display: unset;
}

.add-modal-box {
  padding: 40px;
}

.stage-block {
  padding: 20px;
  margin-right: 20px;
  border: 5px solid #7256ff;
  border-radius: 10px 10px;
  min-height: 82px;
  display: flex;
}
</style>
