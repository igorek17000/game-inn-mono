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
            <p>wallet name</p>
          </th>
          <th class="wallet-val">
            <p>value</p>
          </th>
          <th class="btn-col"></th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="item of list" :key="item.id">
          <td>
            <p>{{ item.id }}</p>
          </td>
          <td class="wallet-name">
            <p>{{ item.title }}</p>
          </td>
          <td class="wallet-val">
            <p class="badge badge--light"> {{ item.amount | filterAmount }} GINN</p>
          </td>
          <td class="btn-col">
            <div class="button button--color" data-btn="claim" @click="openDialog(item.id)">claim</div>
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

export default {
  name: "AdminPageTable",
  props: {
    list: {
      type: Array,
      default: () => [],
    }
  },
  methods: {
    openDialog(id) {
      this.$emit('toggle', id);
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
