import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import * as APIUtil from './util/api_util';
import { receivePokemon, requestSinglePokemon } from './actions/pokemon_actions';

document.addEventListener("DOMContentLoaded", () => {
  let store = configureStore();
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);

  window.APIUtil = APIUtil;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.receivePokemon = receivePokemon;
  window.requestSinglePokemon = requestSinglePokemon;
});
