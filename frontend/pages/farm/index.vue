<template>
  <main class="farm-reinvest-page calc-height">
    <div v-if="$vuetify.breakpoint.mdAndUp" class="farming-page-header farming-header--reinvest">
      <div class="container">
        <div class="farming-header">
          <div class="farming-header__left">
            <div class="farming-header__title">
              <div class="text-36">Фарминг<span>в GameFi проектах</span>
              </div>
            </div>
            <div class="farming-header__text">
              <p>Распределяем до 40% от прибыли
                <br> с игрового майнинга.
              </p>
            </div>
            <div class="farming-header__list">
              <div class="farmin-text">
                <p>Добыча прошлого сезона</p>
                <p>$ 123 320</p>
              </div>
              <div class="farmin-text">
                <p>Общая блокировка в фарм слотах</p>
                <p>1 520 632 GINN</p>
              </div>
              <div class="farmin-text">
                <p>APR</p>
                <p>32.45 %</p>
              </div>
              <div class="farming-header__img">
                <img src="@/assets/img/icons/donut.png" width="550" alt="img" data-aos="fade-up" data-aos-delay="200" />
              </div>
            </div>
            <div class="farming-header__link">
              <div class="badge badge--light">Как работает фарминг?</div>
            </div>
          </div>
          <!--=========== правая часть ==========-->
          <div class="farming-header__right">
            <!--======= Заблокировано в слотах =======-->
            <div class="farming-info">
              <div class="farming-info__row">
                <div class="farming-blocking">
                  <div class="farming-blocking__icon">
                    <div class="mining-icon"></div>
                  </div>
                  <div class="farming-blocking__text farmin-text">
                    <p>Заблокировано в слотах</p>
                    <p>
                      <strong>150 000</strong> GINN ≈ $ 19 540
                    </p>
                  </div>
                </div>
              </div>
              <div class="farming-info__row">
                <div class="farming-buttons">
                  <div class="button button-light button--flex">
                    <span class="coin-icon"></span>
                    <span>Купить GINN</span>
                  </div>
                  <div class="button button--color button--flex" data-btn="addSlot_2" @click="openDialog">
                    <span class="plus-icon"></span>
                    <span>Фарм слот</span>
                  </div>
                </div>
              </div>
            </div>
            <!--======= Авто реинвестиция =======-->
            <div class="reinverse-block" id="reinverse-block">
              <div class="reinverse-block__header">
                <div class="switch-inner switch-inner--pink">
                  <label class="switch-item">
                    <input type="checkbox" />
                    <span></span>
                    <span></span>
                    <p>Авто реинвестиция</p>
                  </label>
                </div>
                <div class="tooltip-box tooltip-box--color">
                  <div class="tooltip-icon"></div>
                  <div class="tooltip-box-content">
                    <p>Реинвестиция происходит по цене рынка, но не ниже цены паблика, автоматически на 1 число каждого месяца в 00:00 по GMT (по Гринвичу)</p>
                  </div>
                </div>
              </div>
              <!--======= выпадающий блок =======-->
              <div class="reinverse-block__body">
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
                <div class="reinverse-block__text">
                  <div class="farmin-text">
                    <p>BOOSTER </p>
                    <p>x 1.5</p>
                  </div>
                  <div class="farmin-text">
                    <p>APY</p>
                    <p>88.42 %</p>
                  </div>
                  <div class="farmin-text">
                    <p>Списание</p>
                    <p>
                      <span class="icon-hour"></span> через 1 д 12 ч 23 м
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <!--============ К выводу ==========-->
            <div class="farming-info farming-info--special">
              <div class="farming-info__row">
                <div class="farming-desckrip" data-frame-open="myincome">
                  <div class="farming-desckrip__icon">
                    <div class="wallet-icon"></div>
                  </div>
                  <div class="farming-desckrip__text">
                    <div class="farmin-text farmin-text--change">
                      <p>
                        <span>К выводу</span>
                        <span>Заморожено</span>
                      </p>
                      <p class="text-green">$ 2 450</p>
                    </div>
                    <div class="farmin-text">
                      <p>Всего добыто</p>
                      <p>5 450</p>
                    </div>
                    <div class="farmin-text">
                      <div class="text-link text-link--flex" @click="$refs.MyIncomeDialog.toggleDialog()">
                        <span>Подробнее</span>
                        <span class="chevron-right"></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="farming-info__row">
                <div class="farming-buttons">
                  <div class="button button-light button--flex">
                    <span class="arrow-up"></span>
                    <span>Вывести USDT</span>
                  </div>
                  <div class="button button--color button--flex" data-btn="reinvest">
                    <span class="icon-reload"></span>
                    <span>Реинвестировать</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-else class="mob-header--reinvest">
      <div class="container">
        <div class="mob-header--reinvest__content">
          <!--==============block ===========-->
          <div class="farming-info">
            <div class="farming-blocking">
              <div class="farming-blocking__icon">
                <div class="mining-icon"></div>
              </div>
              <div class="farming-blocking__text farmin-text">
                <p>Заблокировано в слотах</p>
                <p>
                  <strong>150 000</strong> GINN ≈ $ 19 540
                </p>
              </div>
            </div>
          </div>
          <!--==============block ===========-->
          <div class="action-block">
            <a class="action-block__item" href="#!">
              <div class="options-item">
                <span class="icon-table"></span>
                <p>Операции</p>
              </div>
            </a>
            <a class="action-block__item" href="#!">
              <div class="bay-item">
                <span class="money-icon"></span>
                <p>Купить GINN</p>
              </div>
            </a>
            <div class="action-block__item" data-btn="addSlot_2" @click="openDialog">
              <div class="addFarm-item">
                <span class="plus-icon2"></span>
                <p>Фарм слот</p>
              </div>
            </div>
          </div>
          <!--==============block ===========-->
          <div class="farming-info">
            <div class="farming-desckrip" data-frame-open="myincome-mob2" @click="$refs.MyIncomeDialog.toggleDialog()">
              <div class="farming-desckrip__icon">
                <div class="wallet-icon"></div>
              </div>
              <div class="farming-desckrip__text">
                <div class="farmin-text">
                  <p>
                    <span>К выводу</span>
                  </p>
                  <p class="text-green">$ 2 450</p>
                </div>
                <div class="farmin-text">
                  <p>Всего добыто</p>
                  <p>5 450</p>
                </div>
                <div class="farmin-text">
                  <div class="text-link">
                    <span class="chevron-right"></span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--==============block ===========-->
          <div class="farming-switch" data-btn="auto_reinvest">
            <div class="switch-inner switch-inner--pink">
              <label class="switch-item">
                <input />
                <span></span>
                <span></span>
                <p>Авто реинвестиция</p>
              </label>
            </div>
            <div class="tooltip-box tooltip-box--color">
              <div class="tooltip-icon"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <InvestPageTable />

    <AddSlot ref="AddDialog"/>
    <MyIncomeDialog ref="MyIncomeDialog"/>
  </main>
</template>

<script>
export default {
  name: "FarmPage",
  components: {
    AddSlot: () => import('~/components/CtmDialogs/AddSlot'),
    MyIncomeDialog: () => import('~/components/CtmDialogs/MyIncomeDialog'),
    InvestPageTable: () => import('~/components/common/InvestPageTable')
  },
  methods: {
    openDialog() {
      this.$refs.AddDialog.toggleDialog();
    },
  }
}
</script>

<style scoped>

</style>
