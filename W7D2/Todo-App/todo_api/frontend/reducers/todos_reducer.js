import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';

window.merge = merge;   // TODO

const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  let oldState = merge({}, state);

  switch(action.type){
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach(todo => {
        newState[todo.id] = todo;
      });

      return newState;

    case RECEIVE_TODO:
      const newTodo = { [action.todo.id]: action.todo };
      return merge(oldState, newTodo);

    case REMOVE_TODO:
      delete oldState[action.todo.id];
      return oldState;

    default:
      return state;
  }
};

export default todosReducer;
