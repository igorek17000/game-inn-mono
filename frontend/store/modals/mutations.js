export default {
  setStartedStage(state, val) {
    state.startedStage = val;
  },
  setCompletedStage(state, val) {
    state.completedStage = val;
  },
  setOrderInProgress(state, val) {
    state.orderInProgress = val;
  },
  setStepsCount(state, val) {
    state.steps = val;
  },
};
