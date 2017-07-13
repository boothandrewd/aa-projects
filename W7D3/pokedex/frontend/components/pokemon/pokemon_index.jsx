import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    let pokemon = this.props.pokemon;

    return (
      <div>
        <ul>
          {
            pokemon.map(poke => (
              <li key={poke.id}>
                {poke.name}
              <br/>
                <img src={poke.image_url} height="43" width="43"/>
              </li>
            ))
          }
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;
