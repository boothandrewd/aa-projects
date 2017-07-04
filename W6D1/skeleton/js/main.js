const View = require('./ttt-view.js'); // require appropriate file
const Game = require('/Users/appacademy/Desktop/W6D1/solution/game.js'); // require appropriate file

$( () => {
  const game = new Game();
  const container = $('figure.ttt');
  const view = new View(game, container);
  view.setupBoard();
  view.bindEvents();
});
