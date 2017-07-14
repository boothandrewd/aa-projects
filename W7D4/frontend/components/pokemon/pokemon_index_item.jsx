import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({ pokemon }) => (
  <li>
    <Link to={`/pokemon/${pokemon.id}`}>
      {pokemon.name}
      <img src={pokemon.image_url} height="43" width="43" />
    </Link>
  </li>
);

export default PokemonIndexItem;
