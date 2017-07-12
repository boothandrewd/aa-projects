const thunkMiddleware = ({dispatch, getState}) => next => action => {
  if (typeof action === "function") return action(dispatch, getState);
  return next(action);
};

export default thunkMiddleware;

// const loggingMiddleware = ({getState}) => next => action => {
//   console.log(getState());
//
//   next(action);
//
//   console.log(getState());
// };
//
// function applyMiddleware(store, ...middlewares) {
//   let dispatch = store.dispatch;
//
//   middlewares.forEach(middleware => {
//     dispatch = middleware(store)(dispatch);
//   });
//
//   dispatch({type: 'blah lbah', payload: 'words'});
//
//   return 'stuff';
// }
//
// applyMiddleware(store, thunkMiddleware, loggingMiddleware);
