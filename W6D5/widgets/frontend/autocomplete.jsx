import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);


  }

  render() {
    console.log(this.props);
    return (
      <div>
        <h1>More Awesomest Kind Of People LOL</h1>
      <nav>
        <ul>
          {
            this.props.names.map((el, idx) => <li key={idx}>{el}</li>)
          }
        </ul>
      </nav>
    </div>
    );
  }
}

export default Autocomplete;
