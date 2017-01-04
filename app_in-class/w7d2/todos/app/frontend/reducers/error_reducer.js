import { RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/error_actions';


const errorsReducer = (state = [], action) => {
  Object.freeze(state);
  let newState = [];
  switch(action.type) {
    case RECEIVE_ERRORS:
      action.errors.forEach(error => newState.push(error));
      return newState;
    case CLEAR_ERRORS:
      return newState;
    default:
      return state;
  }
};
