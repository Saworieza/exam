'use strict';

import React from 'react';
import Student from './Student';

import './StudentTable.css';

class StudentTable extends React.Component {

  render() {
    const students = this.props.students.map( (student) => {
      return <Student key={student.id} obj={student}/>;
    });
    return (
      <table className='student-table'>
        <thead>
          <tr>
            <th>TXStateID</th>
            <th>Last name</th>
            <th>First name</th>
            <th>Username</th>
            <th>Email</th>
            <th>Major</th>
          </tr>
        </thead>
        <tbody>
          {students}
        </tbody>
      </table>
    );
  }
}

export default StudentTable;
