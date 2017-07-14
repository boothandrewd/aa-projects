export const fetchAllPokemon = () => (
  $.ajax({
    type: 'GET',
    url: 'api/pokemon'
  })
);

export const fetchPokemon = (id) => (
  $.ajax({
    type: 'GET',
    url: `api/pokemon/${id}`
  })
);
