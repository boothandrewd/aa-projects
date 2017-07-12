export function getTodos() {
  return $.ajax({
    type: "GET",
    url: "api/todos"
  });
}

export const createTodo = (todo) => (
  $.ajax({
    type: 'POST',
    url: 'api/todos',
    data: { todo }
  })
);
