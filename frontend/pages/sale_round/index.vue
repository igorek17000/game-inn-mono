<template>
  <main class="farm-page farm-page--single">
    <!--===========FARM HEADER ===========-->
    <div class="farm-header">
      <div class="container">
        <div class="farm-header-content d-flex">
          <div class="farm-header-left">
            <div class="farm-header-column">
              <div class="farm-title">
                <h1>Раунд
                  <br /> Открытых продаж
                </h1>
                <div class="badge badge--light">Начнется 10 июня</div>
              </div>
              <div class="farm-info">
                <div class="investrounds-card__col">
                  <div class="investrounds-info">
                    <div class="info-item">
                      <p>2 727 273</p>
                      <span>Всего токенов</span>
                    </div>
                    <div class="info-item">
                      <p>0%</p>
                      <span>Скидка</span>
                    </div>
                    <div class="info-item">
                      <p>$ 0.18333</p>
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
                      <input v-model="GINNToken" type="text" placeholder="0.0" name="" @input="buyGINNToken"/>
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
                      <input v-model="USDTToken" type="text" placeholder="0.0" name="" @input="saleUSDTToken"/>
                      <div class="input-icon">
                        <span class="text-14">USDT</span>
                        <img src="~~/assets/img/coins/tether.png" width="30" alt="alt" />
                      </div>
                    </div>
                  </div>
                  <button class="button button--color" @click.prevent="buyWithUSDT">Купить GINN</button>
                  <div class="subbutton">1 GINN = {{ rate }} USDT</div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
import { BigNumber } from  '@ethersproject/bignumber';
import {mapGetters} from "vuex";

export default {
  name: "SaleRound",
  data() {
    return {
      test: true,
      GINNToken: null,
      USDTToken: null,
      rate: 500000/2727273,
    }
  },

  computed: {
    ...mapGetters({
      tokens: 'web3/getTokens',
      account: 'web3/getAccount',
    }),
  },
  methods: {
    toBigNumber(val, decimal) {
      return BigNumber.from(val).mul(BigNumber.from(10).pow(BigNumber.from(decimal)))
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
    async buyWithUSDT() {
      await this.$store.dispatch('modals/setOrderInProgress', true);

      try {
        await this.$store.dispatch('modals/setStepsCount', 2);

        const allowance = await this.$store.dispatch('web3/allowance', {
          instance: this.tokens.BUSDContract.instance,
          spender: this.tokens.PublicContract.address,
          address: this.account.address,
        });

        if(allowance == 0) {
          await this.$store.dispatch('web3/approve', {
            contract: this.tokens.BUSDContract,
            spender: this.tokens.PublicContract.address,
            amount: this.toBigNumber(this.USDTToken, 18).toString(),
            address: this.account.address,
          });
        }
        await this.$store.dispatch('modals/setStartedStage', 2);
        await this.$store.dispatch('modals/setCompletedStage', 1);

        await this.$store.dispatch('web3/publicSwap', {
          contract: this.tokens.PublicContract,
          address: this.account.address,
          value: this.toBigNumber(this.USDTToken, 18).toString(),
        });
        await this.$store.dispatch('modals/setStartedStage', 2);
        await this.$store.dispatch('modals/setCompletedStage', 2);

        this.GINNToken = null;
        this.USDTToken = null;

        await Promise.all([
          this.$store.dispatch('web3/getGINNBalance',
              {
                instance: this.tokens.GINNContract.instance,
                address: this.account.address,
              }),
        ]);
        await this.setDefaultDialog();
      } catch (e) {
        await this.setDefaultDialog();
        console.log(e)
      }
    }
  }
}
</script>
