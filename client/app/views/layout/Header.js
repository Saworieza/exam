'use strict';

import React from 'react';

import { actions } from '../../actions/login';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import './Header.css';

class Header extends React.Component {

  constructor(props) {
    super(props);
    this._handleLogout = this._handleLogout.bind(this);
  }

  _handleLogout(e) {
    this.props.logout();
  }

  _renderNavbar() {
    if (this.props.auth.isAuthenticated) {
      return (
        <nav>
          <li><a href="#" onClick={this._handleLogout}>Log out</a></li>
        </nav>
      );
    }
  }

  render() {
    return (
      <header>
        <div className='logo'><span className='logo-ramp'>exam</span>management</div>
        {this._renderNavbar()}
      </header>
    );
  }
}

function mapState(state) {
  return {
    auth: state.auth
  };
}

export default connect(mapState, actions)(Header);
