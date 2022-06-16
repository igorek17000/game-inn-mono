<template>
  <v-dialog v-model="dialog">
    <div class="overlay" @click="toggleDialog">
      <div @click.stop="">
        <div class="page-modal modal-addSlot">
          <div class="page-modal__header">
            <div class="text-16">Добавить фарм слот</div>
            <button class="close-btn" data-close="data-close" @click="toggleDialog">&#10006;</button>
          </div>
          <div class="page-modal__body">
            <div class="page-modal__body-top">
              <div class="page-modal-container">
                <div class="text-16">Укажите сумму</div>
                <div class="farm-form-exchange">
                  <p>У вас <strong>{{ GINNBalance }}</strong> GINN</p>
                  <p>1 GINN = $ 0,13750</p>
                </div>
                <div class="farm-form-block">
                  <div class="farm-form-item">
                    <div class="farm-item-name">
                      <img src="../../assets/img/coins/coin.png" width="36" alt="alt" />
                      <p>GINN</p>
                    </div>
                    <div class="farm-item-field">
                      <input type="text" value="0.0" v-model="stakeGINNTokens"/>
                      <span>MAX 2 720 GINN</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="page-modal__body-bottom">
              <div class="page-modal-container">
                <div class="page-modal__block">
                  <div class="text-16">Выберите период блокировки в <a class="text-blue" href="farm-reinvest.html">фарминге</a>
                  </div>
                  <p class="text-13">GINN можно разблокировать только в конце периода</p>
                </div>
                <div class="farming-period-block">
                  <div class="radio-badge-group">
                    <div class="radio-badge">
                      <label>
                        <input type="radio" name="period3" value="6" checked="checked" v-model="stakePeriod"/>
                        <span>6 мес</span>
                      </label>
                    </div>
                    <div class="radio-badge">
                      <label>
                        <input type="radio" name="period3" value="12" v-model="stakePeriod"/>
                        <span>1 год</span>
                      </label>
                    </div>
                    <div class="radio-badge">
                      <label>
                        <input type="radio" name="period3" value="36" v-model="stakePeriod"/>
                        <span>3 года</span>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="farming-switch">
                  <div class="switch-inner switch-inner--pink">
                    <label class="switch-item">
                      <input type="checkbox" checked="checked"  v-model="stakeAutoConfirm"/>
                      <span></span>
                      <span></span>
                      <p>Авто продление</p>
                    </label>
                  </div>
                  <div class="tooltip-box tooltip-box--color">
                    <div class="tooltip-icon"></div>
                    <div class="tooltip-box-content">
                      <p>Реинвестиция происходит по цене рынка, но не ниже цены паблика, автоматически на 1 число каждого месяца в 00:00 по GMT (по Гринвичу) </p>
                    </div>
                  </div>
                </div>
                <div class="reinverse-block__text">
                  <div class="farmin-text">
                    <p>BOOSTER</p>
                    <p>x 1.5</p>
                  </div>
                  <div class="farmin-text">
                    <p>APY</p>
                    <p>88.42 %</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-button" data-btn="payProgress" data-close="data-close" @click="stakeToken">
              <span>Добавить фарм слот</span>
              <div class="arrow-right-white"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </v-dialog>
</template>

<script>
import {mapGetters} from "vuex";
import {BigNumber} from "@ethersproject/bignumber";
import MetamaskMixins from "~/mixins/MetamaskMixins";

export default {
  name: "AddSlot",
  data() {
    return {
      dialog: false,
      stakeGINNTokens: '',
      stakePeriod: 6,
      stakeAutoConfirm: false,
    }
  },
  mixins: [MetamaskMixins],
  computed: {
  ...mapGetters({
      tokens: 'web3/getTokens',
      account: 'web3/getAccount',
      GINNBalance: 'web3/getGINNBalance',
    }),
  },
  methods: {
    bigAmount(amount) {
      return this.toBigNumber(Math.floor(amount), 18).toString()
    },
    cleanForm() {
      this.stakeGINNTokens = '';
      this.stakePeriod = 6;
      this.stakeAutoConfirm = false;
    },
    toggleDialog() {
      this.cleanForm();
      this.dialog = !this.dialog;
    },
    async stakeToken() {
      try {
        await this.$store.dispatch('modals/setOrderInProgress', true);

        if (this.stakeGINNTokens > 0) {
          await this.$store.dispatch('modals/setStepsCount', 2);

          const allowance = await this.$store.dispatch('web3/allowance', {
            instance: this.tokens.GINNContract.instance,
            spender: this.tokens.PrivateContract.address,
            address: this.account.address,
          });

          if(allowance < this.bigAmount(this.stakeGINNTokens)) {
            await this.$store.dispatch('web3/approve', {
              contract: this.tokens.GINNContract,
              spender: this.tokens.PrivateContract.address,
              amount: this.toBigNumber(this.stakeGINNTokens, this.tokens.GINNContract.decimals).toString(),
              address: this.account.address,
            });
          }

          await this.tokens.PrivateContract.instance.methods
              .stake(this.toBigNumber(this.stakeGINNTokens, 18), this.stakePeriod, this.stakeAutoConfirm)
              .send({ from: this.account.address, gas: '300000'})

          await this.$store.dispatch('modals/setStartedStage', 2);
          await this.$store.dispatch('modals/setCompletedStage', 2);

          this.cleanForm();
          this.toggleDialog();
        }

        await this.getContractsData();
        await this.setDefaultDialog();
      } catch (e) {
        await this.setDefaultDialog();
        console.log(e)
      }
    },
  }
}
</script>

<style lang="scss" scoped>
.overlay {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  background: #00000080;
}

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
