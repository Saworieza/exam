import { createReducer } from '../utils';

import { actionNames } from '../actions/login';

const initialState = {
  username: null,
  isAuthenticated: false,
  isAuthenticating: false,
  token: null
};

export default createReducer(initialState, {
  [actionNames.REQUEST_LOGIN]: (state, payload) => {
    return Object.assign({}, state, {
      username: payload.username,
      isAuthenticating: true
    });
  },
  [actionNames.RECEIVE_LOGIN]: (state, payload) => {
    return Object.assign({}, state, {
      isAuthenticating: false,
      token: payload.token,
      isAuthenticated: true,
    });
  },
  [actionNames.RECEIVE_LOGOUT]: (state, payload) => {
    return Object.assign({}, state, initialState);
  }
});
