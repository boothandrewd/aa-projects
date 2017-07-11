import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <ul>
          {
            this.props.todos.map(todo => {
              return (<TodoListItem
                removeTodo={this.props.removeTodo}
                receiveTodo={this.props.addTodo}
                key={todo.id}
                todo={todo}/>
              );
            })
          }
        </ul>

        <TodoForm addTodo={this.props.addTodo} />

      </div>
    );
  }
}

export default TodoList;
