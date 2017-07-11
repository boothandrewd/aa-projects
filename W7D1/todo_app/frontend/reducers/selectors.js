import values from 'lodash/values';

const allTodos = state => values(state.todos);

export default allTodos;
