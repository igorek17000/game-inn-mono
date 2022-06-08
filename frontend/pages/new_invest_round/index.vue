<template>
  <main class="farm-privat-page calc-height">
    <div class="farming-page-header farming-header--privat" v-if="$vuetify.breakpoint.mdAndUp">
      <div class="container">
        <div class="farming-header">
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
    <section class="farming-slots" v-if="$vuetify.breakpoint.mdAndUp">
      <div class="container">
        <div class="farming-slots__title">
          <div class="text-28">Последние фарм слоты</div>
        </div>
        <div class="table table--farming">
          <div class="table-head">
            <table>
              <!--==== заголовочная строка =====-->
              <thead>
              <tr>
                <th class="id-col">
                  <p>ID</p>
                </th>
                <th class="period-col">
                  <p>Период</p>
                </th>
                <th class="progress-col">
                  <p>Прогресс</p>
                </th>
                <th class="deposit-col">
                  <p>Залог GINN</p>
                </th>
                <th class="booster-col">
                  <p>Booster</p>
                </th>
                <th class="reinvest-col">
                  <p>Авто продление</p>
                </th>
                <th class="amount-col">
                  <span>Добыто</span>
                </th>
                <th class="btn-col"></th>
              </tr>
              </thead>
            </table>
          </div>
          <div class="table-body">
            <table>
              <tbody>
              <!--=========строка с контентом =====-->
                <tr v-for="(stack, id) of stacks" :key="id">
                <td class="id-col">
                  <p>{{ stack.guid }}</p>
                </td>
                <td class="period-col">
                  <p class="account-badge">{{ stack .period }} месяца</p>
                </td>
                <td class="progress-col">
                  <div class="slot-progress">
                    <div class="mining-icon"></div>
                    <div class="progress-block">
                      <div class="progress-block-time">180 д. 0 ч.</div>
                      <div class="progress-block-line">
                        <div class="progress-block-bar">
                          <span>50%</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </td>
                <td class="deposit-col">
                  <div class="slot-deposit">
                    <div class="coin-icon"></div>
                    <p>
                      <strong>{{ getAmount(stack.stake_amount) | filterAmount }}</strong>
                    </p>
                  </div>
                </td>
                <td class="booster-col">
                  <div class="gradient-badge">x 1.5</div>
                </td>
                <td class="reinvest-col">
                  <div
                      class="switch-inner switch-inner--pink switch-toggle-text"
                  >
                    <label
                        class="switch-item"
                        @click="actions(
                            'autoConfirm',
                            { id: stack.guid, status: stack.auto_confirm }
                            )"
                    >
                      <input
                          type="checkbox"
                          :checked="stack.auto_confirm"
                          disabled
                      />
                      <span></span>
                      <span></span>
                      <p
                          class="on"
                          v-if="stack.auto_confirm"
                      >Вкл</p>
                      <p class="off" v-else>Выкл</p>
                    </label>
                  </div>
                </td>
                <td class="amount-col">
                  <p>$ 1 540</p>
                </td>
                <td class="btn-col">
                  <div
                      class="button blue-button"
                      v-if="!stack.isClaimed && !stack.auto_confirm"
                      @click="actions('claim', { id: stack.guid })"
                  >Разблокировать GINN</div>
                  <div class="button blue-button disable" v-else>Разблокировать GINN</div>
                  <div class="options-btn">
                    <span class="more-dotted"></span>
                  </div>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="farming-slots__btn">
          <div class="button button--color">Смотреть все слоты </div>
        </div>
      </div>
    </section>
    <section class="farming-slots" v-else>
      <div class="container">
        <div class="farming-slots__title">
          <div class="text-28">Последние фарм слоты</div>
        </div>
        <div class="slot-card-wrapper--mob">
          <!--======== single card =========-->
          <div class="slot-card" v-for="(stack, id) of stacks" :key="id">
            <div class="slot-card__header">
              <div class="slot-card__header-row">
                <div class="slot-card-id">Слот ID {{ stack.guid }}</div>
                <div class="slot-card-links">
                  <div class="text-link">Начисления</div>
                  <div class="text-link">Помощь</div>
                </div>
              </div>
              <div class="slot-card__header-row">
                <div class="slot-progress">
                  <div class="mining-icon"></div>
                  <div class="progress-block">
                    <div class="progress-block-time">180 д. 0 ч.</div>
                    <div class="progress-block-line">
                      <div class="progress-block-bar">
                        <span>50%</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="slot-card__body">
              <div class="slot-card-list">
                <div class="farm-slot-period">
                  <span>Период</span>
                  <p class="account-badge">{{ stack .period }} месяца</p>
                </div>
                <div class="farm-slot-deposit">
                  <span>Залог GINN</span>
                  <div class="slot-deposit">
                    <div class="coin-icon"></div>
                    <p>
                      <strong>{{ getAmount(stack.stake_amount) | filterAmount }}</strong>
                    </p>
                  </div>
                </div>
                <div class="farm-slot-booster">
                  <span>Booster</span>
                  <p>
                    <strong>x 1.5</strong>
                  </p>
                </div>
                <div class="farm-slot-reinvest">
                  <span>Автопродление</span>
                  <div class="switch-inner switch-inner--pink switch-toggle-text">
                    <label
                        class="switch-item"
                        @click="actions(
                            'autoConfirm',
                            { id: stack.guid, status: stack.auto_confirm }
                            )"
                    >
                      <input
                          type="checkbox"
                          :checked="stack.auto_confirm"
                          disabled

                      />
                      <span></span>
                      <span></span>
                      <p
                          class="on"
                          v-if="stack.auto_confirm"
                      >Вкл</p>
                      <p class="off" v-else>Выкл</p>
                    </label>
                  </div>
                </div>
                <div class="farm-slot-income">
                  <span>Добыто</span>
                  <p>
                    <strong>$ 1 540</strong>
                  </p>
                </div>
              </div>
            </div>
            <div class="slot-card__footer">
              <div
                  class="button blue-button"
                  v-if="!stack.isClaimed && !stack.auto_confirm"
                  @click="actions('claim', { id: stack.guid })"
              >Разблокировать GINN</div>
              <div class="button blue-button disable" v-else>Разблокировать GINN</div>
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
        <div class="modal-button" data-btn="payProgress" data-close="data-close">
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
              <div class="text-16">Выберите период блокировки в <a class="text-blue" href="farm-reinvest.html">фарминге</a>
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
                  <input type="text" placeholder="0.0" />
                  <span>MAX 2 720 GINN</span>
                </div>
              </div>
              <div class="farm-form-item">
                <div class="farm-item-name">
                  <img src="../../assets/img/coins/tether.png" width="36" alt="alt" />
                  <p>USDT</p>
                </div>
                <div class="farm-item-field">
                  <input type="text" placeholder="0.0" />
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
              <div class="text-16">Выберите период блокировки </div>
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
  mixins: [MetamaskMixins, globalMixins],
  components: {
    ClaimDialog: () => import('~~/components/UI/ClaimDialog'),
    InvestPageTable: () => import('~/components/UI/InvestPageTable')
  },
  async mounted() {
    this.UpdateMath();
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
    getDate(date) {
      return this.$moment(+date).format("MMM Do YY")
    },
    getAmount(amount) {
      return Math.round10(amount * 10e-19, -4) || 0;
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
        stake_period: +this.period,
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
  },
  filters: {
    filterAmount(v) {
      if (!v) return ''
      let value = Math.round(v);
      const s = value.toString().length;
      const chars = value.toString().split('');
      const strWithSpaces = chars.reduceRight((acc, char, i) => {
        const spaceOrNothing = ((((s - i) % 3) === 0) ? ' ' : '');
        return (spaceOrNothing + char + acc);
      }, '');

      return ((strWithSpaces[0] === ' ') ? strWithSpaces.slice(1) : strWithSpaces);
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
