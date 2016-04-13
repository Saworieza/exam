'use strict';

import React from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router';
import Header from './Header';

import './fonts.css';
import './common.css';
import './Dashboard.css';

class Sidebar extends React.Component {

  constructor(props) {
    super(props);
    this._menuClasses = this._menuClasses.bind(this);
  }

  _menuClasses(className, location) {
    if (this.props.currentLocation == location) {
      return className + ' active';
    } else {
       return className;
    }
  }

  render() {
    return (
      <nav className='dashboard-sidebar'>
        <ul>
          <MenuItem className={this._menuClasses('dashboard-sidebar-home', '/')} to='/' title='Home' />
          <MenuItem className={this._menuClasses('dashboard-sidebar-home', '/exams')} to='/exams' title='Exams' />
          <MenuItem className={this._menuClasses('dashboard-sidebar-home', '/students')} to='/students' title='Students' />
        </ul>
      </nav>
    );
  }
}

class MenuItem extends React.Component {
  render() {
    return (
      <li>
        <Link to={this.props.to} className={this.props.className}>{this.props.title}</Link>
      </li>
    );
  }
}

class Master extends React.Component {
  render() {
    return (
      <div className='dashboard-master'>
        {this.props.children}
      </div>
    );
  }
}

class Detail extends React.Component {
  render() {
    return (
      <div className='dashboard-detail'>
        {this.props.children}
      </div>
    );
  }
}

export default function DashboardLayout(Component) {

  class Dashboard extends React.Component {
    render() {
      return (
        <div className='dashboard'>
          <Header />
          <div className='content'>
            <Master>
              <Sidebar currentLocation={this.props.current_location}/>
            </Master>
            <Detail>
              <Component {...this.props}/>
            </Detail>
          </div>
        </div>
      );
    }
  }

  function mapState(state) {
    return {
      current_location: state.router.location.pathname
    };
  }

  return connect(mapState)(Dashboard);

}
