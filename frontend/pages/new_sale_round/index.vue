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
    <section class="farming-slots">
      <div class="container">
        <div class="farming-slots__title">
          <div class="text-28">Последние фарм слоты</div>
        </div>
        <div class="no-slots-text">
          <div class="text-panel">
            <div class="text-panel__left">
              <div class="text-panel__icon">
                <div class="mining-icon"></div>
              </div>
              <div class="text-panel__content">
                <p>У вас пока нет созданных слотов фарминга. Добавьте фарм слот</p>
              </div>
            </div>
            <div class="text-panel__right">
              <div class="button button--color button--flex" data-btn="addSlot_2">
                <span class="plus-icon"></span>
                <span>Фарм слот</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--====mining-games====-->
    <section class="mining-games">
      <div class="container">
        <div class="section-title section-title--special">
          <span>GameFi проекты </span>
          <br /> в которых добываются игровые ценности
        </div>
        <div class="mining-games-cards">
          <a class="game-card-short" href="#!">
            <div class="game-card-short__img">
              <img src="../../assets/img/games/axie.jpg" width="272" alt="img" />
            </div>
            <div class="game-card-short__logo">
              <img src="../../assets/img/games/axie-logo.png" width="80" height="32" alt="alt" />
            </div>
          </a>
          <a class="game-card-short" href="#!">
            <div class="game-card-short__img">
              <img src="../../assets/img/games/mechmaster.jpg" width="272" alt="img" />
            </div>
            <div class="game-card-short__logo">
              <img src="../../assets/img/games/mechmaster-logo.png" width="80" height="32" alt="alt" />
            </div>
          </a>
          <a class="game-card-short" href="#!">
            <div class="game-card-short__img">
              <img src="../../assets/img/games/ember.jpg" width="272" alt="img" />
            </div>
            <div class="game-card-short__logo">
              <img src="../../assets/img/games/ember-logo.png" width="80" height="32" alt="alt" />
            </div>
          </a>
          <a class="game-card-short" href="#!">
            <div class="game-card-short__img">
              <img src="../../assets/img/games/fara.jpg" width="272" alt="img" />
            </div>
            <div class="game-card-short__logo">
              <img src="../../assets/img/games/fara-logo.png" width="80" height="32" alt="alt" />
            </div>
          </a>
        </div>
        <div class="mining-games__btn">
          <div class="button button-light w-100">Все проекты</div>
        </div>
      </div>
    </section>
    <!--===== modal add slot #1 ==========-->
    <div class="page-modal modal-addSlot" data-modal="addSlot_1">
      <div class="page-modal__header">
        <div class="text-16">Добавить фарм слот</div>
        <button class="close-btn" data-close="data-close">&#10006;</button>
      </div>
      <div class="page-modal__body">
        <div class="page-modal__body-top">
          <div class="page-modal-container">
            <div class="text-16">Укажите сумму</div>
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
              <p class="text-13">GINN можно разблокировать только в конце периода</p>
            </div>
            <div class="farming-period-block">
              <div class="radio-badge-group">
                <div class="radio-badge">
                  <label>
                    <input type="radio" name="period" value="1" checked="checked" />
                    <span>6 мес</span>
                  </label>
                </div>
                <div class="radio-badge">
                  <label>
                    <input type="radio" name="period" value="2" />
                    <span>1 год</span>
                  </label>
                </div>
                <div class="radio-badge">
                  <label>
                    <input type="radio" name="period" value="3" />
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
                  <p>Реинвестиция происходит по цене рынка, но не ниже цены паблика, автоматически на 1 число каждого месяца в 00:00 по GMT (по Гринвичу) </p>
                </div>
              </div>
            </div>
            <div class="reinverse-block__text">
              <div class="farmin-text">
                <p>BOOSTER </p>
                <p>x 1.5</p>
              </div>
              <div class="farmin-text">
                <p>APY</p>
                <p>88.42 %</p>
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
          <span>Добавить фарм слот</span>
          <div class="arrow-right-white"></div>
        </div>
      </div>
    </div>
    <!--===== modal add slot #2 ==========-->
    <div class="page-modal modal-addSlot" data-modal="addSlot_2">
      <div class="page-modal__header">
        <div class="text-16">Добавить фарм слот</div>
        <button class="close-btn" data-close="data-close">&#10006;</button>
      </div>
      <div class="page-modal__body">
        <div class="page-modal__body-top">
          <div class="page-modal-container">
            <div class="text-16">Укажите сумму</div>
            <div class="farm-form-exchange">
              <p>У вас <strong>63 250</strong> GINN</p>
              <p>1 GINN = $ 0,13750</p>
            </div>
            <div class="farm-form-block">
              <div class="farm-form-item">
                <div class="farm-item-name">
                  <img src="../../assets/img/coins/coin.png" width="36" alt="alt" />
                  <p>GINN</p>
                </div>
                <div class="farm-item-field">
                  <input type="text" value="0.0" />
                  <span>MAX 2 720 GINN</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="page-modal__body-bottom">
          <div class="page-modal-container">
            <div class="page-modal__block">
              <div class="text-16">Выберите период блокировки в <span class="text-blue">фарминге</span>
              </div>
              <p class="text-13">GINN можно разблокировать только в конце периода</p>
            </div>
            <div class="farming-period-block">
              <div class="radio-badge-group">
                <div class="radio-badge">
                  <label>
                    <input type="radio" name="period3" value="1" checked="checked" />
                    <span>6 мес</span>
                  </label>
                </div>
                <div class="radio-badge">
                  <label>
                    <input type="radio" name="period3" value="2" />
                    <span>1 год</span>
                  </label>
                </div>
                <div class="radio-badge">
                  <label>
                    <input type="radio" name="period3" value="3" />
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
        <div class="modal-button" data-btn="payProgress" data-close="data-close">
          <span>Добавить фарм слот</span>
          <div class="arrow-right-white"></div>
        </div>
      </div>
    </div>
    <!--===== modal Реинвестировать USDT  ==========-->
    <div class="page-modal modal-reinvest" data-modal="reinvest">
      <div class="page-modal__header">
        <div class="text-16">Реинвестировать USDT</div>
        <button class="close-btn" data-close="data-close">&#10006;</button>
      </div>
      <div class="page-modal__body">
        <div class="page-modal__body-top">
          <div class="page-modal-container">
            <div class="text-16">Укажите сумму</div>
            <div class="farm-form-block">
              <div class="farm-form-item">
                <div class="farm-item-name">
                  <img src="../../assets/img/coins/coin.png" width="36" alt="alt" />
                  <p>GINN</p>
                </div>
                <div class="farm-item-field">
                  <input type="text" value="0.0" />
                  <span>MAX 2 720 GINN</span>
                </div>
              </div>
              <div class="farm-form-item">
                <div class="farm-item-name">
                  <img src="../../assets/img/coins/tether.png" width="36" alt="alt" />
                  <p>USDT</p>
                </div>
                <div class="farm-item-field">
                  <input type="text" value="0.0" />
                  <span>MIN 5 USDT</span>
                </div>
              </div>
            </div>
            <div class="farm-form-exchange">
              <p>У вас <strong>19 500</strong> USDT</p>
              <p>1 GINN = $ 0,13750</p>
            </div>
          </div>
        </div>
        <div class="page-modal__body-bottom">
          <div class="page-modal-container">
            <div class="page-modal__block">
              <div class="text-16">Выберите период блокировки</div>
              <p class="text-13">GINN можно разблокировать только в конце периода</p>
            </div>
            <div class="farming-period-block">
              <div class="radio-badge-group">
                <div class="radio-badge">
                  <label>
                    <input type="radio" name="period4" value="1" checked="checked" />
                    <span>6 мес</span>
                  </label>
                </div>
                <div class="radio-badge">
                  <label>
                    <input type="radio" name="period4" value="2" />
                    <span>1 год</span>
                  </label>
                </div>
                <div class="radio-badge">
                  <label>
                    <input type="radio" name="period4" value="3" />
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
                <p>APR</p>
                <p>38.42 %</p>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-button" data-btn="payProgress" data-close="data-close">
          <span>Обменять USDT на GINN и начать фарм</span>
          <div class="arrow-right-white"></div>
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
