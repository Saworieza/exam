import { combineReducers } from 'redux'

import dashboard from './dashboard';
import auth from './auth';
import { routerStateReducer as router } from 'redux-react-router';

export default combineReducers({
  router,
  dashboard,
  auth
});
