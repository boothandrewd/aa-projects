class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  }

  bindEvents() {
    const $li = this.$el.find('li');
    $li.click((event)=> {
      this.makeMove($(event.currentTarget))
    });
  }

  makeMove($square) {
    let currentPlayerMark = this.game.currentPlayer;
    let pos = $square.data('pos').split(',').map((el) => parseInt(el));
    try {
      this.game.playMove(pos);
      $square.text(currentPlayerMark);
      $square.addClass(`${currentPlayerMark}-mark`);
    } catch (e) {
       alert("Invalid move");
    }

    if (this.game.isOver()) {
      alert(`${this.game.winner()} wins!`);
    }
  }

  setupBoard() {
    this.$el.append('<ul></ul>');
    const $ul = this.$el.find('ul');

    for (var i = 0; i < 9; i++) {
      $ul.append(`<li data-pos = '${Math.floor(i/3)}, ${i%3}'></li>`);

    }
  }
}

module.exports = View;
