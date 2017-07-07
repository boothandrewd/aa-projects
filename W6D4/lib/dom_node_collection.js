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
