'use strict';
import React from 'react';
import { Route, IndexRoute } from 'react-router';

import { requireAuthentication } from './utils';
import DashboardLayout from './views/layout/Dashboard';
import LoginLayout from './views/layout/Login';

/* routed components */
import App from './App';
import Home from './views/home/Home';
import Exams from './views/exams/Exams';
import Students from './views/students';
import Login from './views/login';

export default (
  <Route path='/' component={App}>
    <Route path='login' component={LoginLayout(Login)} />
    <IndexRoute component={requireAuthentication(DashboardLayout(Home))} />
    <Route path='exams' component={requireAuthentication(DashboardLayout(Exams))} />
    <Route path='students' component={requireAuthentication(DashboardLayout(Students))} />
  </Route>
);
