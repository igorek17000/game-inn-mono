<template>
  <div>
    <template v-if="$vuetify.breakpoint.mdAndUp">
      <div v-if="displayType === 'cards'" class="slot-card__wrapper">
        <!--======== single card =========-->
        <div v-for="(stack, id) of stackList" :key="id" class="slot-card">
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
                      @click="actions('autoConfirm', { id: stack.guid, status: stack.auto_confirm })">
                    <input
                        type="checkbox"
                        :checked="stack.auto_confirm"
                        disabled

                    />
                    <span></span>
                    <span></span>
                    <p class="on" v-if="stack.auto_confirm">Вкл</p>
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
      <div v-if="displayType === 'table'" class="table table--farming">
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
            <tr v-for="(stack, id) of stackList" :key="id">
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
    </template>
    <template v-else>
      <section class="farming-slots--mob">
        <div class="container">
          <!--============= слоты в виде карточек =======-->
          <div class="farming-slots__cards">
            <!--========  single card-mini  ===========-->
            <div
                class="slot-card slot-card--mini"
                data-btn="slot_card"
                v-for="(stack, id) of stackList" :key="id"
                @click="$refs.SingleCardModalMobile.toggleDialog(stack)"
            >
              <div class="slot-card__header">
                <div class="slot-card__header-row">
                  <div class="slot-card-id">Слот ID {{ stack.guid }}</div>
                  <div class="slot-card-links">
                    <div class="farm-slot-income">
                      <span>Добыто</span>
                      <p>
                        <strong>$ {{ getAmount(stack.stake_amount) | filterAmount }}</strong>
                      </p>
                    </div>
                    <div class="chevron-right-grey"></div>
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
            </div>
          </div>
        </div>
      </section>
    </template>
    <div v-if="!showAll" class="farming-slots__btn" @click="showValue = true">
      <div class="button button--color">Смотреть все слоты </div>
    </div>

    <SingleCardModalMobile
        ref="SingleCardModalMobile"
        @autoConfirm="actions('autoConfirm', $event)"
        @claim="actions('claim', $event)"
    />
    <AddSlot ref="AddSlot"/>
  </div>
</template>

<script>
import MetamaskMixins from "~/mixins/MetamaskMixins";
import {mapGetters} from "vuex";

export default {
  name: "CustTable",
  props: {
    stackList: {
      type: Array,
      default: () => []
    },
    displayType: {
      type: String,
      default: 'table'
    },
    showAll: {
      type: Boolean,
      default: false,
    },
  },
  components: {
    AddSlot: () => import('~~/components/CtmDialogs/AddSlot'),
    SingleCardModalMobile: () => import('~~/components/CtmDialogs/SingleCardModalMobile')
  },
  computed: {
    ...mapGetters({
      tokens: 'web3/getTokens',
      account: 'web3/getAccount',
    }),
    showValue: {
      get() {
        return this.showAll
      },
      set(value) {
        this.$emit('input', value)
      }
    }
  },
  mixins: [MetamaskMixins],
  methods: {
    openDialog() {
      this.$refs.AddSlot.toggleDialog();
    },
    async actions(val, payload = {}) {
      let { id, status } = payload;
      try {
        await this.$store.dispatch('modals/setOrderInProgress', true);

        switch (val) {
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
    async claimToken(id) {
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
}
</script>

<style scoped>

</style>
