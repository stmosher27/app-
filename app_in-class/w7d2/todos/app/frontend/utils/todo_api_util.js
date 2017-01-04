export const fetchTodos = () => (
  $.ajax({
    method: 'GET',
    url: 'api/todos'
  }).then(console.log('worked'))
);

export const createTodo = (todo) => (
  $.ajax({
      method: 'POST',
      url: 'api/todos',
      data: {todo}
  })
);
