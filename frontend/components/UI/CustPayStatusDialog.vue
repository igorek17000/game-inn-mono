<template>
  <v-dialog
      v-model="orderInProgress"
      width="500"
  >
    <v-card>
      <ctm-modal-box
          title="Order progress"
          class="add-modal"
          @close="closeDialog()"
      >
        <div class="add-modal-box flex-justify-center">
          <div v-for="step in steps" class="stage-block">
            <v-progress-circular
                v-if="startedStage <= step && completedStage < step"
                indeterminate
                color="#7256ff"
            ></v-progress-circular>
            <img v-if="completedStage >= step" width="32" height="32" src="@/assets/img/success-jackdaw.svg" alt="completed stage">
          </div>
        </div>
      </ctm-modal-box>
    </v-card>
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
