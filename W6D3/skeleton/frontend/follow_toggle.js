const APIUtil = require('./api_util.js');

function FollowToggle (el) {
  this.$el = $(el);
  this.userId = this.$el.data('user-id');
  this.followState = this.$el.data('initial-follow-state');
  this.render();

  this.$el.click(this.handleClick.bind(this));
}

FollowToggle.prototype.render = function () {
  switch (this.followState) {
    case 'unfollowed':
      this.$el.prop("disabled", false);
      this.$el.text("Follow!");
      break;
    case 'followed':
      this.$el.prop("disabled", false);
      this.$el.text("Unfollow!");
      break;
    case 'unfollowing':
      this.$el.prop("disabled", true);
      break;
    case 'following':
      this.$el.prop("disabled", true);
      break;
    default:

  }
  if (this.followState === "unfollowed") {
    this.$el.text("Follow!");
  } else {
    this.$el.text("Unfollow!");
  }
};

FollowToggle.prototype.handleClick = function (event) {
  event.preventDefault();
  console.log(this);
  if (this.followState === 'followed') {
    let ajaxPromise = APIUtil.unfollowUser(this.userId);
    this.followState = 'unfollowing';
    this.render();
    ajaxPromise.then(() => {
      this.followState = 'unfollowed';
      this.render();
    });
  }
  else {
    let ajaxPromise = APIUtil.followUser(this.userId);
    this.followState = 'following';
    this.render();
    ajaxPromise.then(() => {
      this.followState = 'followed';
      this.render();
    });
  }



  // let method = this.followState === 'unfollowed' ? 'POST' : 'DELETE';
  //
  // jQuery.ajax({
  //   url: `/users/${this.userId}/follow`,
  //   type: method,
  //   dataType: 'json',
  //   success: () => {
  //     this.followState = this.followState === 'unfollowed' ? 'followed' : 'unfollowed';
  //     this.render();
  //   },
  // });
};

module.exports = FollowToggle;
