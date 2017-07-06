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
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UsersSearch = __webpack_require__(3);

$(() => {
  $('button.follow-toggle').each((idx, el) => {
    new FollowToggle(el);
  });

  $('nav.users-search').each((idx, el) => {
    console.log(idx, el);
    new UsersSearch(el);
  });
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'POST',
      dataType: 'json'
    });
  },

  unfollowUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      type: 'DELETE',
      dataType: 'json'
    });
  },

  searchUsers: (queryVal, success) => {
    return $.ajax({
      url: '/users/search',
      type: 'GET',
      data: { query: queryVal },
      dataType: 'json',
      success: success
    });
  }
};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map