import React from 'react';
import { uniqueId } from '../../util/util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: '',
      title: '',
      body: '',
      done: false
    };
    this.addTodo = this.addTodo.bind(this);
  }

  linkState(key) {
    return (event => this.setState({[key]: event.currentTarget.value}));
  }

  addTodo(event) {
    event.preventDefault();
    const todo = Object.assign({}, this.state);
    todo.id = uniqueId();
    this.props.addTodo(todo);

    this.setState({
      id: '',
      title: '',
      body: '',
      done: false
    });
  }

  render() {
    return (
      <form>
        <h3>Add Todo!</h3>
        <label>Title
          <input onChange={ this.linkState('title') } value={this.state.title} type="text"/>
        </label>
        <label>Body
          <input onChange={ this.linkState('body') } value={this.state.body} type="text"/>
        </label>

        <button onClick={this.addTodo}>ADD TODO!</button>
      </form>
    );
  }
}

export default TodoForm;
