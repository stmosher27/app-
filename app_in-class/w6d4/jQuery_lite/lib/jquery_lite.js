/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const DomNodeCollection = __webpack_require__(1);

	window.$l = arg => {
	  if (arg instanceof HTMLElement) return new DomNodeCollection([arg]);
	};


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DomNodeCollection {
	  constructor(nodes) {
	    this.nodes = nodes;
	  }

	  html(html) {
	    if (typeof(html) === 'string') {
	      this.each(node => {
	        node.innerHTML = html;
	      });
	    } else {
	      if (this.nodes.length > 0) {
	        return this.nodes[0].innerHTML;
	      }
	    }
	  }

	  empty() {
	    this.html('');
	  }

	  append(children) {
	    if (this.nodes.length === 0) return;

	    if (typeof(children) === 'object' && !(children instanceof DomNodeCollection)) {
	      children = $l(children);
	    }

	    if (typeof(children) === 'string') {
	      this.each(node => {
	        node.innerHTML += children;
	      });
	    } else if (children instanceof DomNodeCollection) {
	      this.each(node => {
	        children.each(childNode => {
	          node.appendChild(childNode.cloneNode(true));
	        });
	      });
	    }
	  }

	  remove() {
	    this.each(node => node.parentNode.removeChild(node));
	  }
	}




	module.exports = DomNodeCollection;


/***/ }
/******/ ]);