import React from 'react';

class Weather extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      location: '',
      temp: 0
    };

    this.getLocation = this.getLocation.bind(this);
  }

  render(){
    return (
      <div>
          <h1>More Awesome Whether Title LOL</h1>
        <nav>
          <p>{this.state.location}</p>
        </nav>
        <nav>
          <p>{this.state.temp}°F</p>
        </nav>
      </div>
    );
  }

  getLocation(res){
    let lat = res.coords.latitude;
    let lon = res.coords.longitude;

    let xhr = new XMLHttpRequest();
    xhr.onload = () => {
      let data = JSON.parse(xhr.responseText);
      this.setState({
        temp: Math.floor(data.main.temp * 9/5 - 459.67),
        location: data.name
      });
    };
    xhr.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=23600fbc7830619f867fd0894063b8e1`);
    xhr.responseType = 'text';
    xhr.send();
  }

  componentDidMount(){
    navigator.geolocation.getCurrentPosition(res => {
      this.getLocation(res);
    });
  }
// key : "23600fbc7830619f867fd0894063b8e1"
  // componentWillUnmount(){
  // }

}

export default Weather;
