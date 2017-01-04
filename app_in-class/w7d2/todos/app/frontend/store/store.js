
import { createStore } from 'redux';
import reducer from '../reducers/root_reducer.js';
import { applyMiddleware } from 'redux';
import thunk from '../middleware/thunk';

const configureStore  = () => createStore(reducer, applyMiddleware(thunk));


export default configureStore;
