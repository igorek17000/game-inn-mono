<template>
  <main class="farm-page farm-page--single">
    <!--===========FARM HEADER ===========-->
    <div class="farm-header">
      <div class="container mb-10">
        <div class="farm-header-content d-flex">
          <div class="farm-header-left">
            <div class="farm-header-column">
              <div class="farm-title">
                <h1>Раунд
                  <br /> прямых инвестиций
                </h1>
                <div class="badge badge--light">Открыт до 2 марта</div>
              </div>
              <div class="farm-info">
                <div class="investrounds-card__col">
                  <div class="investrounds-info">
                    <div class="info-item">
                      <p>9 090 909</p>
                      <span>Всего токенов</span>
                    </div>
                    <div class="info-item">
                      <p>25%</p>
                      <span>Скидка</span>
                    </div>
                    <div class="info-item">
                      <p>$ 0.13750</p>
                      <span>Цена токена</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="farm-header-text">
                <p>
                  <span>Выплачиваем 40% прибыли
                    <br /> от игрового майнинга
                  </span> держателям
                  <br />токена GINN и участвующим в добыче
                </p>
              </div>
            </div>
          </div>
          <!--=======правая часть с формой =======		-->
          <div class="farm-header-right">
            <div class="farm-header-right__title">
              <p>Покупка GINN</p>
            </div>
            <div class="farm-header-form">
              <form class="invest-round-form">
                <div class="invest-form__header text-20">
                  <p>Купить GINN через USDT</p>
                </div>
                <div class="invest-form__body">
                  <!--====блок ПОЛУЧИТЬ=====-->
                  <div class="form-field">
                    <div class="form-field-top d-flex">
                      <span class="text-14">Получить</span>
                      <div class="text-13 text-bold">
                        <p>MAX 30 000 GINN</p>
                      </div>
                    </div>
                    <div class="form-field-bottom">
                      <input v-model="GINNToken" placeholder="0.0" name="" @input="buyGINNToken"/>
                      <div class="input-icon">
                        <span class="text-14">GINN</span>
                        <img src="~~/assets/img/coins/coingold.png" width="30" alt="alt" />
                      </div>
                    </div>
                  </div>
                  <!--====блок Отдать=====-->
                  <div class="form-field">
                    <div class="form-field-top d-flex">
                      <span class="text-14">Отдать</span>
                      <div class="text-13 text-bold">
                        <p> </p>
                      </div>
                    </div>
                    <div class="form-field-bottom">
                      <input v-model="USDTToken" placeholder="0.0" name="" @input="saleUSDTToken"/>
                      <div class="input-icon">
                        <span class="text-14">USDT</span>
                        <img src="~~/assets/img/coins/tether.png" width="30" alt="alt" />
                      </div>
                    </div>
                  </div>
                  <!--====блок Фарма=====-->
                  <div class="form-field">
                    <div class="form-field-top d-flex">
                      <span class="text-14">Период фарма</span>
                      <div class="text-13 text-bold">
                        <p> </p>
                      </div>
                    </div>
                    <div class="form-field-bottom">
                      <select v-model="period">
                        <option>1</option>
                        <option>3</option>
                        <option>6</option>
                        <option>12</option>
                        <option>36</option>
                      </select>
                    </div>
                  </div>
                  <!--====блок Фарма=====-->
                  <div class="form-checkbox">
                    <label>
                      <input type="checkbox" name="vehicle1" value="Bike" v-model="auto_renewal">
                      <span class="fake-checkbox"></span>
                      <div>Автопродление</div>
                    </label>
                  </div>
                  <button class="button button--color" @click.prevent="actions('buy')">Купить GINN</button>
                  <div class="subbutton">1 GINN = {{ rate }} USDT</div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="container mb-10">
        <div class="farm-header-form">
          <form class="invest-round-form">
            <div class="invest-form__header text-20">
              <p>Отдать токены на холдинг</p>
            </div>
            <div class="invest-form__body">
              <!--====блок Отдать=====-->
              <div class="form-field">
                <div class="form-field-top d-flex">
                  <span class="text-14">Колличество</span>
                  <div class="text-13 text-bold">
                    <p> </p>
                  </div>
                </div>
                <div class="form-field-bottom">
                  <input v-model="stakeGINNTokens" placeholder="0.0" name=""/>
                  <div class="input-icon">
                    <span class="text-14">GINN</span>
                    <img src="~~/assets/img/coins/coingold.png" width="30" alt="alt" />
                  </div>
                </div>
              </div>
              <!--====блок Фарма=====-->
              <div class="form-field">
                <div class="form-field-top d-flex">
                  <span class="text-14">Период фарма</span>
                  <div class="text-13 text-bold">
                    <p> </p>
                  </div>
                </div>
                <div class="form-field-bottom">
                  <select v-model="stakePeriod">
                    <option>1</option>
                    <option>3</option>
                    <option>6</option>
                    <option>12</option>
                    <option>36</option>
                  </select>
                </div>
              </div>
              <button class="button button--color" @click.prevent="actions('stake')">Холд GINN</button>
            </div>
          </form>
        </div>
      </div>

<!--      <div class="container mb-10">-->
<!--        <div class="farm-header-form">-->
<!--          <form class="invest-round-form">-->
<!--            <div class="invest-form__header text-20">-->
<!--              <p>Клейм GINN</p>-->
<!--            </div>-->
<!--            <div class="invest-form__body">-->
<!--              &lt;!&ndash;====блок Фарма=====&ndash;&gt;-->
<!--              <div class="form-field">-->
<!--                <div class="form-field-top d-flex">-->
<!--                  <span class="text-14">Период фарма</span>-->
<!--                  <div class="text-13 text-bold">-->
<!--                    <p> </p>-->
<!--                  </div>-->
<!--                </div>-->
<!--                <div class="form-field-bottom">-->
<!--                  <select v-model="selectedStackPeriod">-->
<!--                    <option v-for="(val, key, index) in stackVal" :value="key" :key="index">{{ index + 1 + ' Период'  }}</option>-->
<!--                  </select>-->
<!--                </div>-->
<!--              </div>-->

<!--              <div class="form-field" v-if="stackVal[selectedStackPeriod] && stackVal[selectedStackPeriod][0]">-->
<!--                <div class="form-field-top d-flex">-->
<!--                  <span class="text-14">Период фарма</span>-->
<!--                  <div class="text-13 text-bold">-->
<!--                    <p> </p>-->
<!--                  </div>-->
<!--                </div>-->
<!--                <div class="form-field-bottom">-->
<!--                  <select v-model="selectedStack">-->
<!--                    <template v-for="(val, index) in stackVal[selectedStackPeriod]">-->
<!--                      <option v-if="!stacks[selectedStackPeriod][index][2]" :value="index" :key="index">{{ val + ' GINN' }}</option>-->
<!--                    </template>-->
<!--                  </select>-->
<!--                </div>-->
<!--              </div>-->
<!--              <button class="button button&#45;&#45;color" @click.prevent="actions('claim')">Клейм</button>-->
<!--            </div>-->
<!--          </form>-->
<!--        </div>-->
<!--      </div>-->

      <div class="container mb-10">
        <div class="claim-table__header">
          <div class="container">
            <div class="flex-header">
              <h2 class="text-24">Клейм GINN</h2>
            </div>
          </div>
        </div>
        <div class="claim-table__content">
          <InvestPageTable
              :list="stacks"
              @toggleClaim="actions('claim', $event)"
              @toggleAutoConfirm="actions('autoConfirm', $event)"
          />
        </div>
      </div>
    </div>

    <ClaimDialog ref="claimDialog"/>
  </main>
</template>

<script>
import { BigNumber } from  '@ethersproject/bignumber';
import {mapGetters} from "vuex";
import MetamaskMixins from "~/mixins/MetamaskMixins";

export default {
  name: "InvestRound",
  data() {
    return {
      GINNToken: null,
      USDTToken: null,
      stakeGINNTokens: null,
      period: 1,
      stakePeriod: 1,
      auto_renewal: false,
      rate: 1250000/9090909,
      selectedStackPeriod: null,
      selectedStack: null,
    }
  },
  mixins: [MetamaskMixins],
  components: {
    ClaimDialog: () => import('~~/components/UI/ClaimDialog'),
    InvestPageTable: () => import('~/components/UI/InvestPageTable')
  },
  computed: {
    ...mapGetters({
      tokens: 'web3/getTokens',
      account: 'web3/getAccount',
      stacks: 'web3/getStacks',
    }),
    stackVal() {
      let newObj = {};
      for (let key in this.stacks) {
        newObj[key] = this.stacks[key].map(val => {
          return (val[1] / Math.pow(10, 18)).toFixed();
        })
      }
      return newObj;
    },
  },
  methods: {
    openDialog(id) {
      this.$refs.claimDialog.toggleDialog(id);
    },
    toBigNumber(val, decimal) {
      return BigNumber.from(val).mul(BigNumber.from(10).pow(BigNumber.from(decimal)))
    },
    bigAmount(amount) {
      return this.toBigNumber(Math.floor(amount), 18).toString()
    },
    getStackPeriodKey(val) {
      return val.slice(val.indexOf('_') + 1);
    },
    buyGINNToken(val) {
      let input = val.target.value;
      if (Math.sign(input) === 1) {
        this.GINNToken = input;
        this.USDTToken = `${Math.round(input * this.rate)}`;
      }
    },
    saleUSDTToken(val) {
      let input = val.target.value;
      if (Math.sign(input) === 1) {
        this.USDTToken = input;
        this.GINNToken = `${Math.round(input / this.rate)}`;
      }
    },
    async setDefaultDialog() {
      await this.$store.dispatch('modals/setStartedStage', 1);
      await this.$store.dispatch('modals/setCompletedStage', 0);
      await this.$store.dispatch('modals/setOrderInProgress', false);
      await this.$store.dispatch('modals/setStepsCount', 1);
    },
    async actions(val, payload = {}) {
      let { id, status } = payload;
      try {
        await this.$store.dispatch('modals/setOrderInProgress', true);

        switch (val) {
          case 'buy':
            await this.buyWithUSDT();
            break;
          case 'stake':
            await this.stakeToken();
            break;
          case 'claim':
            await this.claimToken(id);
            break;
          case 'autoConfirm':
            await this.setAutoConfirm(id, status);
            break;
        }

        await this.getContractsData();
        await this.setDefaultDialog();
      } catch (e) {
        await this.setDefaultDialog();
        console.log(e)
      }
    },
    async buyWithUSDT() {
      await this.$store.dispatch('modals/setStepsCount', 2);

      const allowance = await this.$store.dispatch('web3/allowance', {
        instance: this.tokens.BUSDContract.instance,
        spender: this.tokens.PrivateContract.address,
        address: this.account.address,
      });

      if(allowance < this.bigAmount(this.USDTToken)) {
        await this.$store.dispatch('web3/approve', {
          contract: this.tokens.BUSDContract,
          spender: this.tokens.PrivateContract.address,
          amount: this.toBigNumber(this.USDTToken, this.tokens.BUSDContract.decimals).toString(),
          address: this.account.address,
        });
      }
      await this.$store.dispatch('modals/setStartedStage', 2);
      await this.$store.dispatch('modals/setCompletedStage', 1);

      await this.$store.dispatch('web3/swap', {
        contract: this.tokens.PrivateContract,
        address: this.account.address,
        value: this.toBigNumber(this.USDTToken, this.tokens.BUSDContract.decimals).toString(),
        stake_period: this.period,
        auto_renewal: this.auto_renewal
      });
      await this.$store.dispatch('modals/setStartedStage', 2);
      await this.$store.dispatch('modals/setCompletedStage', 2);

      this.GINNToken = null;
      this.USDTToken = null;
      this.period = 1;
    },
    async stakeToken() {
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
            .stake(this.toBigNumber(this.stakeGINNTokens, 18), this.stakePeriod)
            .send({ from: this.account.address, gas: '300000'})

        await this.$store.dispatch('modals/setStartedStage', 2);
        await this.$store.dispatch('modals/setCompletedStage', 2);

        this.stakeGINNTokens = null;
        this.stakePeriod = 1;
      }
    },
    async claimToken(id) {
      console.log('claimToken: ', id)
      await this.$store.dispatch('modals/setStepsCount', 2);

      await this.tokens.PrivateContract.instance.methods
          .claimStake(id)
          .send({ from: this.account.address, gas: '300000'})

      await this.$store.dispatch('modals/setStartedStage', 2);
      await this.$store.dispatch('modals/setCompletedStage', 2);

      this.selectedStackPeriod = null;
      this.selectedStack = null;
    },
    async setAutoConfirm(id, status) {
      if(status) {
        await this.tokens.PrivateContract.instance.methods
            .unsetAutoConfirm(id)
            .send({ from: this.account.address, gas: '300000'})
      }
    }
  }
}
</script>

<style scoped lang="scss">
.form-checkbox label {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  position: relative;
  margin-bottom: 20px;
}
.form-checkbox label input {
  width: 0.01px;
  height: 0.01px;
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
}
.form-checkbox label span.fake-checkbox {
  width: 20px;
  height: 20px;
  border-radius: 6px;
  background: #EEF5FF;
  border: 1px solid #9BADCA;
  margin-right: 12px;
  font-size: 14px;
  line-height: 20px;
  color: #3B4E6A;
  background: url(../../assets/img/icons/check.svg);
  background-position: center -50px;
  background-repeat: no-repeat;
  background-size: contain;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
}
.form-checkbox label input[type=checkbox]:checked + span.fake-checkbox {
  background-color: #7256FF;
  background-position: center center;
}
</style>
