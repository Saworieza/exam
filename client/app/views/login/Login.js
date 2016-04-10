'use strict';

import React from 'react';
import { Link } from 'react-router';

import './Login.css';

class Login extends React.Component {

  constructor(props) {
    super(props);
    this._handleLogin = this._handleLogin.bind(this);
    const redirectRoute = this.props.location.query.next || '/';
    this.state = {
      redirectTo: redirectRoute
    }

  }

  _handleLogin(e) {
    e.preventDefault();
    const username = this.refs.username.value;
    const password = this.refs.password.value;
    this.props.login(username, password, this.state.redirectTo);
  }

  render() {
    return (
      <div className='login-box'>
        <div className='login-form'>
          <h1>Login</h1>
          <form onSubmit={this._handleLogin}>
              <div className='username text'>
                <input type='text' id='username' ref='username' placeholder='Username' />
              </div>
              <div className='password text'>
                <input type='password' id='password' ref='password' placeholder='Password' />
              </div>
              <button type='submit'>Get Started</button>
          </form>
          <div className='links'>
            <Link to='/'>Create Account</Link>
            <Link to='/' className='need-help'>Need Help?</Link>
          </div>
        </div>
      </div>
    );
  }
}

export default Login;
