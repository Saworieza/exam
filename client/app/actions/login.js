import request from 'superagent';
import { pushState } from 'redux-react-router';
import {createConstants} from '../utils';

const actionNames = createConstants(
 'REQUEST_LOGIN',
 'RECEIVE_LOGIN',
 'RECEIVE_LOGOUT'
);

/**
 * Public Actions
 **/

const login = (username, password, redirect) => {

  return (dispatch) => {

    dispatch(requestLogin(username, password));

    // return request
    //   .post(__API_PATH__ + '/v1/login')
    //   .send({ username: username, password: password, grant_type: 'password' })
    //   .set('Accept', 'application/json')
    //   .end(function(err, res){
    //     if(err){
    //       console.error(err);
    //       //TODO dispatch(loginError('Failed to communicate to server. If problem persists, contact support.'));
    //     } else if (!res.body.access_token) {
    //       console.error('no access token on response');
    //       //TODO
    //     } else if (res) {
    dispatch(successfulLogin('123', redirect));
        // }
      // });
  };

}

const successfulLogin = (res, redirect) => {
  return (dispatch) => {
    dispatch(receiveLogin(res.access_token));
    localStorage.setItem('token', res.access_token);
    dispatch(pushState(null, redirect));
  };
};

const logout = () => {
  return (dispatch) => {
    dispatch(receiveLogout());
    localStorage.removeItem('token');
    dispatch(pushState(null, '/login'));
  };
}

export default {
  actionNames,
  actions: {
    login,
    successfulLogin,
    logout
  }
}

/**
 * Private Actions
 **/

const requestLogin = (username) => {
  return {
    type: actionNames.REQUEST_LOGIN,
    payload: { username }
  };
};

const receiveLogin = (token) => {
  return {
    type: actionNames.RECEIVE_LOGIN,
    payload: { token }
  };
};

const receiveLogout = (token) => {
  return {
    type: actionNames.RECEIVE_LOGOUT
  };
};
