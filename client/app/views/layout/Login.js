'use strict';

import React from 'react';
import Header from './Header';

import './common.css';
import './Login.css';
import './fonts.css';

export default function LoginLayout(Component) {

  class Login extends React.Component {
    render() {
      return (
        <div className='login'>
          <Header />
          <div className='login-content'>
            <Component {...this.props}/>
          </div>
        </div>
      );
    }
  }

  return Login;

}
