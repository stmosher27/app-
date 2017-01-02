
import React from 'react';
import ReactDOM from 'react-dom';
import Congrats from './congrats';
import Calculator from './calculator';

document.addEventListener("DOMContentLoaded", () => {
	const main = document.getElementById("main");
	ReactDOM.render(<Calculator/>, main);
});
