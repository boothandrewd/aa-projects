/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor (htmlElements) {
    this.htmlElements = htmlElements;
  }

  html (arg) {
    if (arg) {
      this.htmlElements.forEach((el) => {
        el.innerHTML = arg;
      });
    } else {
      return this.htmlElements[0].innerHTML;
    }
  }

  empty () {
    this.htmlElements.forEach((el) => {
      el.innerHTML = '';
    });
  }

  forEach (cb) {
    this.htmlElements.forEach(cb);
  }

  append (arg) {
    this.htmlElements.reverse().forEach((el) => {
      if (typeof arg === 'string') {
        el.innerHTML += arg;

      } else if (arg instanceof HTMLElement) {
        el.innerHTML += arg.outerHTML;

      } else {
        arg.forEach(htmlElement => {
          el.appendChild(htmlElement.outerHTML);
        });
      }
    });
  }

  attr (attrName, attrValue) {
    if (attrValue) {
      this.forEach((el) => {
        el.setAttribute(attrName, attrValue);
      });
    } else {
      return this.htmlElements[0].getAttribute(attrName);
    }
  }

  addClass (className) {
    this.forEach((el) => {
      el.classList.add(className);
    });
  }

  removeClass (className) {
    this.forEach((el) => {
      el.classList.remove(className);
    });
  }

  children () {
    let childrenArray = [];

    this.forEach((el) => {
      // return new DOMNodeCollection(Array.from(el.children));
      childrenArray = childrenArray.concat(Array.from(el.children));
    });

    return new DOMNodeCollection(childrenArray);
  }

  parent () {
    let babyDaddyAndMommyArray = []
    this.forEach((el) => {
      babyDaddyAndMommyArray.push(el.parentElement)
    });
    return new DOMNodeCollection(babyDaddyAndMommyArray);
  }

  find (selectors) {
    let longLostNodes = []
    this.forEach((el) => {
      longLostNodes.concat(Array.from(el.querySelectorAll(selectors)));
    });
    return new DOMNodeCollection(longLostNodes)
  }


}

module.exports = DOMNodeCollection;


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

let DOMNodeCollection = __webpack_require__(0);

window.$l = function (arg) {
  if (typeof arg === 'string') {
    let selectedNodeList = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(selectedNodeList));
  } else if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  }
}


/***/ })
/******/ ]);