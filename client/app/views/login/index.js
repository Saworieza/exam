'use strict';
import { connect } from 'react-redux';
import { actions } from '../../actions/login';
import Login from './Login';

function mapState(state) {
  return {
    auth: state.auth
  };
}

export default connect(mapState, actions)(Login);
