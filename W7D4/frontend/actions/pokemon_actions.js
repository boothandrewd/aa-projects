import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const REQUEST_ALL_POKEMON = 'REQUEST_ALL_POKEMON';
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  entities: pokemon
});

export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const receivePokemon = pokemonInfo => ({
  type: RECEIVE_POKEMON,
  pokemonInfo
});

export const requestSinglePokemon = (id) => (dispatch) => (
  APIUtil.fetchPokemon(id).then(pokemonInfo => {
    // console.log(pokemonInfo);
    return dispatch(receivePokemon(pokemonInfo));
  })
);
