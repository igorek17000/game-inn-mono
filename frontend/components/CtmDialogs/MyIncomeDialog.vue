<template>
  <div v-if="dialog">
    <div class="my-income-page my-income-page--desktop">
      <div class="page-frame__header">
        <div class="container">
          <div class="page-frame__header-text">
            <div class="close-frame" data-frame-close="data-frame-close" @click="toggleDialog"></div>
            <div class="text-24">Мой доход от фарма</div>
          </div>
        </div>
      </div>
      <div class="page-frame__body">
        <div class="container">
          <div class="page-frame__content">
            <!--======= левый блок страницы==========-->
            <div class="page-frame__left">
              <div class="my-income-list">
                <div class="text-17">Статистика</div>
                <ul>
                  <li>
                    <span>Доля от общей добычи</span>
                    <p>0.38456%</p>
                  </li>
                  <li>
                    <span>Мой общий доход</span>
                    <p>$ 10 000</p>
                  </li>
                  <li>
                    <span>Реинвестировано</span>
                    <p>$ 5 000</p>
                  </li>
                  <li>
                    <span>Выведено</span>
                    <p>$ 2 000</p>
                  </li>
                  <li>
                    <span>Доступно к выводу</span>
                    <p class="text-green">$ 3 000</p>
                  </li>
                </ul>
                <div class="my-income-btn">
                  <div class="button button-light button--flex w-100">
                    <span class="arrow-up"></span>
                    <span>Вывести USDT</span>
                  </div>
                  <div class="button button--color button--flex w-100" data-btn="reinvest">
                    <span class="icon-reload"></span>
                    <span>Реинвестировать </span>
                  </div>
                </div>
              </div>
            </div>
            <!--======= правый блок страницы==========-->
            <div class="page-frame__right">
              <div class="my-income-chart">
                <div class="my-income-chart__title">
                  <div class="text-17">Объем кошелька???</div>
                </div>
                <div class="my-income-chart__content">
                  <img src="@/assets/img/icons/chart.png" width="790" alt="chart" />
                </div>
              </div>
              <div class="my-income-history">
                <div class="my-income-history__title">
                  <div class="text-24">История операций</div>
                </div>
                <div class="my-income-history__list">
                  <div class="text-panel text-panel--accrued">
                    <div class="text-panel__left">
                      <div class="text-panel__icon">
                        <div class="mining-icon"></div>
                      </div>
                      <div class="text-panel__content">
                        <p>Начисление от фарминга</p>
                        <p>20 января 2022, 13:39</p>
                      </div>
                    </div>
                    <div class="text-panel__right">
                      <p>+ $ 540</p>
                    </div>
                  </div>
                  <!--=======Вывод USDT====-->
                  <div class="text-panel text-panel--withdrawal">
                    <div class="text-panel__left">
                      <div class="text-panel__icon">
                        <div class="wallet-icon"></div>
                      </div>
                      <div class="text-panel__content">
                        <p>Вывод USDT</p>
                        <p>20 января 2022, 13:39</p>
                      </div>
                    </div>
                    <div class="text-panel__right">
                      <p>- $ 2000</p>
                    </div>
                  </div>
                  <!--=======Реинвестиция====-->
                  <div class="text-panel text-panel--reinvest">
                    <div class="text-panel__left">
                      <div class="text-panel__icon">
                        <div class="icon-reload"></div>
                      </div>
                      <div class="text-panel__content">
                        <p>Реинвестиция USDT</p>
                        <p>20 января 2022, 13:39</p>
                      </div>
                    </div>
                    <div class="text-panel__right">
                      <p>+ $ 5000</p>
                      <p>Заблокировано</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="my-income-page my-income-page--mobile" data-frame="myincome-mob">
      <div class="page-frame__header">
        <div class="container">
          <div class="page-frame__header-text">
            <div class="close-frame" data-frame-close="data-frame-close" @click="toggleDialog"></div>
            <div class="text-16">Мой доход от фарма</div>
          </div>
        </div>
      </div>
      <div class="page-frame__body">
        <div class="container">
          <div class="page-frame__chart">
            <img src="@/assets/img/icons/chart-mob.png" alt="chart" />
          </div>
          <div class="my-income-list">
            <ul>
              <li>
                <span>Доля от общей добычи</span>
                <p>0.38456%</p>
              </li>
              <li>
                <span>Мой общий доход</span>
                <p>$ 10 000</p>
              </li>
              <li>
                <span>Реинвестировано</span>
                <p>$ 5 000</p>
              </li>
              <li>
                <span>Выведено</span>
                <p>$ 2 000</p>
              </li>
              <li>
                <span>Доступно к выводу</span>
                <p class="text-green">$ 3 000</p>
              </li>
            </ul>
          </div>
          <div class="action-block action-block--border">
            <a class="action-block__item" href="#">
              <div class="options-item">
                <span class="icon-table"></span>
                <p>Операции</p>
              </div>
            </a>
            <a class="action-block__item" href="#" data-btn="reinvest">
              <div class="reinvest-item">
                <span class="icon-reload-blue"></span>
                <p>Реинвест</p>
              </div>
            </a>
            <a class="action-block__item" href="#">
              <div class="addFarm-item">
                <span class="plus-icon2"></span>
                <p>Фарм слот</p>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MyIncomeDialog",
  data() {
    return {
      dialog: false,
    }
  },
  methods: {
    toggleDialog() {
      this.dialog = !this.dialog;
    }
  }
}
</script>

<style scoped>

</style>
