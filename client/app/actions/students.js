import request from 'superagent';
import {createConstants} from '../utils';

const actionNames = createConstants(
 'REQUEST_STUDENTS',
 'RECEIVE_STUDENTS'
);

const fetchStudents = () => {

  return (dispatch) => {
    dispatch(requestStudents());
    return request.get(__API_PATH__ + '/students.json')
      .set('Accept', 'application/json')
      .end(function(err, res){
        if(err){
          console.error(err);
          //TODO dispatch error
        } else {
          dispatch(receiveStudents(res.body));
        }
      });
  };
};

export default {
  actionNames,
  actions: {
    fetchStudents
  }
}

const requestStudents = () => {
  return {
    type: actionNames.REQUEST_STUDENTS
  };
};

const receiveStudents = (students) => {
  return {
    type: actionNames.RECEIVE_STUDENTS,
    payload: { students }
  };
};
