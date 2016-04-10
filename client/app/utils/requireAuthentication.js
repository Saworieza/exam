import React from 'react';
import { connect } from 'react-redux';
import { pushState } from 'redux-react-router';

export default function requireAuthentication(Component) {

  class AuthenticatedComponent extends React.Component {

    componentWillMount () {
      this.checkAuth();
    }

    componentWillReceiveProps (nextProps) {
      this.checkAuth();
    }

    checkAuth () {
      if (!this.props.auth.isAuthenticated) {
        let redirectAfterLogin = this.props.location.pathname;
        this.props
          .dispatch(pushState(null, `/login?next=${redirectAfterLogin}`));
      }
    }

    render () {
      return this.props.auth.isAuthenticated ? <Component {...this.props}/> : null;
    }
  }

  const mapStateToProps = (state) => ({
    auth: state.auth
  });

  return connect(mapStateToProps)(AuthenticatedComponent);

}
