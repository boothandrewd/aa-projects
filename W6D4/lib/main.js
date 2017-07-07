let DOMNodeCollection = require('./dom_node_collection.js');

window.$l = function (arg) {
  if (typeof arg === 'string') {
    let selectedNodeList = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(selectedNodeList));
  } else if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  }
}
