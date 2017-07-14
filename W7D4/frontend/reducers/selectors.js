import values from 'lodash/values';

export const selectAllPokemon = ({ pokemon }) => {
  return values(pokemon.entities);
};

export const selectCurrentPokemon = (state) => {
  return state.pokemon.entities[state.currentPoke];
};
