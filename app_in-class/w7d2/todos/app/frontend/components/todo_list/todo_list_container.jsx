import { connect } from 'react-redux';
import TodoList from './todo_list';
import TodoForm from './todo_form';

// Actions
import { receiveTodos, createTodo, fetchTodos } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';

const mapStateToProps = (state, errors) => ({
  todos: allTodos(state),
  state,
  errors
});

const mapDispatchToProps = dispatch => ({
  receiveTodos: () => dispatch(receiveTodos()),
  createTodo: todo => dispatch(createTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
