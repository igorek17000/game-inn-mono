<template>
  <main class="farm-privat-page calc-height">
    <div class="farming-page-header farming-header--privat" v-if="$vuetify.breakpoint.mdAndUp">
      <div class="container">
        <div class="farming-header"
           v-gsap.fromTo="[
          { opacity: 0, y: 250 },
          { opacity: 1, y: 0, duration: 1 }
        ]">
          <div class="farming-header__left">
            <div class="farming-header__badge">
              <div class="badge badge--black"> Открыт до 2 мая</div>
            </div>
            <div class="farming-header__title">
              <div class="text-36">
                <span>Раунд</span> Private
              </div>
            </div>
            <div class="farming-header__text">
              <p>Покупая GINN вы автоматически участвуете в распределении до 40% от суммы дохода с игрового майнинга в GameFi проектах.</p>
            </div>
            <div class="farming-header__list">
              <div class="farmin-text">
                <p>Всего токенов продается</p>
                <p>9 090 909 GINN</p>
              </div>
              <div class="farmin-text">
                <p>Цена токена</p>
                <p>$ 0.13750</p>
              </div>
              <div class="farmin-text">
                <p>Скидка раунда</p>
                <p>25%</p>
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
                    <div class="farm-form-block">
                      <div class="farm-form-item">
                        <div class="farm-item-name">
                          <img src="../../assets/img/coins/coin.png" width="36" alt="alt" />
                          <p>GINN</p>
                        </div>
                        <div class="farm-item-field">
                          <input v-model="GINNToken" type="text" value="0.0"  @input="buyGINNToken" />
                          <span>MAX 2 720 GINN</span>
                        </div>
                      </div>
                      <div class="farm-form-item">
                        <div class="farm-item-name">
                          <img src="../../assets/img/coins/tether.png" width="36" alt="alt" />
                          <p>USDT</p>
                        </div>
                        <div class="farm-item-field">
                          <input v-model="USDTToken" type="text" value="0.0"  @input="saleUSDTToken"/>
                          <span>MIN 5 USDT</span>
                        </div>
                      </div>
                    </div>
                    <div class="farm-form-exchange">
                      <p>1 GINN = $ {{ rate }}
                        <strike>$ 0,18333</strike>
                      </p>
                      <div class="badge badge--red">-25%</div>
                    </div>
                  </div>
                </div>
                <div class="page-modal__body-bottom">
                  <div class="page-modal-container">
                    <div class="page-modal__block">
                      <div class="text-16">Выберите период блокировки в <a class="text-blue" href="farm-reinvest.html">фарминге</a>
                      </div>
                    </div>
                    <div class="farming-period-block">
                      <div class="radio-badge-group">
                        <div class="radio-badge">
                          <label>
                            <input v-model="period" type="radio" name="period1" value="6" checked="checked" />
                            <span>6 мес</span>
                          </label>
                        </div>
                        <div class="radio-badge">
                          <label>
                            <input v-model="period" type="radio" name="period2" value="12" />
                            <span>1 год</span>
                          </label>
                        </div>
                        <div class="radio-badge">
                          <label>
                            <input v-model="period" type="radio" name="period3" value="36" />
                            <span>3 года</span>
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="farming-switch">
                      <div class="switch-inner switch-inner--pink">
                        <label class="switch-item">
                          <input v-model="auto_renewal" type="checkbox" checked="checked" />
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
                      <div class="farmin-text">
                        <p>APY</p>
                        <p>
                          <strong>88.42 %</strong>
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
                <div
                    class="modal-button"
                    data-btn="payProgress"
                    data-close="data-close"
                    @click.prevent="actions('buy')"
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
    <div class="farming-page-header farming-header--privat-mob" v-else>
      <div class="swiper-mobile-menu">
        <div class="container">
          <div class="swiper-mobile-menu__list">
            <a href="#!">Мой профиль</a>
            <a class="active" href="#!">Обучение</a>
            <a href="#!">Финансы</a>
            <a href="#!">Настройки</a>
            <a href="#!">Финансы</a>
            <a href="#!">Настройки</a>
          </div>
        </div>
      </div>
      <div class="farming-header">
        <div class="container">
          <div class="farming-header__content">
            <div class="farming-header__left">
              <div class="farming-header__title">
                <div class="text-17"> Раунд <span>Private</span>
                </div>
                <div class="farming-header__badge">
                  <div class="badge badge--black"> Открыт до 2 мая</div>
                </div>
              </div>
              <div class="farming-header__text">
                <p>Покупая GINN вы автоматически участвуете в распределении до 40% от суммы дохода с игрового майнинга в GameFi проектах.</p>
              </div>
              <div class="farming-header__link">
                <a class="badge badge--light" href="farm-reinvest-mob2.html">Как работает фарминг?</a>
              </div>
              <div class="farming-header__list farming-header__list--swipe">
                <div class="farmin-text">
                  <p>Всего токенов продается</p>
                  <p>9 090 909 GINN</p>
                </div>
                <div class="farmin-text">
                  <p>Цена токена</p>
                  <p>$ 0.13750</p>
                </div>
                <div class="farmin-text">
                  <p>Скидка раунда</p>
                  <p>25%</p>
                </div>
              </div>
            </div>
            <!--=========== правая часть ==========-->
            <div class="farming-header__right">
              <div class="modal-addSlot">
                <div class="page-modal__body">
                  <div class="page-modal__body-top">
                    <div class="page-modal-container">
                      <div class="farm-form-block">
                        <div class="farm-form-item">
                          <div class="farm-item-name">
                            <img src="../../assets/img/coins/coin.png" width="36" alt="alt" />
                            <p>GINN</p>
                          </div>
                          <div class="farm-item-field">
                            <input v-model="GINNToken" type="text" value="0.0"  @input="buyGINNToken" />
                            <span>MAX 2 720 GINN</span>
                          </div>
                        </div>
                        <div class="farm-form-item">
                          <div class="farm-item-name">
                            <img src="../../assets/img/coins/tether.png" width="36" alt="alt" />
                            <p>USDT</p>
                          </div>
                          <div class="farm-item-field">
                            <input v-model="USDTToken" type="text" value="0.0"  @input="saleUSDTToken"/>
                            <span>MIN 5 USDT</span>
                          </div>
                        </div>
                      </div>
                      <div class="farm-form-exchange">
                        <p>1 GINN = $ 0,13750
                          <strike>$ 0,18333</strike>
                        </p>
                        <div class="badge badge--red">-25%</div>
                      </div>
                    </div>
                  </div>
                  <div class="page-modal__body-bottom">
                    <div class="page-modal-container">
                      <div class="page-modal__block">
                        <div class="text-16">Выберите период блокировки в <a class="text-blue" href="farm-reinvest-mob.html">фарминге</a>
                        </div>
                      </div>
                      <div class="farming-period-block">
                        <div class="radio-badge-group">
                          <div class="radio-badge">
                            <label>
                              <input v-model="period" type="radio" name="period1" value="6" checked="checked" />
                              <span>6 мес</span>
                            </label>
                          </div>
                          <div class="radio-badge">
                            <label>
                              <input v-model="period" type="radio" name="period2" value="12" />
                              <span>1 год</span>
                            </label>
                          </div>
                          <div class="radio-badge">
                            <label>
                              <input v-model="period" type="radio" name="period3" value="36" />
                              <span>3 года</span>
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="farming-switch">
                        <div class="switch-inner switch-inner--pink">
                          <label class="switch-item">
                            <input v-model="auto_renewal" type="checkbox" checked="checked" />
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
                        <div class="farmin-text">
                          <p>APY</p>
                          <p>
                            <strong>88.42 %</strong>
                          </p>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div
                      class="modal-button"
                      data-btn="payProgress"
                      data-close="data-close"
                      @click.prevent="actions('buy')"
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
    </div>
    <InvestPageTable />
  </main>
</template>

<script>
import { BigNumber } from  '@ethersproject/bignumber';
import {mapGetters} from "vuex";
import MetamaskMixins from "~/mixins/MetamaskMixins";
import globalMixins from "~/mixins/globalMixins";

export default {
  name: "NewInvestRound",
  data() {
    return {
      GINNToken: 0,
      USDTToken: 0,
      stakeGINNTokens: null,
      period: 6,
      stakePeriod: 1,
      auto_renewal: false,
      rate: 1250000/9090909,
      selectedStackPeriod: null,
      selectedStack: null,
    }
  },
  mixins: [MetamaskMixins],
  components: {
    ClaimDialog: () => import('~/components/CtmDialogs/ClaimDialog'),
    InvestPageTable: () => import('~/components/common/InvestPageTable')
  },
  computed: {
    ...mapGetters({
      tokens: 'web3/getTokens',
      account: 'web3/getAccount',
      stacks: 'web3/getStacks',
    }),
  },
  methods: {
    openDialog(id) {
      this.$refs.claimDialog.toggleDialog(id);
    },
    getDate(date) {
      return this.$moment(+date).format("MMM Do YY")
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
    async actions(val) {
      try {
        await this.$store.dispatch('modals/setOrderInProgress', true);

        switch (val) {
          case 'buy':
            await this.buyWithUSDT();
            break;
          case 'stake':
            await this.stakeToken();
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
        stake_period: +this.period,
        auto_renewal: this.auto_renewal
      });
      await this.$store.dispatch('modals/setStartedStage', 2);
      await this.$store.dispatch('modals/setCompletedStage', 2);

      this.GINNToken = null;
      this.USDTToken = null;
      this.period = 1;
    },
  },
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
