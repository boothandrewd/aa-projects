const APIUtil = require('./api_util.js');

function UsersSearch(el) {
  this.$el = $(el);
  this.input = this.$el.find('input.search-input');
  this.ul = this.$el.find('ul.users');

  this.input.change(this.handleInput.bind(this));
}

UsersSearch.prototype.handleInput = function(event) {
  console.log(this.input.val());
  // APIUtil.searchUsers(this.input.val(), data => {
  //   console.log(data);
  // });
};

module.exports = UsersSearch;
