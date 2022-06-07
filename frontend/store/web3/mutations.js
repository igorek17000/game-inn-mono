export default {
  setIsConnected(state, payload) {
    state.isConnected = payload;
  },
  setProposals(state, payload) {
    state.proposals = payload;
  },
  setGINNBalance(state, payload) {
    state.GINNBalance = payload;
  },
  setStacks(state, payload) {
    state.stacks = payload;
  },
  setRounds(state, payload) {
    state.adminRounds = payload;
  },
  setGINNToken(state, payload) {
    state.tokens = {
      ...state.tokens,
      GINNContract: payload,
    };
  },
  setBUSDToken(state, payload) {
    state.tokens = {
      ...state.tokens,
      BUSDContract: payload,
    };
  },
  setPrivateToken(state, payload) {
    state.tokens = {
      ...state.tokens,
      PrivateContract: payload,
    };
  },
  setPublicToken(state, payload) {
    state.tokens = {
      ...state.tokens,
      PublicContract: payload,
    };
  },
  setAdminWalletContract(state, payload) {
    state.tokens = {
      ...state.tokens,
      AdminWalletContract: payload,
    };
  },
  setAccount(state, payload) {
    state.account = payload;
  },
};
