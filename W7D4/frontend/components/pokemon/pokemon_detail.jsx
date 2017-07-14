import React from 'react';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);

    // console.log(props);

    // this.props.requestSinglePokemon = this.props.requestSinglePokemon.bind(this);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    console.log(this.props.currentPoke.id);
    console.log(newProps.match.params.pokemonId);
    if (this.props.currentPoke.id !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render() {
    const pokemon = this.props.currentPoke;
    const items = this.props.items;

    // console.log(this.props);
    // console.log(pokemon);
    // console.log(items);

    // console.log(pokemon);

    return (
      <div>
        <img src={pokemon.image_url} alt={pokemon.name} />
        {pokemon.name}
      </div>
    );
  }
}

export default PokemonDetail;
