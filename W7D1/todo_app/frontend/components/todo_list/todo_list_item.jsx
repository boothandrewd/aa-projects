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
    event.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  checkToggle(event) {
    // event.preventDefault(); AHHHHHHHHHHHHHHHHHHHHHHHH
    const toggledTodo = merge({}, this.props.todo, {done: !this.props.todo.done});
    this.props.receiveTodo(toggledTodo);
  }

  render() {
    return (
      <li>
        { this.props.todo.title }
        <input type="checkbox" onChange={this.checkToggle} checked={this.props.todo.done}/>
        <button onClick={this.removeTodo}>Remove TODO</button>
      </li>
    );
  }
}

export default TodoListItem;
