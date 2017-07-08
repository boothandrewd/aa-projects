import React from 'react';
import ReactDOM from 'react-dom';
import App from './app';

document.addEventListener("DOMContentLoaded", () => {
	let nameList = [
		'Andrew',
		'Howie?',
		'Dan',
		'Li Hsaun',
		'Ade',
		'Chris'
	];

	const root = document.getElementById("root");
	ReactDOM.render(<App names={nameList}/>, root);
});
