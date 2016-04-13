import { combineReducers } from 'redux'

import dashboard from './dashboard';
import auth from './auth';
import students from './students';
import { routerStateReducer as router } from 'redux-react-router';

export default combineReducers({
  router,
  dashboard,
  auth,
  students
});
