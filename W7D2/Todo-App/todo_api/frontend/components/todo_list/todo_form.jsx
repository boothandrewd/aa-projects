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
    this.props.createTodo(todo).then(() => {
      this.setState({
        title: '',
        body: ''
      });
    });
  }

  render() {
    const {title, body} = this.state;

    return (
      <form>
        <label>Title
          <input onChange={ this.linkState('title') } value={title} type="text"/>
        </label>

        <label>Body
          <input onChange={ this.linkState('body') } value={body} type="text"/>
        </label>

        <button onClick={this.addTodo}>Add Todo</button>
      </form>
    );
  }
}

export default TodoForm;
