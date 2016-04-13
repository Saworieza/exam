'use strict';
import { connect } from 'react-redux';
import { actions } from '../../actions/students';
import Students from './Students';

function mapState(state) {
  return {
    students: state.students
  };
}

export default connect(mapState, actions)(Students);
