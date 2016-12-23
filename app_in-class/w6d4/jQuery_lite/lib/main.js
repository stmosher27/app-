const DomNodeCollection = require('./dom_node_collection.js');

window.$l = arg => {
  if (arg instanceof HTMLElement) return new DomNodeCollection([arg]);
};
