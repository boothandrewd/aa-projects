import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { selectCurrentPokemon } from '../../reducers/selectors';
import { requestSinglePokemon } from '../../actions/pokemon_actions';

const mapStateToProps = (state) => {
  console.log(state);
  let ret =  {
    currentPoke: selectCurrentPokemon(state),
    items: state.items
  };

  console.log(ret);

  return ret;

};

const mapDispatchToProps = (dispatch) => ({
  requestSinglePokemon: id => dispatch(requestSinglePokemon(id))
});

export default connect (
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
