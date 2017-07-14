import merge from 'lodash/merge';
import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_POKEMON
} from '../actions/pokemon_actions';

const defaultState = { entities: {}, currentPoke: 1 };

const pokemonReducer = (state = defaultState, action) => {
  Object.freeze(state);
  const oldState = merge({}, state);
  let newState;

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      newState = merge({}, oldState, { entities: action.entities });
      return newState;

    case RECEIVE_POKEMON:
      // console.log(action);
      const pokemon = action.pokemonInfo.poke;
      const entities = oldState.entities;

      const newEntities = merge({}, entities, { [pokemon.id]: pokemon });

      return {
        currentPoke: pokemon.id,
        entities: newEntities
      };

    default:
      return state;
  }
};

export default pokemonReducer;
