<template>
  <v-dialog
      v-model="dialog"
      width="500"
  >
    <v-card>
      <ctm-modal-box
          title="Клейм"
          class="add-modal"
          @close="toggleDialog()"
      >
        <div class="add-modal-box">
          <div class="form-field">
            <div class="form-field-top d-flex">
              <span class="text-14">Адресс</span>
              <div class="text-13 text-bold">
                <p> </p>
              </div>
            </div>
            <div class="form-field-bottom">
              <input v-model="address" placeholder="address" name=""/>
            </div>
          </div>
          <div class="form-field">
            <div class="form-field-top d-flex">
              <span class="text-14">Колличество</span>
              <div class="text-13 text-bold">
                <p> </p>
              </div>
            </div>
            <div class="form-field-bottom">
              <input v-model="amount" placeholder="0.0" name=""/>
            </div>
          </div>

          <button class="button button--color" @click.prevent="claim">Клейм</button>
        </div>
      </ctm-modal-box>
    </v-card>
  </v-dialog>
</template>

<script>
import {mapGetters} from "vuex";
import {BigNumber} from "@ethersproject/bignumber";
import MetamaskMixins from "~/mixins/MetamaskMixins";

export default {
  name: "ClaimDialog",
  components: {
    "ctm-modal-box": () => import('./CtmModalBox')
  },
  mixins: [MetamaskMixins],
  data() {
    return {
      dialog: false,
      roundId: null,
      address: '',
      amount: null,
    }
  },
  computed: {
  ...mapGetters({
      tokens: 'web3/getTokens',
    }),
  },
  methods: {
    toBigNumber(val, decimal) {
      return BigNumber.from(val).mul(BigNumber.from(10).pow(BigNumber.from(decimal)))
    },
    toggleDialog(id) {
      this.roundId = id ?? null;
      this.address = '';
      this.amount = null;
      this.dialog = !this.dialog;
    },
    async setDefaultDialog() {
      await this.$store.dispatch('modals/setStartedStage', 1);
      await this.$store.dispatch('modals/setCompletedStage', 0);
      await this.$store.dispatch('modals/setOrderInProgress', false);
      await this.$store.dispatch('modals/setStepsCount', 1);
    },
    async claim() {
      try {
        await this.$store.dispatch('modals/setOrderInProgress', true);
        await this.$store.dispatch('modals/setStepsCount', 2);

        await this.$store.dispatch('web3/adminClaim', {
          instance: this.tokens.AdminWalletContract.instance,
          _amount: this.toBigNumber(this.amount, 18).toString(),
          _recepient: this.address,
          _roundId: this.roundId,
        });

        await this.$store.dispatch('modals/setStartedStage', 2);
        await this.$store.dispatch('modals/setCompletedStage', 2);

        await this.getContractsData();
        await this.setDefaultDialog();
        this.toggleDialog();
      } catch (e) {
        await this.setDefaultDialog();
        this.toggleDialog();
        console.log('claim admin wallet', e)
      }
    }
  }
}
</script>

<style lang="scss" scoped>
::v-deep.v-dialog__container {
  display: unset;
}

.add-modal-box {
  padding: 30px;
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
