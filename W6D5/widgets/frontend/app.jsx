import React from 'react';
// import ReactDOM from 'react-dom';
import Clock from './clock';
import Weather from './weather';
import Autocomplete from './autocomplete';

class App extends React.Component{
  constructor(props) {
    super(props);
  }

  render(){
    return (
      <div>
        <Clock/>
        <Weather/>
        <Autocomplete names={this.props.names}/>
      </div>
    );
  }
  }

export default App;
