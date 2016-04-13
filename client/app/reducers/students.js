import { createReducer } from '../utils';

import { actionNames } from '../actions/students';

const initialState = {
  students: [],
  isLoading: false
};

export default createReducer(initialState, {
  [actionNames.REQUEST_STUDENTS]: (state, payload) => {
    return Object.assign({}, state, {
      isLoading: true
    });
  },
  [actionNames.RECEIVE_STUDENTS]: (state, payload) => {
    return Object.assign({}, state, {
      students: payload.students,
      isLoading: false
    });
  },
});
