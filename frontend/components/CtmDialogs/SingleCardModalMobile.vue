<template>
  <div v-if="dialog" class="page-modal modal-slotCard page-modal--fullscreen">
    <div class="page-modal__header">
      <div class="page-frame__header-text">
        <div class="close-frame" data-close="data-close" @click="toggleDialog({})"></div>
        <div class="text-16">Фарм слот ID {{ item.guid }}</div>
      </div>
      <button class="close-btn" data-close="data-close" @click="toggleDialog({})">&#10006;</button>
    </div>
    <div class="page-modal__body">
      <!--======== single card =========-->
      <div class="slot-card">
        <div class="slot-card__header">
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
              <p class="account-badge">{{ item.period }} месяца</p>
            </div>
            <div class="farm-slot-deposit">
              <span>Залог GINN</span>
              <div class="slot-deposit">
                <div class="coin-icon"></div>
                <p>
                  <strong>{{ getAmount(item.stake_amount) | filterAmount }}</strong>
                </p>
              </div>
            </div>
            <div class="farm-slot-booster">
              <span>Booster</span>
              <p>
                <strong>x 1.5</strong>
              </p>
            </div>
            <div class="farm-slot-income">
              <span>Добыто</span>
              <p>
                <strong>$ 1 540</strong>
              </p>
            </div>
          </div>
        </div>
        <div class="farming-switch">
          <div class="switch-inner switch-inner--pink">
            <label
                class="switch-item"
                @click="$emit('autoConfirm', { id: item.guid, status: item.auto_confirm })">
              <input
                  type="checkbox"
                  :checked="item.auto_confirm"
                  disabled

              />
              <span></span>
              <span></span>
              <p class="on" v-if="item.auto_confirm">Авто продление</p>
              <p class="off" v-else>Авто продление</p>
            </label>
          </div>
          <div class="tooltip-box tooltip-box--color">
            <div class="tooltip-icon"></div>
            <div class="tooltip-box-content">
              <p>Реинвестиция происходит по цене рынка, но не ниже цены паблика, автоматически на 1 число каждого месяца в 00:00 по GMT (по Гринвичу)</p>
            </div>
          </div>
        </div>
        <div class="action-block action-block--border">
          <a class="action-block__item" href="#">
            <div class="options-item">
              <span class="icon-table"></span>
              <p>Операции</p>
            </div>
          </a>
          <a class="action-block__item" href="#">
            <div class="support-item">
              <span class="support-icon"></span>
              <p>Помощь</p>
            </div>
          </a>
        </div>
        <div class="slot-card__footer">
          <div
              class="button blue-button"
              v-if="!item.isClaimed && !item.auto_confirm"
              @click="$emit('claim', { id: item.guid })"
          >Разблокировать GINN</div>
          <div class="button blue-button disable" v-else>Разблокировать GINN</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "SingleCardMobile",
  data() {
    return {
      dialog: false,
      item: {}
    }
  },
  methods: {
    toggleDialog(item) {
      this.item = item;
      this.dialog = !this.dialog;
    }
  }
}
</script>

<style scoped>

</style>
