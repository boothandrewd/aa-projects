import { RECEIVE_POKEMON } from '../actions/pokemon_actions';

const ItemsReducer = (state = [], action) => {
  Object.freeze(state);

  // console.log(state);
  // console.log(action.pokemonInfo.items);

  switch (action.type) {
    case RECEIVE_POKEMON:
      return action.pokemonInfo.items;

    default:
      return state;
  }
};

export default ItemsReducer;
