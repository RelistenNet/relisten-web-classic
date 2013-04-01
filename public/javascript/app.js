this["JST"] = this["JST"] || {};

this["JST"]["footer"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  


  return "  <div class=progress-bar></div>\n  <div class=position-bar></div>";
  });

this["JST"]["header"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, self=this;

function program1(depth0,data) {
  
  
  return "\n    <li><a class=\"header-link\" href=\"/logout\">LOGOUT</a></li>\n    <li><a class=\"header-link\" href=\"/playlists\">PLAYLISTS</a></li>\n  ";
  }

function program3(depth0,data) {
  
  
  return "\n    <li><a class=\"login header-link\" href=\"/login\">LOGIN</a></li>\n    <li><a class=\"register header-link\" href=\"/register\">REGISTER</a></li>\n  ";
  }

  buffer += "<ul class=\"left\">\n  <li class=\"home-container\"><a class=\"home\" href=\"/\">Spreadsheet<span>.phish</span></a></li>\n</ul>\n\n<ul class=\"right\">\n  ";
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
  


  return "<div class=player>\n  <div class=buttons>\n    <div class=\"bar bar-left\">\n      <div class=last></div>\n    </div>\n    <div class=pause></div>\n    <div class=\"bar bar-right\">\n      <div class=next></div>\n    </div>\n  </div>\n  <div class=info>\n    <h3 class=title></h3>\n    <h4 class=album></h4>\n    <div class=time>\n      <div class=seconds>00:00</div>/<div class=total>00:00</div>\n    </div>\n  </div>\n  <div class=volume-container>\n    <div class=volume></div>\n  </div>\n</div>\n";
  });

this["JST"]["playlist"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, self=this, helperMissing=helpers.helperMissing, functionType="function", escapeExpression=this.escapeExpression;

function program1(depth0,data,depth1) {
  
  var buffer = "", stack1, stack2, options;
  buffer += "\n    <tr>\n      <td><p>";
  options = {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data};
  stack2 = ((stack1 = helpers.blurb),stack1 ? stack1.call(depth0, ((stack1 = depth1.playlist),stack1 == null || stack1 === false ? stack1 : stack1._blurbs), depth0._id, options) : helperMissing.call(depth0, "blurb", ((stack1 = depth1.playlist),stack1 == null || stack1 === false ? stack1 : stack1._blurbs), depth0._id, options));
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "</p></td>\n      <td><a href=\"/";
  if (stack2 = helpers.year) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.year; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "/";
  if (stack2 = helpers.month) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.month; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "/";
  if (stack2 = helpers.day) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.day; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "/";
  if (stack2 = helpers.slug) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.slug; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\">";
  if (stack2 = helpers.title) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.title; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "</a> - ";
  if (stack2 = helpers.album) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.album; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "</td>\n    </tr>\n  ";
  return buffer;
  }
function program2(depth0,data) {
  
  var buffer = "";
  return buffer;
  }

  buffer += "<h3>"
    + escapeExpression(((stack1 = ((stack1 = depth0.playlist),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</h3>\n\n<table>\n  ";
  stack2 = helpers.each.call(depth0, ((stack1 = depth0.playlist),stack1 == null || stack1 === false ? stack1 : stack1._songs), {hash:{},inverse:self.noop,fn:self.programWithDepth(program1, data, depth0),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n</table>\n";
  return buffer;
  });

this["JST"]["playlists-edit"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, self=this, helperMissing=helpers.helperMissing, functionType="function", escapeExpression=this.escapeExpression;

function program1(depth0,data,depth1) {
  
  var buffer = "", stack1, stack2, options;
  buffer += "\n      <tr>\n        <td><textarea name=blurb[text]>";
  options = {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data};
  stack2 = ((stack1 = helpers.blurb),stack1 ? stack1.call(depth0, ((stack1 = depth1.playlist),stack1 == null || stack1 === false ? stack1 : stack1._blurbs), depth0._id, options) : helperMissing.call(depth0, "blurb", ((stack1 = depth1.playlist),stack1 == null || stack1 === false ? stack1 : stack1._blurbs), depth0._id, options));
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "</textarea><input type=hidden name=blurb[id] value=";
  if (stack2 = helpers._id) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0._id; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + " /></td>\n        <td><a href=\"/";
  if (stack2 = helpers.year) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.year; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "/";
  if (stack2 = helpers.month) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.month; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "/";
  if (stack2 = helpers.longDay) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.longDay; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "/";
  if (stack2 = helpers.longSlug) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.longSlug; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "\">";
  if (stack2 = helpers.title) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.title; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "</a> - ";
  if (stack2 = helpers.album) { stack2 = stack2.call(depth0, {hash:{},data:data}); }
  else { stack2 = depth0.album; stack2 = typeof stack2 === functionType ? stack2.apply(depth0) : stack2; }
  buffer += escapeExpression(stack2)
    + "</td>\n      </tr>\n    ";
  return buffer;
  }
function program2(depth0,data) {
  
  var buffer = "";
  return buffer;
  }

  buffer += "<h3>Edit Playlist</h3>\n\n\n<form action=PUT action=/ name=playlist>\n\n  <input name=name class=name value=\""
    + escapeExpression(((stack1 = ((stack1 = depth0.playlist),stack1 == null || stack1 === false ? stack1 : stack1.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" />\n\n  <table>\n    ";
  stack2 = helpers.each.call(depth0, ((stack1 = depth0.playlist),stack1 == null || stack1 === false ? stack1 : stack1._songs), {hash:{},inverse:self.noop,fn:self.programWithDepth(program1, data, depth0),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n  </table>\n\n  <button type=submit class=save>Save</button>\n  </form>";
  return buffer;
  });

this["JST"]["playlists"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1, options;
  buffer += "\n    <li><a href=\"/playlist/";
  if (stack1 = helpers._id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0._id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.name) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.name; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a><div class=count>";
  options = {hash:{},data:data};
  buffer += escapeExpression(((stack1 = helpers.length),stack1 ? stack1.call(depth0, depth0._songs, options) : helperMissing.call(depth0, "length", depth0._songs, options)))
    + "</div></li>\n  ";
  return buffer;
  }

  buffer += "<header>\n  <ul>\n    <li><a href=\"/playlist/new\">nothing atm</a></li>\n  </ul>\n</header>\n\n<ul class=playlists>\n  ";
  stack1 = helpers.each.call(depth0, depth0.playlists, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</ul>\n";
  return buffer;
  });

this["JST"]["queue"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n    <li>\n      <a class=\"song ";
  if (stack1 = helpers.active) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.active; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\" href=\"/";
  if (stack1 = helpers.year) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.year; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.month) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.month; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.longDay) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.longDay; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.longSlug) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.longSlug; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">\n        ";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\n      </a>\n      <span>\n        [<a href=\"/";
  if (stack1 = helpers.year) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.year; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.month) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.month; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.longDay) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.longDay; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">\n          ";
  if (stack1 = helpers.month) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.month; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.day) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.day; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.year) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.year; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\n        </a>]\n      </span>\n      <span>[\n        <a href=\"javascript:\" class=delete>x</a>\n      ]</span>\n    </li>\n  ";
  return buffer;
  }

function program3(depth0,data) {
  
  
  return "\n  <button class=save>Save Playlist</button>\n";
  }

  buffer += "<ul>\n  ";
  stack1 = helpers.each.call(depth0, depth0.queue, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</ul>\n\n";
  stack1 = helpers['if'].call(depth0, depth0.loggedIn, {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n";
  return buffer;
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
  buffer += "\n  <li>\n    <a href=\"/";
  if (stack1 = helpers.year) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.year; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.month) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.month; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.day) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.day; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1);
  stack1 = helpers['if'].call(depth0, depth0.version, {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\">";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a>\n  </li>\n";
  return buffer;
  }
function program2(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "-";
  if (stack1 = helpers.version) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.version; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1);
  return buffer;
  }

  buffer += "<div class=ul-header>"
    + escapeExpression(((stack1 = ((stack1 = depth0.shows),stack1 == null || stack1 === false ? stack1 : stack1.year)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n<ul>\n";
  stack2 = helpers.each.call(depth0, ((stack1 = depth0.shows),stack1 == null || stack1 === false ? stack1 : stack1._shows), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n</ul>\n";
  return buffer;
  });

this["JST"]["songs"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, stack2, options, functionType="function", escapeExpression=this.escapeExpression, self=this, helperMissing=helpers.helperMissing;

function program1(depth0,data) {
  
  var buffer = "", stack1, options;
  buffer += "\n  <li data-id=";
  if (stack1 = helpers._id) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0._id; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " data-song=\"";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">\n    <a class=song href=\"/";
  if (stack1 = helpers.year) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.year; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.month) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.month; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "/";
  if (stack1 = helpers.day) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.day; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1);
  stack1 = helpers['if'].call(depth0, depth0.showVersion, {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "/";
  if (stack1 = helpers.slug) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.slug; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1);
  stack1 = helpers['if'].call(depth0, depth0.version, {hash:{},inverse:self.noop,fn:self.program(4, program4, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\">";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + " <span>";
  options = {hash:{},data:data};
  buffer += escapeExpression(((stack1 = helpers.toHHMMSS),stack1 ? stack1.call(depth0, depth0.duration, options) : helperMissing.call(depth0, "toHHMMSS", depth0.duration, options)))
    + "</span></a>\n    <div class=play>ᐅ</div>\n    <div class=add>+</div>\n  </li>\n";
  return buffer;
  }
function program2(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "-";
  if (stack1 = helpers.showVersion) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.showVersion; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1);
  return buffer;
  }

function program4(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "/";
  if (stack1 = helpers.version) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.version; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1);
  return buffer;
  }

  buffer += "<div class=ul-header>"
    + escapeExpression(((stack1 = ((stack1 = depth0.songs),stack1 == null || stack1 === false ? stack1 : stack1.album)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</div>\n<ul>\n  <li class=playAll>Play all</li>\n";
  stack2 = helpers.each.call(depth0, ((stack1 = depth0.songs),stack1 == null || stack1 === false ? stack1 : stack1._songs), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack2 || stack2 === 0) { buffer += stack2; }
  buffer += "\n  <li><a href=\"http://phish.net/setlists/?d="
    + escapeExpression(((stack1 = ((stack1 = depth0.songs),stack1 == null || stack1 === false ? stack1 : stack1.year)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "-";
  options = {hash:{},data:data};
  buffer += escapeExpression(((stack1 = helpers.addZero),stack1 ? stack1.call(depth0, ((stack1 = depth0.songs),stack1 == null || stack1 === false ? stack1 : stack1.month), options) : helperMissing.call(depth0, "addZero", ((stack1 = depth0.songs),stack1 == null || stack1 === false ? stack1 : stack1.month), options)))
    + "-";
  options = {hash:{},data:data};
  buffer += escapeExpression(((stack1 = helpers.addZero),stack1 ? stack1.call(depth0, ((stack1 = depth0.songs),stack1 == null || stack1 === false ? stack1 : stack1.day), options) : helperMissing.call(depth0, "addZero", ((stack1 = depth0.songs),stack1 == null || stack1 === false ? stack1 : stack1.day), options)))
    + "\" target=_blank>Open on Phish.net</a></li>\n</ul>\n";
  return buffer;
  });

this["JST"]["years"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [2,'>= 1.0.0-rc.3'];
helpers = helpers || Handlebars.helpers; data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n  <li>\n    <a href=\"/";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "\">";
  if (stack1 = helpers.title) { stack1 = stack1.call(depth0, {hash:{},data:data}); }
  else { stack1 = depth0.title; stack1 = typeof stack1 === functionType ? stack1.apply(depth0) : stack1; }
  buffer += escapeExpression(stack1)
    + "</a>\n  </li>\n";
  return buffer;
  }

  buffer += "<div class=ul-header>Choose a year</div>\n<ul>\n";
  stack1 = helpers.each.call(depth0, depth0.years, {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</ul>\n";
  return buffer;
  });
var addZero, resize, timeToMS, toHHMMSS;

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

  Tweezer = new Application().initialize();
  $(window).resize(resize);
  return $(window).keydown(function(e) {
    var _ref, _ref1;

    if (e.keyCode === 32) {
      if (App.queue.playing) {
        return (_ref = App.playerView) != null ? _ref.pause() : void 0;
      } else {
        return (_ref1 = App.playerView) != null ? _ref1.playButton() : void 0;
      }
    }
  });
});

$(document).ajaxSend(function(e, xhr, options) {
  var token;

  token = csrf;
  if (token && !_.isEmpty(user)) {
    return xhr.setRequestHeader("X-CSRF-Token", token);
  }
});

resize = function() {
  return $('.home-page .row-fluid').height($(window).height() - 100 - parseInt($('footer').css('bottom')));
};

toHHMMSS = function(seconds) {
  var hourStr, hours, minutes, sec_numb, time;

  sec_numb = parseInt(seconds);
  hours = Math.floor(sec_numb / 3600);
  minutes = Math.floor((sec_numb - (hours * 3600)) / 60);
  seconds = sec_numb - (hours * 3600) - (minutes * 60);
  if (hours < 10) {
    hours = "0" + hours;
  }
  if (minutes < 10) {
    minutes = "0" + minutes;
  }
  if (seconds < 10) {
    seconds = "0" + seconds;
  }
  hourStr = hours !== "00" ? hours + ":" : "";
  time = hourStr + minutes + ":" + seconds;
  return time;
};

addZero = function(num) {
  if (String(num).length < 2) {
    return String("0" + num);
  }
  return String(num);
};

timeToMS = function(time) {
  var min, sec;

  if (!/m/.test(time)) {
    return 0;
  }
  time = time.split('m');
  min = +time[0];
  sec = +time[1];
  return ((min * 60) + sec) * 1000;
};

Handlebars.registerHelper("toHHMMSS", function() {
  return new Handlebars.SafeString(toHHMMSS(this.duration));
});

Handlebars.registerHelper("length", function(arr) {
  return new Handlebars.SafeString(arr.length);
});

Handlebars.registerHelper("addZero", function(num) {
  return new Handlebars.SafeString(addZero(num));
});

Handlebars.registerHelper("ifEqual", function(val1, val2, fn) {
  if (val1 === val2) {
    return fn();
  }
});

Handlebars.registerHelper("blurb", function(arr, id) {
  var blurb;

  if (arr) {
    blurb = _.findWhere(arr, {
      _song: id
    });
  }
  return new Handlebars.SafeString((blurb != null ? blurb.text : void 0) ? blurb.text : '');
});

var Application;

Application = (function() {
  function Application() {}

  Application.prototype.title = 'Tweezer';

  Application.prototype.initialize = function() {
    App.user = new App.Models.User(user);
    if (window.csrf) {
      App.csrf = csrf;
    }
    App.initial = true;
    this.initViews();
    App.router = new App.Router();
    Backbone.history.start({
      pushState: true
    });
    return this.pushAnchors();
  };

  Application.prototype.initViews = function() {
    App.notify = new App.Views.Notifications();
    App.header = new App.Views.Header();
    App.queueView = new App.Views.Queue();
    App.footer = new App.Views.Footer();
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
    'playlists': 'playlists',
    'playlist/:id': 'playlist',
    'playlist/:id/edit': 'editPlaylist'
  };

  Router.prototype.initialize = function() {
    this.route(/^([0-9]{4})\/?$/, 'year');
    this.route(/^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/?$/, 'show');
    this.route(/^([0-9]{4})\/([0-9]{1,2})\/([0-9]{1,2})-?([0-9])?\/([a-zA-Z0-9\-]*)\/?([0-9])?\:?\:?([0-9]{1,2}m[0-9]{1,2})?\/?$/, 'song');
    this.$container = $('#page-container');
    return this.bind('all', this._trackPageview);
  };

  Router.prototype.index = function() {
    this.changeView(new App.Views.HomePage());
    App.years = new App.Views.Years();
    App.shows = new App.Views.Shows({
      year: 2012,
      month: 6,
      day: 7
    });
    return App.songs = new App.Views.Songs({
      year: 2012,
      month: 6,
      day: 7
    });
  };

  Router.prototype.year = function(year) {
    if (App.initial) {
      this.changeView(new App.Views.HomePage());
      App.years = new App.Views.Years();
    }
    App.shows = new App.Views.Shows({
      year: year
    });
    if (App.songs) {
      return App.songs.$el.empty();
    }
  };

  Router.prototype.show = function(year, month, day, showVersion) {
    var _ref1;

    if (App.songs) {
      App.songs.undelegateEvents();
    }
    if (App.initial) {
      this.changeView(new App.Views.HomePage());
      App.years = new App.Views.Years();
    }
    if (((_ref1 = App.shows) != null ? _ref1.shows.get('year') : void 0) !== +year) {
      App.shows = new App.Views.Shows({
        year: year
      });
    }
    return App.songs = new App.Views.Songs({
      year: year,
      month: month,
      day: day,
      showVersion: showVersion
    });
  };

  Router.prototype.song = function(year, month, day, showVersion, slug, version, time) {
    var ms, song, _ref1;

    if (App.initial) {
      this.changeView(new App.Views.HomePage());
      App.years = new App.Views.Years();
      App.songs = new App.Views.Songs({
        year: year,
        month: month,
        day: day,
        showVersion: showVersion
      });
    }
    if (((_ref1 = App.shows) != null ? _ref1.shows.get('year') : void 0) !== +year) {
      App.shows = new App.Views.Shows({
        year: year
      });
    }
    ms = timeToMS(time);
    if (song = App.queue.findWhere({
      year: year,
      month: month,
      day: day,
      slug: slug,
      showVersion: showVersion,
      version: version
    })) {
      return App.queue.play(song, ms);
    }
    App.song = new App.Models.Song({
      year: year,
      month: month,
      day: day,
      slug: slug,
      showVersion: showVersion,
      version: version,
      ms: ms
    });
    return App.song.fetch({
      success: function() {
        return App.song.change();
      }
    });
  };

  Router.prototype.login = function() {
    return this.changeView(new App.Views.LoginPage());
  };

  Router.prototype.register = function() {
    return this.changeView(new App.Views.RegisterPage());
  };

  Router.prototype.playlist = function(id) {
    return this.changeView(new App.Views.PlaylistPage({
      playlistId: id
    }));
  };

  Router.prototype.playlists = function() {
    return this.changeView(new App.Views.PlaylistsPage(), false);
  };

  Router.prototype.editPlaylist = function(id) {
    return this.changeView(new App.Views.PlaylistsEdit({
      playlistId: id
    }), false);
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
      resize();
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

    if (App.initial) {
      App.initial = false;
    }
    url = Backbone.history.getFragment();
    return ga('send', 'pageview', "/" + url);
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

  Player.prototype.play = function(id, ms) {
    var stopId,
      _this = this;

    if (stopId = this.get('id')) {
      soundManager.stop("phish" + stopId);
    }
    this.set('id', id);
    App.playerView.played.push(id);
    return soundManager.onready(function() {
      _this.sound = soundManager.createSound({
        id: "phish" + id,
        url: "http://74.104.117.66:8044/stream?player=74&id=" + id,
        position: ms || 0
      });
      return _this.sound.play({
        whileloading: function() {
          return App.footer.updateProgress(this.bytesLoaded, this.bytesTotal);
        },
        whileplaying: function() {
          return App.footer.updatePlaying(this.position, this.duration);
        },
        onplay: function() {
          _this.updateText();
          return _this.slideDown();
        },
        onfinish: function() {
          this.stop();
          App.playerView.playNext();
          if (App.queue.idx === App.queue.length) {
            return App.queue.playing = false;
          }
        }
      });
    });
  };

  Player.prototype.updateText = function() {
    var id;

    id = this.get('id');
    if (id) {
      return App.playerView.updateText({
        title: App.song.get('title'),
        album: App.song.get('album'),
        duration: App.song.get('duration')
      });
    }
  };

  Player.prototype.slideDown = function() {
    var $footer;

    $footer = $('footer');
    if (!parseInt($footer.css('bottom') === 0)) {
      $footer.animate({
        'bottom': 0
      }, 1000);
      return $('.home-page .row-fluid').animate({
        'height': $(window).height() - 100
      }, 1000);
    }
  };

  return Player;

})(App.Models.Model);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Models.Playlist = (function(_super) {
  __extends(Playlist, _super);

  function Playlist() {
    _ref = Playlist.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Playlist.prototype.idAttribute = '_id';

  Playlist.prototype.url = function() {
    var id;

    id = this.get('_id');
    return '/api/v1/playlist' + (id ? "/" + id : '');
  };

  Playlist.prototype.defaults = {
    _songs: [],
    name: 'Untitled Playlist'
  };

  return Playlist;

})(App.Models.Model);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Models.Shows = (function(_super) {
  __extends(Shows, _super);

  function Shows() {
    _ref = Shows.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Shows.prototype.url = function() {
    var year;

    year = this.get('year');
    return "/api/v1/" + year;
  };

  return Shows;

})(App.Models.Model);

var _ref,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Models.Song = (function(_super) {
  __extends(Song, _super);

  function Song() {
    this.change = __bind(this.change, this);    _ref = Song.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Song.prototype.url = function() {
    var day, id, month, ms, showVersion, slug, version, year;

    id = this.get('_id');
    if (id) {
      return "/api/v1/song/" + id;
    }
    year = this.get('year');
    month = this.get('month');
    day = this.get('day');
    showVersion = this.get('showVersion') || 0;
    slug = this.get('slug');
    version = this.get('version') || 0;
    ms = this.get('ms');
    return "/api/v1/" + year + "/" + month + "/" + day + "-" + showVersion + "/" + slug + "/" + version;
  };

  Song.prototype.change = function() {
    return App.queue.push(this);
  };

  return Song;

})(App.Models.Model);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Models.Songs = (function(_super) {
  __extends(Songs, _super);

  function Songs() {
    _ref = Songs.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Songs.prototype.url = function() {
    var day, month, version, year;

    year = this.get('year');
    month = this.get('month');
    day = this.get('day');
    version = this.get('version') || 0;
    return "/api/v1/" + year + "/" + month + "/" + day + "-" + version;
  };

  return Songs;

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

App.Collections.Playlists = (function(_super) {
  __extends(Playlists, _super);

  function Playlists() {
    _ref = Playlists.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Playlists.prototype.url = '/api/v1/playlists';

  Playlists.prototype.model = App.Models.Playlist;

  return Playlists;

})(App.Collections.Collection);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Collections.Queue = (function(_super) {
  __extends(Queue, _super);

  function Queue() {
    _ref = Queue.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Queue.prototype.localStorage = new Backbone.LocalStorage("Queue");

  Queue.prototype.model = App.Models.Song;

  Queue.prototype.idx = 0;

  Queue.prototype.playing = false;

  Queue.prototype.initialize = function() {
    var _this = this;

    this.on('add', function() {
      if ((_this.length === 1) || (_this.idx === _this.length - 1 && !_this.playing)) {
        return _this.play();
      }
    });
    return this.on('reset', function() {
      _this.idx = 0;
      if (_this.length > 0) {
        return _this.play();
      }
    });
  };

  Queue.prototype.play = function(song) {
    var id, longDay, longSlug, month, year, _ref1;

    if (song) {
      App.song = this.at(song);
      if (App.song) {
        this.idx = this.indexOf(App.song);
      }
    } else {
      if (this.idx === this.length) {
        return App.playerView.pause();
      }
      App.song = this.at(this.idx++);
    }
    if (!App.song) {
      return false;
    }
    this.invoke('set', {
      active: ''
    });
    App.song.set('active', 'active');
    _ref1 = App.song.toJSON(), id = _ref1.id, year = _ref1.year, month = _ref1.month, longDay = _ref1.longDay, longSlug = _ref1.longSlug;
    App.player.play(id, App.song.get('ms'));
    this.playing = true;
    Backbone.history.navigate("/" + year + "/" + month + "/" + longDay + "/" + longSlug, {
      trigger: false
    });
    return App.queueView.render();
  };

  Queue.prototype.playLast = function() {
    this.idx = this.idx - 2;
    if (this.idx < 0) {
      this.idx = 0;
    }
    return this.play();
  };

  return Queue;

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
    return this.undelegateEvents();
  };

  return View;

})(Backbone.View);

var _ref,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Footer = (function(_super) {
  __extends(Footer, _super);

  function Footer() {
    this.mouseUp = __bind(this.mouseUp, this);    _ref = Footer.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Footer.prototype.el = 'footer';

  Footer.prototype.template = JST['footer'];

  Footer.prototype.events = {
    'mouseenter .progress-container': 'hoverBar',
    'mousemove .progress-container': 'moveBar',
    'mouseleave .progress-container': 'leaveBar',
    'mousedown .progress-container': 'seekDown',
    'mouseup': 'mouseUp'
  };

  Footer.prototype.initialize = function() {
    this.$progress = this.$el.find('.progress-bar');
    this.$container = this.$el.find('.progress-container');
    return this.$position = this.$el.find('.position-bar');
  };

  Footer.prototype.hoverBar = function(e) {
    this.$progress.stop().animate({
      height: '10px'
    }, 300);
    this.$container.stop().animate({
      height: '10px'
    }, 300);
    return this.$position.stop().animate({
      height: '10px'
    }, 300);
  };

  Footer.prototype.moveBar = function(e) {
    var time;

    time = toHHMMSS(this._clickToMs(e.pageX) / 1000);
    App.playerView.$seconds.html(time);
    if (this.dragging) {
      return this.seek(e.pageX);
    }
  };

  Footer.prototype.leaveBar = function() {
    this.$progress.stop().animate({
      height: '8px'
    }, 300);
    this.$position.stop().animate({
      height: '8px'
    }, 300);
    this.$container.stop().animate({
      height: '8px'
    }, 300);
    return this.$container.off('mousemove');
  };

  Footer.prototype.updateProgress = function(loaded, total) {
    return this.$progress.width("" + ((loaded / total) * 100) + "%");
  };

  Footer.prototype.updatePlaying = function(position, duration) {
    if (!this.$container.is(":hover")) {
      App.playerView.$seconds.html(toHHMMSS(position / 1000));
    }
    return this.$position.css('left', "" + ((position / duration) * 100) + "%");
  };

  Footer.prototype.seekDown = function(e) {
    this.seek(e.pageX);
    return this.dragging = true;
  };

  Footer.prototype.mouseUp = function(e) {
    var coord;

    if (this.dragging) {
      coord = e.pageX / $(window).width();
      if (App.player.sound.bytesLoaded / App.player.sound.bytesTotal < coord) {
        App.player.sound.destruct();
        App.player.play(App.song.get('id'), this._clickToMs(e.pageX));
      }
    }
    return this.dragging = false;
  };

  Footer.prototype.seek = function(pageX) {
    var coord;

    coord = pageX / $(window).width();
    return App.player.sound.setPosition(coord * App.song.get('duration') * 1000);
  };

  Footer.prototype._clickToMs = function(pageX) {
    var coord;

    coord = pageX / $(window).width();
    return coord * App.song.get('duration') * 1000;
  };

  return Footer;

})(App.Views.View);

var _ref,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Header = (function(_super) {
  __extends(Header, _super);

  function Header() {
    this.render = __bind(this.render, this);    _ref = Header.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Header.prototype.autoRender = true;

  Header.prototype.el = 'header';

  Header.prototype.template = JST['header'];

  Header.prototype.initialize = function() {
    return Header.__super__.initialize.apply(this, arguments);
  };

  Header.prototype.render = function(playlist) {
    return this.$el.html(this.template({
      loggedIn: App.user.loggedIn(),
      playlistId: playlist ? playlist.get('_id') : void 0
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
    App.header.render();
    this.$el.html(this.template({
      loggedIn: App.user.loggedIn()
    }));
    resize();
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
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Player = (function(_super) {
  __extends(Player, _super);

  function Player() {
    this.setVolume = __bind(this.setVolume, this);
    this.volumeMove = __bind(this.volumeMove, this);
    this.clickUp = __bind(this.clickUp, this);
    this.volume = __bind(this.volume, this);    _ref = Player.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Player.prototype.el = '.player-container';

  Player.prototype.template = JST['player'];

  Player.prototype.played = [];

  Player.prototype.events = {
    'click .pause': 'pause',
    'click .play': 'playButton',
    'click .next': 'playNext',
    'click .last': 'playLast',
    'mousedown .volume-container': 'volume',
    'mouseup': 'clickUp',
    'mousemove .volume-container': 'volumeMove'
  };

  Player.prototype.initialize = function() {
    soundManager.setup({
      url: "/swf",
      useHTML5Audio: true,
      preferFlash: false,
      debugMode: false
    });
    return this.render();
  };

  Player.prototype.render = function() {
    this.$el.html(this.template());
    App.player.updateText();
    this.$seconds = this.$el.find('.seconds');
    this.$volumeContainer = this.$el.find('.volume-container');
    return this.$volume = this.$volumeContainer.find('.volume');
  };

  Player.prototype.updateText = function(obj) {
    var album, duration, title;

    title = obj.title, album = obj.album, duration = obj.duration;
    if (title) {
      this.$el.find('h3').html(title);
    }
    if (album) {
      this.$el.find('h4').html(album);
    }
    if (duration) {
      return this.$el.find('.total').html(toHHMMSS(duration));
    }
  };

  Player.prototype.pause = function() {
    soundManager.pause("phish" + App.player.get('id'));
    App.queue.playing = false;
    return $('footer .pause').removeClass('pause').addClass('play');
  };

  Player.prototype.playButton = function() {
    var id;

    id = App.player.get('id');
    App.queue.playing = true;
    $('footer .play').removeClass('play').addClass('pause');
    if (this.played.indexOf(id >= 0)) {
      return soundManager.resume("phish" + id);
    }
    return App.player.play(id);
  };

  Player.prototype.playNext = function() {
    return App.queue.play();
  };

  Player.prototype.playLast = function() {
    return App.queue.playLast();
  };

  Player.prototype.volume = function(e) {
    this.setVolume(e.pageY);
    return this.dragging = true;
  };

  Player.prototype.clickUp = function(e) {
    return this.dragging = false;
  };

  Player.prototype.volumeMove = function(e) {
    if (this.dragging) {
      return this.setVolume(e.pageY);
    }
  };

  Player.prototype.setVolume = function(pageY) {
    var vol;

    vol = 100 - (pageY - this.$volumeContainer.offset().top) / this.$volumeContainer.height() * 100;
    App.player.sound.setVolume(vol);
    return this.$volume.height("" + vol + "%");
  };

  return Player;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.PlaylistPage = (function(_super) {
  __extends(PlaylistPage, _super);

  function PlaylistPage() {
    _ref = PlaylistPage.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  PlaylistPage.prototype.className = 'playlist-page';

  PlaylistPage.prototype.template = JST['playlist'];

  PlaylistPage.prototype.initialize = function() {
    this.playlist = new App.Models.Playlist({
      _id: this.options.playlistId
    });
    this.listenTo(this.playlist, 'change', this.render);
    return this.playlist.fetch();
  };

  PlaylistPage.prototype.render = function() {
    this.$el.html(this.template({
      playlist: this.playlist.toJSON()
    }));
    return this;
  };

  return PlaylistPage;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.PlaylistsEdit = (function(_super) {
  __extends(PlaylistsEdit, _super);

  function PlaylistsEdit() {
    _ref = PlaylistsEdit.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  PlaylistsEdit.prototype.className = 'playlists-edit-page';

  PlaylistsEdit.prototype.template = JST['playlists-edit'];

  PlaylistsEdit.prototype.events = {
    'submit form': 'saveBlurbs'
  };

  PlaylistsEdit.prototype.initialize = function() {
    App.playlist = new App.Models.Playlist({
      _id: this.options.playlistId
    });
    App.playlist.fetch();
    this.listenToOnce(App.playlist, 'change', this.render);
    return App.header.render(false);
  };

  PlaylistsEdit.prototype.render = function() {
    this.$el.html(this.template({
      playlist: App.playlist.toJSON()
    }));
    return this;
  };

  PlaylistsEdit.prototype.saveBlurbs = function(e) {
    var $textarea, PUT, data, playlistId, title;

    e.preventDefault();
    playlistId = App.playlist.get('_id');
    title = this.$el.find('input.name').val();
    data = {
      playlistId: playlistId,
      title: title,
      arr: []
    };
    PUT = this.PUT;
    $textarea = $('textarea');
    $textarea.each(function(idx) {
      var $text, val;

      $text = $(this);
      val = typeof $text.val() === 'string' ? $text.val() : '';
      console.log($text.val());
      data.arr.push({
        text: val,
        songId: $text.siblings('input').val()
      });
      if (idx === $textarea.length - 1) {
        return PUT(data);
      }
    });
    return false;
  };

  PlaylistsEdit.prototype.PUT = function(data) {
    return $.ajax({
      type: 'PUT',
      url: '/api/v1/blurbs',
      data: data,
      success: function(json) {
        if (json) {
          return App.notify.send('Saved', 'Your playlist has been saved');
        }
      }
    });
  };

  return PlaylistsEdit;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.PlaylistsPage = (function(_super) {
  __extends(PlaylistsPage, _super);

  function PlaylistsPage() {
    _ref = PlaylistsPage.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  PlaylistsPage.prototype.className = 'playlists-page';

  PlaylistsPage.prototype.template = JST['playlists'];

  PlaylistsPage.prototype.initialize = function() {
    this.playlists || (this.playlists = new App.Collections.Playlists());
    this.listenTo(this.playlists, 'reset', this.render);
    return this.playlists.fetch({
      reset: true
    });
  };

  PlaylistsPage.prototype.render = function() {
    this.$el.html(this.template({
      playlists: this.playlists.toJSON()
    }));
    return this;
  };

  return PlaylistsPage;

})(App.Views.View);

var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

App.Views.Queue = (function(_super) {
  __extends(Queue, _super);

  function Queue() {
    _ref = Queue.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Queue.prototype.el = '.queue-container';

  Queue.prototype.template = JST['queue'];

  Queue.prototype.events = {
    'click .save': 'savePlaylist',
    'click .song': 'play',
    'click .delete': 'removeFromQueue'
  };

  Queue.prototype.initialize = function() {
    App.queue = new App.Collections.Queue();
    this.listenTo(App.queue, 'add', this.render);
    this.listenTo(App.queue, 'reset', this.render);
    return this.render();
  };

  Queue.prototype.render = function() {
    var _ref1;

    return this.$el.html(this.template({
      queue: App.queue.toJSON(),
      loggedIn: App.user.loggedIn(),
      activeSlug: App.queue ? (_ref1 = App.queue.at(App.queue.idx - 1)) != null ? _ref1.get('longSlug') : void 0 : false
    }));
  };

  Queue.prototype.savePlaylist = function() {
    var playlist;

    playlist = new App.Models.Playlist({
      _songs: _.pluck(App.queue.toJSON(), '_id')
    });
    playlist.save();
    return this.listenToOnce(playlist, 'change', function() {
      return Backbone.history.navigate("/playlist/" + (playlist.get('_id')) + "/edit", {
        trigger: true
      });
    });
  };

  Queue.prototype.play = function(e) {
    e.preventDefault();
    App.queue.idx = this.$el.find('li').index($(e.target).parent());
    return App.queue.play();
  };

  Queue.prototype.removeFromQueue = function(e) {
    var idx;

    idx = this.$el.find('.delete').index($(e.target));
    App.queue.remove(App.queue.at(idx));
    if (idx < App.queue.idx) {
      App.queue.idx--;
    }
    return this.render();
  };

  return Queue;

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

  Shows.prototype.events = {
    'click a': 'activate'
  };

  Shows.prototype.initialize = function() {
    if (!this.options.year) {
      return this.render();
    }
    this.shows = new App.Models.Shows({
      year: this.options.year
    });
    this.listenTo(this.shows, 'change', this.render);
    return this.shows.fetch();
  };

  Shows.prototype.render = function() {
    App.router.clearActive();
    this.$el.html(this.template({
      shows: this.shows ? this.shows.toJSON() : shows
    }));
    this.$a = this.$el.find('a').removeClass('active');
    return this;
  };

  Shows.prototype.activate = function(e) {
    this.$a.removeClass('active');
    return $(e.target).addClass('active');
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

  Songs.prototype.events = {
    'click .add': 'addToPlaylist',
    'click .song': 'addToPlaylist',
    'click .play': 'play',
    'click .playAll': 'playAll'
  };

  Songs.prototype.initialize = function() {
    if (!(this.options.year || this.options.month || this.options.day)) {
      return this.render();
    }
    this.folder = new App.Models.Songs({
      year: this.options.year,
      month: this.options.month,
      day: this.options.day,
      version: this.options.showVersion || 0
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

  Songs.prototype.play = function(e) {
    var id, song;

    id = $(e.target).parent().attr('data-id');
    song = new App.Models.Song({
      _id: id
    });
    return song.fetch({
      success: function() {
        return App.queue.reset(song);
      }
    });
  };

  Songs.prototype.playAll = function() {
    return App.queue.reset(this.folder.get('_songs'));
  };

  Songs.prototype.addToPlaylist = function(e) {
    var $li, id;

    $li = $(e.target).parent();
    id = $li.attr('data-id');
    App.song = new App.Models.Song({
      _id: id
    });
    App.song.fetch({
      success: function() {
        return App.song.change();
      }
    });
    return false;
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

  Years.prototype.autoRender = true;

  Years.prototype.el = '.years-container';

  Years.prototype.template = JST['years'];

  Years.prototype.events = {
    'click a': 'activate'
  };

  Years.prototype.render = function() {
    App.router.clearActive();
    this.$el.html(this.template({
      years: years
    }));
    this.$a = this.$el.find('a');
    return this;
  };

  Years.prototype.activate = function(e) {
    this.$a.removeClass('active');
    return $(e.target).addClass('active');
  };

  return Years;

})(App.Views.View);
