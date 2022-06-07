export default {
  isConnected: (state) => state.isConnected,
  getTokens: (state) => state.tokens,
  getAccount: (state) => state.account,
  getStakingInfo: (state) => state.stakingInfo,
  getCommonStakingInfo: (state) => state.commonStakingInfo,
  getGINNBalance: (state) => state.GINNBalance,
  getRounds: (state) => state.adminRounds,
  getStacks: (state) => state.stacks,
};
