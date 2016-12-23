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
