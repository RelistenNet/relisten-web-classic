this["JST"] = this["JST"] || {};

this["JST"]["footer"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "";


  return buffer;
  });

this["JST"]["header"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, self=this;

function program1(depth0,data) {
  
  
  return "\n    <li><a class=\"header-link\" href=\"/logout\">LOGOUT</a></li>\n  ";
  }

function program3(depth0,data) {
  
  
  return "\n    <li><a class=\"login header-link\" href=\"/login\">LOGIN</a></li>\n    <li><a class=\"register header-link\" href=\"/register\">REGISTER</a></li>\n  ";
  }

  buffer += "<ul class=\"left\">\n  <li class=\"home-container\"><a class=\"home\" href=\"/\">Ghost<span>.phish</span></a></li>\n</ul>\n\n<ul class=\"right\">\n  ";
  stack1 = helpers['if'].call(depth0, depth0.loggedIn, {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</ul>\n";
  return buffer;
  });

this["JST"]["home"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=row-fluid>\n  <div class=\"span4 years-container\">\n  </div>\n\n  <div class=\"span4 shows-container\">\n  </div>\n\n  <div class=\"span4 songs-container\">\n  </div>\n</div>";
  });

this["JST"]["login"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<form action=\"/login\" method=\"post\">\n  <input type=hidden value=";
  if (stack1 = helpers.csrf) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.csrf; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " name=_csrf />\n  <div>\n    <label for=email>Email:</label>\n    <input class=email type=\"text\" placeholder=\"Email\" name=\"email\"/>\n  </div>\n  <div>\n    <label for=password>Password:</label>\n    <input class=password type=\"password\" placeholder=\"Password\" name=\"password\"/>\n  </div>\n  <div class=forbutton>\n    <input type=\"submit\" value=\"Login\"/>\n  </div>\n</form>\n";
  return buffer;
  });

this["JST"]["notification"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "<img src=";
  if (stack1 = helpers.img) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.img; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " alt='' />";
  return buffer;
  }

  buffer += "<div>\n  <a>×</a>\n  ";
  stack1 = helpers['if'].call(depth0, depth0.img, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n  <h3>";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</h3>\n  <p>";
  if (stack1 = helpers.message) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.message; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</p>\n</div>";
  return buffer;
  });

this["JST"]["player"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "<div class=player>\n  <div class=buttons>\n    <div class=last><i class=icon-step-backward></i></div>\n    <div class=pause><i class=icon-pause></i></div>\n    <div class=play><i class=icon-play></i></div>\n    <div class=next><i class=icon-step-forward></i></div>\n    <h3 class=title></h3>\n    <h4 class=album></h4>\n    <div class=progress-bar></div>\n  </div>\n</div>\n";
  });

this["JST"]["register"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "<form action=\"/register\" method=\"post\">\n  <input type=hidden value=\"";
  if (stack1 = helpers.csrf) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.csrf; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\" name=\"_csrf\" />\n  <div>\n    <label for=email>Email:</label>\n    <input class=email type=\"text\" placeholder=\"Email\" name=\"email\"/>\n    <div class=invalid>✘</div>\n  </div>\n  <div>\n    <label for=password>Password:</label>\n    <input class=password type=\"password\" placeholder=\"Password\" name=\"password\"/>\n    <div class=invalid>✘</div>\n  </div>\n  <div class=forbutton>\n    <sup>Password must be at least 6 characters</sup>\n    <br>\n    <input type=\"submit\" value=\"Register\"/>\n  </div>\n</form>\n";
  return buffer;
  });

this["JST"]["shows"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n  <li>\n    <a href=\"/show/";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a>\n  </li>\n";
  return buffer;
  }

  buffer += "<div class=ul-header>"
    + escapeExpression(((stack1 = ((stack1 = depth0.shows),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n<ul>\n";
  stack2 = helpers.each.call(depth0, ((stack1 = depth0.shows),stack1 == null || stack1 === false ? stack1 : stack1.children), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n</ul>\n";
  return buffer;
  });

this["JST"]["songs"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n  <li>\n    <a href=\"/song/";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a>\n  </li>\n";
  return buffer;
  }

  buffer += "<div class=ul-header>"
    + escapeExpression(((stack1 = ((stack1 = depth0.songs),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n<ul>\n";
  stack2 = helpers.each.call(depth0, ((stack1 = depth0.songs),stack1 == null || stack1 === false ? stack1 : stack1.children), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n</ul>\n";
  return buffer;
  });

this["JST"]["years"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n  <li>\n    <a href=\"/year/";
  if (stack1 = helpers.id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a>\n  </li>\n";
  return buffer;
  }

  buffer += "<div class=ul-header>Choose a year</div>\n<ul>\n";
  stack2 = helpers.each.call(depth0, ((stack1 = depth0.years),stack1 == null || stack1 === false ? stack1 : stack1.children), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n</ul>";
  return buffer;
  });
var resize;

window.App = {
  "Models": {},
  "Collections": {},
  "Views": {},
  "Controllers": {},
  "Router": {},
  "utils": {}
};

$(function() {
  var Tweezer;

  $.getJSON('/api/v1/me/csrf', function(data) {
    return App.csrf = data.csrf;
  });
  Tweezer = new Application().initialize();
  return $(window).resize(resize);
});

resize = function() {
  return $('.home-page .row-fluid').height($(window).height() - 100);
};

var Application;

Application = (function() {
  function Application() {}

  Application.prototype.title = 'Tweezer';

  Application.prototype.initialize = function() {
    App.user = new App.Models.User(user);
    if (window.csrf) {
      App.csrf = csrf;
    }
    this.initViews();
    App.router = new App.Router();
    Backbone.history.start({
      pushState: true
    });
    return this.pushAnchors();
  };

  Application.prototype.initViews = function() {
    App.notify = new App.Views.Notifications();
    this.header = new App.Views.Header();
    this.footer = new App.Views.Footer();
    App.player = new App.Models.Player();
    return App.playerView = new App.Views.Player();
  };

  Application.prototype.pushAnchors = function() {
    return $(document).on("click", "a[href^='/']", function(event) {
      var href, passThrough, url;

      href = $(event.currentTarget).attr('href');
      passThrough = /logout|auth/.test(href);
      if (!passThrough && !event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey) {
        event.preventDefault();
        url = href.replace(/^\//, '').replace('\#\!\/', '');
        App.router.navigate(url, {
          trigger: true
        });
        return false;
      }
    });
  };

  return Application;

})();

var _ref,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Router = (function(_super) {
  __extends(Router, _super);

  function Router() {
    this.changeView = __bind(this.changeView, this);    _ref = Router.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Router.prototype.routes = {
    '': 'index',
    'login': 'login',
    'register': 'register',
    'year/:id': 'year',
    'show/:id': 'show',
    'song/:id': 'song',
    ':notFound': 'notFound'
  };

  Router.prototype.initialize = function() {
    this.$container = $('#page-container');
    return this.bind('all', this._trackPageview);
  };

  Router.prototype.index = function() {
    this.changeView(new App.Views.HomePage());
    App.years = new App.Views.Years();
    App.shows = new App.Views.Shows();
    return App.songs = new App.Views.Songs();
  };

  Router.prototype.year = function(id) {
    return App.shows = new App.Views.Shows({
      folder: id
    });
  };

  Router.prototype.show = function(id) {
    return App.songs = new App.Views.Songs({
      folder: id
    });
  };

  Router.prototype.login = function() {
    return this.changeView(new App.Views.LoginPage());
  };

  Router.prototype.song = function(id) {
    return App.player.play(id);
  };

  Router.prototype.register = function() {
    return this.changeView(new App.Views.RegisterPage());
  };

  Router.prototype.clearActive = function($current) {
    $('header ul.right a').removeClass('active');
    if ($current) {
      return $current.addClass('active');
    }
  };

  Router.prototype.changeView = function(view, render) {
    if (render == null) {
      render = true;
    }
    this.$container.hide();
    if (this.currentView) {
      this.currentView.close();
    }
    if (render) {
      view.render();
    }
    this.currentView = view;
    return this.$container.html(view.el).fadeIn('fast');
  };

  Router.prototype.notFound = function() {
    return this.navigate('/', {
      trigger: true
    });
  };

  Router.prototype._trackPageview = function() {
    var url;

    url = Backbone.history.getFragment();
    return _gaq.push(['_trackPageview', "/" + url]);
  };

  return Router;

})(Backbone.Router);

var cookie, createCookie, deleteCookie, readCookie;

cookie = function(name, value, days) {
  if (value) {
    return createCookie(name, value, days);
  } else {
    return readCookie(name);
  }
};

createCookie = function(name, value, days) {
  var date, expires;

  if (days == null) {
    days = 7;
  }
  if (days) {
    date = new Date();
    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    expires = "; expires=" + date.toGMTString();
  } else {
    expires = "";
  }
  return document.cookie = name + "=" + value + expires + "; path=/";
};

readCookie = function(name) {
  var c, ca, nameEQ, result, _i, _len;

  nameEQ = name + "=";
  ca = document.cookie.split(';');
  for (_i = 0, _len = ca.length; _i < _len; _i++) {
    c = ca[_i];
    while (c.charAt(0) === ' ') {
      c = c.substring(1, c.length);
    }
    if (c.indexOf(nameEQ) === 0) {
      result = c.substring(nameEQ.length, c.length);
    }
  }
  return result;
};

deleteCookie = function(name) {
  return createCookie(name, "", -1);
};

App.utils.cookie = {
  cookie: cookie,
  createCookie: createCookie,
  readCookie: readCookie,
  deleteCookie: deleteCookie
};

$.fn.getCursorPosition = function() {
  var input, sel, selLen;

  input = this.get(0);
  if (!input) {
    return;
  }
  if ("selectionStart" in input) {
    return input.selectionStart;
  } else if (document.selection) {
    input.focus();
    sel = document.selection.createRange();
    selLen = document.selection.createRange().text.length;
    sel.moveStart("character", -input.value.length);
    return sel.text.length - selLen;
  }
};

$.fn.setCursorPosition = function(pos) {
  var range;

  if ($(this).get(0).setSelectionRange) {
    return $(this).get(0).setSelectionRange(pos, pos);
  } else if ($(this).get(0).createTextRange) {
    range = $(this).get(0).createTextRange();
    range.collapse(true);
    range.moveEnd("character", pos);
    range.moveStart("character", pos);
    return range.select();
  }
};

$.fn.setCursorRange = function(start, end) {
  return this.each(function() {
    var range;

    if (this.setSelectionRange) {
      this.focus();
      return this.setSelectionRange(start, end);
    } else if (this.createTextRange) {
      range = this.createTextRange();
      range.collapse(true);
      range.moveEnd("character", end);
      range.moveStart("character", start);
      return range.select();
    }
  });
};

App.utils.getURLParameters = function(url) {
  var obj;

  obj = {};
  _.each(url.split('?')[1].split('&'), function(param) {
    var split;

    split = param.split('=');
    return obj[split[0]] = split[1];
  });
  return obj;
};

var EMAIL_REGEX, validateEmail;

EMAIL_REGEX = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/i;

validateEmail = function(email) {
  return EMAIL_REGEX.test(email);
};

App.utils.validate = {
  validateEmail: validateEmail
};

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Models.Model = (function(_super) {
  __extends(Model, _super);

  function Model() {
    _ref = Model.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  return Model;

})(Backbone.Model);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Models.Folder = (function(_super) {
  __extends(Folder, _super);

  function Folder() {
    _ref = Folder.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Folder.prototype.url = function() {
    return '/api/v1/folder/' + this.get('id');
  };

  return Folder;

})(App.Models.Model);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Models.Player = (function(_super) {
  __extends(Player, _super);

  function Player() {
    _ref = Player.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Player.prototype.localStorage = new Backbone.LocalStorage("NowPlaying");

  Player.prototype.play = function(id) {
    if (this.get('id')) {
      soundManager.stop(this.get('id'));
    }
    this.set('id', id);
    App.playerView.played.push(id);
    this.sound = soundManager.createSound({
      id: "" + id,
      url: "http://74.104.117.66:8044/stream?player=74&id=" + id
    });
    this.sound.play({
      whileloading: function() {
        return App.playerView.updateProgress(this.bytesLoaded, this.bytesTotal);
      }
    });
    return App.player.updateText();
  };

  Player.prototype.updateText = function() {
    var id,
      _this = this;

    id = this.get('id');
    if (id) {
      return $.getJSON("/api/v1/song/" + id, function(song) {
        return App.playerView.updateText(song.entry.title, song.entry.album);
      });
    }
  };

  return Player;

})(App.Models.Model);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Models.User = (function(_super) {
  __extends(User, _super);

  function User() {
    _ref = User.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  User.prototype.url = '/api/v1/me';

  User.prototype.loggedIn = function() {
    return !!this.get('email');
  };

  User.prototype.reset = function() {
    if (this.loggedIn()) {
      return App.router.navigate('/', {
        trigger: true
      });
    }
  };

  return User;

})(App.Models.Model);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Collections.Collection = (function(_super) {
  __extends(Collection, _super);

  function Collection() {
    _ref = Collection.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  return Collection;

})(Backbone.Collection);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Collections.Folder = (function(_super) {
  __extends(Folder, _super);

  function Folder() {
    _ref = Folder.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Folder.prototype.url = '/api/v1/phish';

  Folder.prototype.initialize = function() {
    return this.add(phish);
  };

  return Folder;

})(App.Collections.Collection);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Collections.Folder = (function(_super) {
  __extends(Folder, _super);

  function Folder() {
    _ref = Folder.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Folder.prototype.url = function() {
    return '/api/v1/folder/' + this.get('id');
  };

  return Folder;

})(App.Collections.Collection);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.View = (function(_super) {
  __extends(View, _super);

  function View() {
    _ref = View.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  View.prototype.initialize = function() {
    if (this.autoRender) {
      return this.render();
    }
  };

  View.prototype.render = function() {
    if (this.$el && this.template) {
      return this.$el.html(this.template());
    }
  };

  View.prototype.close = function() {
    this.remove();
    return this.unbind();
  };

  return View;

})(Backbone.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Footer = (function(_super) {
  __extends(Footer, _super);

  function Footer() {
    _ref = Footer.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Footer.prototype.autoRender = true;

  Footer.prototype.el = 'footer';

  Footer.prototype.template = JST['footer'];

  return Footer;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Header = (function(_super) {
  __extends(Header, _super);

  function Header() {
    _ref = Header.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Header.prototype.autoRender = true;

  Header.prototype.el = 'header';

  Header.prototype.template = JST['header'];

  Header.prototype.initialize = function() {
    return Header.__super__.initialize.apply(this, arguments);
  };

  Header.prototype.render = function() {
    return this.$el.html(this.template({
      loggedIn: App.user.loggedIn()
    }));
  };

  return Header;

})(App.Views.View);

var _ref,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.HomePage = (function(_super) {
  __extends(HomePage, _super);

  function HomePage() {
    this.render = __bind(this.render, this);    _ref = HomePage.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  HomePage.prototype.className = 'home-page';

  HomePage.prototype.template = JST['home'];

  HomePage.prototype.render = function() {
    this.checkErr();
    App.router.clearActive();
    this.$el.html(this.template({
      loggedIn: App.user.loggedIn()
    }));
    _.defer(function() {
      return resize();
    });
    return this;
  };

  HomePage.prototype.checkErr = function() {
    var params;

    if (window.location.search) {
      params = App.utils.getURLParameters(window.location.search);
      switch (params.err) {
        case "maxProviders":
          return App.notify.send('Error', "This is how you send an error notification.", false, 4000);
      }
    }
  };

  return HomePage;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.LoginPage = (function(_super) {
  __extends(LoginPage, _super);

  function LoginPage() {
    _ref = LoginPage.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  LoginPage.prototype.className = 'login-page';

  LoginPage.prototype.template = JST['login'];

  LoginPage.prototype.render = function() {
    this.checkErr();
    this.$el.html(this.template({
      csrf: App.csrf
    }));
    return App.router.clearActive($('header .login'));
  };

  LoginPage.prototype.checkErr = function() {
    var params;

    if (window.location.search) {
      params = App.utils.getURLParameters(window.location.search);
      switch (params.err) {
        case "0":
          return App.notify.send('Error', "No User Found", false, 4000);
        case "1":
          return App.notify.send('Error', "Password Incorrect", false, 4000);
        case "2":
          return App.notify.send('Error', "Logged in too many times, try again later.", false, 4000);
      }
    }
  };

  return LoginPage;

})(App.Views.View);

var _ref, _ref1,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Notification = (function(_super) {
  __extends(Notification, _super);

  function Notification() {
    this.close = __bind(this.close, this);    _ref = Notification.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Notification.prototype.autoRender = true;

  Notification.prototype.tagName = "li";

  Notification.prototype.events = {
    "click a": "close"
  };

  Notification.prototype.template = JST['notification'];

  Notification.prototype.initialize = function(_arg) {
    this.message = _arg.message, this.title = _arg.title, this.type = _arg.type, this.sticky = _arg.sticky, this.time = _arg.time, this.img = _arg.img;
    Notification.__super__.initialize.apply(this, arguments);
    return this;
  };

  Notification.prototype.render = function() {
    this.$el.hide().html(this.template({
      message: this.message,
      title: this.title,
      img: this.img
    })).addClass(this.type).show().attr("data-view", "App.Views.Notification");
    if (!this.sticky) {
      setTimeout(this.close, this.time);
    }
    return this;
  };

  Notification.prototype.close = function() {
    return $(this.el).slideUp("slow");
  };

  return Notification;

})(App.Views.View);

App.Views.Notifications = (function(_super) {
  __extends(Notifications, _super);

  function Notifications() {
    this.send = __bind(this.send, this);    _ref1 = Notifications.__super__.constructor.apply(this, arguments);
    return _ref1;
  }

  Notifications.prototype.el = '#notifications';

  Notifications.prototype.send = function(title, message, sticky, time, img) {
    var notificationEl, type;

    if (sticky == null) {
      sticky = false;
    }
    if (time == null) {
      time = 3000;
    }
    type = "notify";
    notificationEl = new App.Views.Notification({
      title: title,
      message: message,
      type: type,
      sticky: sticky,
      time: time,
      img: img
    }).el;
    this.$el.append(notificationEl);
    return notificationEl;
  };

  Notifications.prototype.render = function() {
    this.$el.attr("data-view", "App.Views.Notifications");
    return this;
  };

  return Notifications;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Player = (function(_super) {
  __extends(Player, _super);

  function Player() {
    _ref = Player.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Player.prototype.el = '.player-container';

  Player.prototype.template = JST['player'];

  Player.prototype.played = [];

  Player.prototype.events = {
    'click .pause': 'pause',
    'click .play': 'playButton',
    'click .next': 'playNext',
    'click .last': 'last'
  };

  Player.prototype.initialize = function() {
    var _this = this;

    return soundManager.setup({
      url: "/swf",
      useHTML5Audio: true,
      onready: function() {
        return _this.render();
      }
    });
  };

  Player.prototype.render = function() {
    this.$el.html(this.template());
    App.player.updateText();
    return this.$progress = this.$el.find('.progress-bar');
  };

  Player.prototype.updateText = function(title, album) {
    this.$el.find('h3').html(title);
    return this.$el.find('h4').html(album);
  };

  Player.prototype.pause = function() {
    return soundManager.pause(App.player.get('id'));
  };

  Player.prototype.playButton = function() {
    var id;

    id = App.player.get('id');
    if (this.played.indexOf(id >= 0)) {
      return soundManager.resume(id);
    }
    return App.player.play(id);
  };

  Player.prototype.playNext = function() {
    return App.player.play(+App.player.get('id') + 1);
  };

  Player.prototype.last = function() {
    return App.player.play(+App.player.get('id') - 1);
  };

  Player.prototype.updateProgress = function(loaded, total) {
    return this.$progress.width("" + ((loaded / total) * 100) + "%");
  };

  return Player;

})(App.Views.View);

var validateEmail, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

validateEmail = App.utils.validate.validateEmail;

App.Views.RegisterPage = (function(_super) {
  __extends(RegisterPage, _super);

  function RegisterPage() {
    _ref = RegisterPage.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  RegisterPage.prototype.className = 'register-page';

  RegisterPage.prototype.template = JST['register'];

  RegisterPage.prototype.events = {
    'keyup input.email': 'email',
    'keyup input.password': 'password'
  };

  RegisterPage.prototype.render = function() {
    var params;

    App.router.clearActive($('header .register'));
    if (window.location.search) {
      params = App.utils.getURLParameters(window.location.search);
      switch (params.err) {
        case 'emailexists':
          App.notify.send('Error', "This email is already in use. But you knew that already, didn't you?");
          break;
        case 'pleaseregister':
          App.notify.send('Please Register', "Or don't. I don't care.");
      }
    }
    this.$el.html(this.template({
      csrf: App.csrf
    }));
    this.$email = this.$el.find('.email');
    this.$password = this.$el.find('.password');
    return this.submitButton = this.$el.find('form input[type="submit"]');
  };

  RegisterPage.prototype.email = function(e) {
    if (!validateEmail(this.$email.val())) {
      this.button(true);
      return this.$email.siblings('.invalid').show();
    }
    this.button();
    return this.$email.siblings('.invalid').hide();
  };

  RegisterPage.prototype.password = function(e) {
    if (this.$password.val().length < 6) {
      this.button(true);
      return this.$password.siblings('.invalid').show();
    }
    this.button();
    return this.$password.siblings('.invalid').hide();
  };

  RegisterPage.prototype.button = function(hide) {
    var disabled;

    disabled = 'disabled';
    if (!hide) {
      disabled = false;
    }
    return this.submitButton.attr('disabled', disabled);
  };

  return RegisterPage;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Shows = (function(_super) {
  __extends(Shows, _super);

  function Shows() {
    _ref = Shows.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Shows.prototype.el = '.shows-container';

  Shows.prototype.template = JST['shows'];

  Shows.prototype.initialize = function() {
    if (this.options.folder) {
      this.folder = new App.Models.Folder({
        id: this.options.folder
      });
      this.listenTo(this.folder, 'change', this.render);
      return this.folder.fetch();
    } else {
      return this.render();
    }
  };

  Shows.prototype.render = function() {
    App.router.clearActive();
    this.$el.html(this.template({
      shows: this.folder ? this.folder.toJSON() : shows
    }));
    return this;
  };

  return Shows;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Songs = (function(_super) {
  __extends(Songs, _super);

  function Songs() {
    _ref = Songs.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Songs.prototype.el = '.songs-container';

  Songs.prototype.template = JST['songs'];

  Songs.prototype.initialize = function() {
    if (!this.options.folder) {
      return this.render();
    }
    this.folder = new App.Models.Folder({
      id: this.options.folder
    });
    this.listenTo(this.folder, 'change', this.render);
    return this.folder.fetch();
  };

  Songs.prototype.render = function() {
    App.router.clearActive();
    this.$el.html(this.template({
      songs: this.folder ? this.folder.toJSON() : songs
    }));
    return this;
  };

  return Songs;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Years = (function(_super) {
  __extends(Years, _super);

  function Years() {
    _ref = Years.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Years.prototype.el = '.years-container';

  Years.prototype.template = JST['years'];

  Years.prototype.initialize = function() {
    if (!this.options.folder) {
      return this.render();
    }
    this.folder = new App.Models.Folder({
      id: this.options.folder
    });
    this.listenTo(this.folder, 'change', this.render);
    return this.folder.fetch();
  };

  Years.prototype.render = function() {
    App.router.clearActive();
    this.$el.html(this.template({
      years: this.folder ? this.folder.toJSON() : years
    }));
    return this;
  };

  return Years;

})(App.Views.View);
