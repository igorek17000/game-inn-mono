<template>
  <main class="farm-public-page calc-height">
    <div class="farming-page-header farming-header--privat">
      <div class="container">
        <div class="farming-header">
          <div class="farming-header__left">
            <div class="farming-header__badge">
              <div class="badge badge--black"> Открыт до 2 мая</div>
            </div>
            <div class="farming-header__title">
              <div class="text-36">
                <span>Раунд</span> Public
              </div>
            </div>
            <div class="farming-header__text">
              <p>Покупая GINN вы автоматически участвуете в распределении до 40% от суммы дохода с игрового майнинга в GameFi проектах.</p>
            </div>
            <div class="farming-header__list">
              <div class="farmin-text">
                <p>Всего токенов продается</p>
                <p>2 727 273 GINN</p>
              </div>
              <div class="farmin-text">
                <p>Цена токена</p>
                <p>$ 0,18333</p>
              </div>
            </div>
            <div class="farming-header__link">
              <div class="badge badge--light">Как работает фарминг?</div>
            </div>
          </div>
          <!--=========== правая часть ==========-->
          <div class="farming-header__right">
            <div class="farming-header__img">
              <img src="../../assets/img/icons/donut.png" width="550" alt="img" data-aos="fade-up" data-aos-delay="200" />
            </div>
            <div class="modal-addSlot">
              <div class="page-modal__body">
                <div class="page-modal__body-top">
                  <div class="page-modal-container">
                    <div class="farm-form-exchange">
                      <p>
                        <strong>1 GINN = $ {{ rate }}</strong>
                      </p>
                    </div>
                    <div class="farm-form-block">
                      <div class="farm-form-item">
                        <div class="farm-item-name">
                          <img src="../../assets/img/coins/coin.png" width="36" alt="alt" />
                          <p>GINN</p>
                        </div>
                        <div class="farm-item-field">
                          <input v-model="GINNToken" type="text" placeholder="0.0" name="" @input="buyGINNToken"/>
                          <span>MAX 2 720 GINN</span>
                        </div>
                      </div>
                      <div class="farm-form-item">
                        <div class="farm-item-name">
                          <img src="../../assets/img/coins/tether.png" width="36" alt="alt" />
                          <p>USDT</p>
                        </div>
                        <div class="farm-item-field">
                          <input v-model="USDTToken" type="text" placeholder="0.0" name="" @input="saleUSDTToken"/>
                          <span>MIN 5 USDT</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="page-modal__body-bottom">
                  <div class="page-modal-container">
                    <div class="reinverse-block__text">
                      <div class="farmin-text">
                        <p>BOOSTER</p>
                        <p>
                          <strong>x 1.5</strong>
                        </p>
                      </div>
                      <div class="farmin-text">
                        <p>APR</p>
                        <p>
                          <strong>38.42 %</strong>
                        </p>
                      </div>
                    </div>
                    <div class="page-modal__block">
                      <div class="text-16">Выберите период блокировки в <a class="text-blue" href="farm-reinvest.html">фарминге</a>
                      </div>
                    </div>
                    <div class="farming-period-block">
                      <div class="radio-badge-group">
                        <div class="radio-badge">
                          <label>
                            <input type="radio" name="period2" value="1" checked="checked" />
                            <span>1 мес</span>
                          </label>
                        </div>
                        <div class="radio-badge">
                          <label>
                            <input type="radio" name="period2" value="2" />
                            <span>3 мес</span>
                          </label>
                        </div>
                        <div class="radio-badge">
                          <label>
                            <input type="radio" name="period2" value="3" />
                            <span>6 мес</span>
                          </label>
                        </div>
                        <div class="radio-badge">
                          <label>
                            <input type="radio" name="period2" value="2" />
                            <span>1 год</span>
                          </label>
                        </div>
                        <div class="radio-badge">
                          <label>
                            <input type="radio" name="period2" value="3" />
                            <span>3 года</span>
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="farming-switch">
                      <div class="switch-inner switch-inner--pink">
                        <label class="switch-item">
                          <input type="checkbox" checked="checked" />
                          <span></span>
                          <span></span>
                          <p>Авто продление</p>
                        </label>
                      </div>
                      <div class="tooltip-box tooltip-box--color">
                        <div class="tooltip-icon"></div>
                        <div class="tooltip-box-content">
                          <p>Реинвестиция происходит по цене рынка, но не ниже цены паблика, автоматически на 1 число каждого месяца в 00:00 по GMT (по Гринвичу)</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div
                    class="modal-button"
                    data-btn="payProgress"
                    data-close="data-close"
                    @click.prevent="buyWithUSDT"
                >
                  <span>Купить GINN и начать фарм</span>
                  <div class="arrow-right-white"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <InvestPageTable />
  </main>
</template>

<script>
import { BigNumber } from  '@ethersproject/bignumber';
import {mapGetters} from "vuex";
import MetamaskMixins from "~/mixins/MetamaskMixins";

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
  components: {
    InvestPageTable: () => import('~/components/common/InvestPageTable')
  },
  mixins: [MetamaskMixins],
  methods: {
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
