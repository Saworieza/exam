'use strict';

import React from 'react';
import Modal from '../components/Modal';
import Loading from '../components/Loading';
import { InnerHeader, InnerTitle, InnerContent } from '../components/header';

import StudentTable from './StudentTable';

import './Students.css';

class Students extends React.Component {

  constructor(props) {
    super(props);
  }

  componentWillMount() {
    this.props.fetchStudents();
  }

  render() {
    return (
      <div>
        <div className='students'>
          <InnerHeader>
            <InnerTitle>Students</InnerTitle>
          </InnerHeader>
          <InnerContent>
            <Loading isLoading={this.props.students.isLoading}>
              <StudentTable students={this.props.students.students}/>
            </Loading>
          </InnerContent>
        </div>
      </div>
    );
  }
}

export default Students;
