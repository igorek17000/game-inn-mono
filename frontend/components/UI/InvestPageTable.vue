<template>
  <div class="container">
    <!--=========table  Что бы открыть по клику модальное окно,  у кнопки claim  в таблице прописан атрибут data-btn="claim"  и такое же значение data-modal  у модального окна. Модальное окно видно за счет добавления класса visible  Если надо, что бы по клику на любую кнопку открывалось одно и то же окно, то надо прописать другой скрипт Сейчас работает логика: одна кнопка - открывает одно конкретное окно ==============-->
    <div class="table claim-table claim-table2">
      <table>
        <!--==== заголовочная строка =====-->
        <thead>
        <tr>
          <th>
            <p>#</p>
          </th>
          <th class="wallet-name">
            <p>Stake date</p>
          </th>
          <th class="wallet-val">
            <p>Stake amount</p>
          </th>
          <th class="wallet-val">
            <p>Is claimed</p>
          </th>
          <th class="wallet-val">
            <p>Auto-confirm</p>
          </th>
          <th class="wallet-val">
            <p>Period</p>
          </th>
          <th class="btn-col"></th>
          <th class="btn-col"></th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="item of list" :key="item.id">
          <td>
            <p>{{ item.guid }}</p>
          </td>
          <td class="wallet-name">
            <p>{{ getDate(item.stake_date) }}</p>
          </td>
          <td class="wallet-name">
            <p>{{ getAmount(item.stake_amount) | filterAmount }}</p>
          </td>
          <td class="wallet-name">
            <p>{{ item.isClaimed }}</p>
          </td>
          <td class="wallet-name">
            <p>{{ item.auto_confirm }}</p>
          </td>
          <td class="wallet-name">
            <p>{{ item.period }}</p>
          </td>
          <td class="btn-col">
            <div
                v-if="item.auto_confirm"
                class="button button--color"
                data-btn="claim"
                @click="toggleAutoConfirm(item.guid, item.auto_confirm)"
            >Toggle auto confirms</div>
            <div
                v-else
                class="button button--flex"
                data-btn="claim"
            >Toggle auto confirms</div>
          </td>
          <td class="btn-col">
            <div
                v-if="!item.isClaimed && !item.auto_confirm"
                class="button button--color"
                data-btn="claim"
                @click="claim(item.guid)"
            >Claim</div>
            <div
                v-else
                class="button button--flex"
                data-btn="claim"
            >Claim</div>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
    <div class="page-modal claim-modal" data-modal="claim">
      <div class="page-modal__header">
        <h3 class="text-16">Claim Liquidity for uniswap</h3>
        <button class="close-btn" data-close="data-close">&#10006;</button>
      </div>
      <div class="page-modal__body">
        <form class="claim-form">
          <div class="form-field">
            <label>Amount</label>
            <input type="text" name="" />
          </div>
          <div class="form-field">
            <label>Address</label>
            <input type="text" name="" />
          </div>
          <div class="claim-form-btn">
            <button class="button button--color" type="button">
              <span>Change</span>
            </button>
            <a class="text-link" href="#!">Cancel</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import globalMixins from "~/mixins/globalMixins";

export default {
  name: "InvestPageTable",
  props: {
    list: {
      type: [Array, Object],
      default: () => [],
    }
  },
  mixins: [globalMixins],
  async mounted() {
    this.UpdateMath();
  },
  methods: {
    claim(id) {
      this.$emit('toggleClaim', {id});
    },
    toggleAutoConfirm(id, status) {
      this.$emit('toggleAutoConfirm', {id, status});
    },
    getDate(date) {
      return this.$moment(+date).format("MMM Do YY")
    },
    getAmount(amount) {
      return Math.round10(amount * 10e-19, -4) || 0;
    },
  },
  filters: {
    filterAmount(value) {
      if (!value) return ''
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

<style scoped>

</style>
