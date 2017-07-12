import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    const { removeTodo, createTodo } = this.props;

    return (
      <div>
        <h3>Add Todo</h3>
        <TodoForm createTodo={createTodo} />

        <h3>Todos</h3>
        <ul>
          {
            this.props.todos.map(todo => {
              return (<TodoListItem
                removeTodo={removeTodo}
                key={todo.id}
                todo={todo}/>
              );
            })
          }
        </ul>
      </div>
    );
  }
}

export default TodoList;
