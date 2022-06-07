export default {
  setStartedStage({ commit }, val) {
    commit('setStartedStage', val);
  },
  setCompletedStage({ commit }, val) {
    commit('setCompletedStage', val);
  },
  setOrderInProgress({ commit }, val) {
    commit('setOrderInProgress', val);
  },
  setStepsCount({ commit }, val) {
    commit('setStepsCount', val);
  },
};
