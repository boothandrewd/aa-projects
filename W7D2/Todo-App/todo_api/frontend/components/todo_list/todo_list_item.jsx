import React from 'react';
import merge from 'lodash/merge';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      done: this.props.todo.done
    };

    this.removeTodo = this.removeTodo.bind(this);
    this.checkToggle = this.checkToggle.bind(this);
  }

  removeTodo(event) {
    this.props.removeTodo(this.props.todo);
  }

  checkToggle(event) {
    const toggledTodo = merge({}, this.props.todo, {done: !this.props.todo.done});
    this.props.receiveTodo(toggledTodo);
  }

  render() {
    const { done, title } = this.props.todo;

    return (
      <li>
        <input type="checkbox" onChange={this.checkToggle} checked={done}/>
        {title}
        <button onClick={this.removeTodo}>Remove</button>
      </li>
    );
  }
}

export default TodoListItem;
