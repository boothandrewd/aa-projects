import * as APIUtil from "../util/todo_api_util";
import { receiveErrors } from './error_actions';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = (todo) => ({
  type: REMOVE_TODO,
  todo
});

export const fetchTodos = () => {
  return (dispatch) => {
    return APIUtil.getTodos().then((todos) => dispatch(receiveTodos(todos)));
  };
};

export const createTodo = (todo) => (
  dispatch => (
    APIUtil.createTodo(todo).then(
      dbTodo => dispatch(receiveTodo(dbTodo)),
      err => {
        return dispatch(receiveErrors(err.responseJSON));
      }
    )
  )
);

window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.removeTodo = removeTodo;
window.fetchTodos = fetchTodos;
