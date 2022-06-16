<template>
  <section class="farming-slots">
    <section class="farming-slots">
      <div class="container">
        <div v-if="$vuetify.breakpoint.mdAndUp" class="farming-slots__row">
          <div class="farming-slots__header">
            <div class="display-toggle">
              <div
                  :class="displayType === 'table' ? 'display-table--active' : ''"
                  class="display-table-icon"
                  @click="displayType = 'table'"
              ></div>
              <div
                  :class="displayType === 'cards' ? 'display-cards--active' : ''"
                  class="display-cards-icon"
                  @click="displayType = 'cards'"
              ></div>
            </div>
            <div class="farming-slots__title">
              <div class="text-28">Мои фарм слоты</div>
            </div>
            <div class="add-item-block" data-btn="addSlot_1" @click="openDialog">
              <div class="plus-icon2"></div>
            </div>
          </div>
          <div class="tabs-wrapper tabs-wrapper--split">
            <div class="tabs-header">
              <div class="tabs">
                <div class="tab">
                  <p>Активные</p>
                </div>
                <div class="tab">
                  <p>Выполненные</p>
                </div>
                <div class="tab">
                  <p>Архивные</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <template v-else>
          <div class="farming-slots__header">
            <div class="farming-slots__title">
              <div class="text-28">Мои фарм слоты</div>
            </div>
            <div class="add-item-block" data-btn="addSlot_2" @click="$refs.AddSlot.toggleDialog()">
              <div class="plus-icon2"></div>
            </div>
          </div>
          <div class="farming-slots__toggle">
            <div class="radio-badge-group radio-badge-group--flex">
              <div class="radio-badge">
                <label>
                  <input type="radio" name="slot_filter" value="1" checked="checked" />
                  <span>Активные</span>
                </label>
              </div>
              <div class="radio-badge">
                <label>
                  <input type="radio" name="slot_filter" value="2" />
                  <span>Выполненные</span>
                </label>
              </div>
              <div class="radio-badge">
                <label>
                  <input type="radio" name="slot_filter" value="3" />
                  <span>Архивные</span>
                </label>
              </div>
            </div>
          </div>
        </template>
        <CustTable
            ref="custTable"
            :stack-list="stackList"
            :display-type="displayType"
            v-model:set-show="showAll"
        />
      </div>
    </section>
    <AddSlot ref="AddSlot"/>
  </section>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "InvestPageTable",
  components: {
    CustTable: () => import('~~/components/UI/CustTable'),
    AddSlot: () => import('~~/components/CtmDialogs/AddSlot'),
  },
  data() {
    return {
      displayType: 'table',
      showAll: false,
    }
  },
  computed: {
    ...mapGetters({
      stacks: 'web3/getStacks',
    }),
    stackList() {
      if (this.stacks.length > 0) {
        return this.showAll ? this.stacks : this.stacks.filter((item, index) => index < 3);
      } else {
        return []
      }
    }
  },
  methods: {
    openDialog() {
      this.$refs.custTable.openDialog();
    },
  }
}
</script>

<style scoped>

</style>
