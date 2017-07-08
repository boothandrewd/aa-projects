import React from 'react';

class Clock extends React.Component{
  constructor(props){
    super(props);
    this.state = {Time: new Date()};

    this.tick = this.tick.bind(this);
  }

  render(){
    return (
      <div>
          <h1>More Awesome Clock Title LOL</h1>
        <nav>
          <p>Time: </p>
          <p>{this.state.Time.getHours()}:
            {this.state.Time.getMinutes()}:
            {this.state.Time.getSeconds()}</p>
        </nav>
        <nav>
          <p>Date: </p>
          <p>{this.state.Time.getMonth()}-
            {this.state.Time.getDay()}-
            {this.state.Time.getFullYear().toString().slice(2)}</p>
        </nav>
      </div>
    );
  }

  tick(){
    this.setState({Time: new Date()});
  }

  componentDidMount(){
    this.intervalId = setInterval(this.tick, 1000);
  }

  componentWillUnmount(){
    clearInterval(this.intervalId);
  }
}

export default Clock;
