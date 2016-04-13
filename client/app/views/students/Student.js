'use strict';

import React from 'react';

class Student extends React.Component {

  render() {
    return (
      <tr>
        <td>{this.props.obj.txstateid}</td>
        <td>{this.props.obj.last_name}</td>
        <td>{this.props.obj.first_name}</td>
        <td>{this.props.obj.username}</td>
        <td>{this.props.obj.email}</td>
        <td>{this.props.obj.major}</td>
      </tr>
    );
  }
}

export default Student;
