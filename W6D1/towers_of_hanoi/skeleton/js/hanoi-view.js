class HanoiView {
  constructor (hanoiGame, $el) {
    this.game = hanoiGame;
    this.$el = $el;
    this.discClasses = ['little', 'medium', 'big'];
    this.firstClicked = null;

    this.setupTowers();
    this.clickTower();
    this.render();
  }

  setupTowers () {
    for (let i = 0; i < 3; i++) {
      this.$el.append(`<ul data-tower="${i}"></ul>`);
    }
    this.$el.find('ul').each ((idx, el)=> {
      for (let j = 0; j < 3; j++) {
        $(el).append('<li class="space"></li>');
      }
    });
  }

  render () {
    this.$el.find('li').attr('class', '');
    this.$el.find('li').addClass('space');

    this.game.towers.forEach((tower, idx)=> {
      tower.forEach((space, idx2) => {
        this.$el.find('ul').eq(idx).find('li').
        eq(2-idx2).addClass(this.discClasses[space -1]);
      });
    });
  }

  clickTower () {
    this.$el.find('ul').click(event => {
      event.preventDefault();
      if (this.firstClicked === null) {
        this.firstClicked = parseInt($(event.currentTarget).data('tower'));
      } else {
        let tower1Idx = this.firstClicked;
        this.firstClicked = null;

        let tower2Idx = parseInt($(event.currentTarget).data('tower'));

        if (!this.game.move(tower1Idx, tower2Idx)) {
          alert('Invalid move');
        }
        this.render();

        if (this.game.isWon()) {
          alert('You win!');
        }
      }
    });
  }
}

module.exports = HanoiView;
