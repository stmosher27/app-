import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { getTodos } from './utils/todo_api_util';
import Root from './components/root';


import { fetchTodos } from './actions/todo_actions';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  // store.dispatch(fetchTodos());

//   store.dispatch((dispatch) => {
//   console.log('If this prints out, the thunk middleware is working!');
// });

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
