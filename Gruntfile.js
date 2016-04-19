
module.exports = function(grunt) {
  grunt.initConfig({
    clean: ["dump/", "production/"],
    coffee: {
      app: {
        src: ["app/**/*.coffee"],
        dest: "dump/javascript",
        ext: '.js',
        expand: true,
        options: {
          bare: true
        }
      }
    },
    handlebars: {
      all: {
        options: {
          wrapped: true,
          processName: function(path) {
            var pieces;
            pieces = path.split("/");
            return pieces[pieces.length - 1].replace(/\.hbs$/, "");
          }
        },
        files: {
          "dump/javascript/templates.js": ["app/views/templates/*.hbs"]
        }
      }
    },
    concat: {
      app: {
        src: ["dump/javascript/templates.js", "dump/javascript/app/init.js", "dump/javascript/app/application.js", "dump/javascript/app/router.js", "dump/javascript/app/utils/**/*.js", "dump/javascript/app/controllers/**/*.js", "dump/javascript/app/models/**/*.js", "dump/javascript/app/collections/**/*.js", "dump/javascript/app/views/base/*.js", "dump/javascript/app/views/*.js"],
        dest: "public/javascript/app.js"
      },
      vendor: {
        src: ["vendor/scripts/jquery-1.8.3.js", "vendor/scripts/underscore-1.4.3.js", "vendor/scripts/backbone-1.0.0.js", "vendor/scripts/backbone.localStorage.js", "vendor/scripts/handlebars.js", "vendor/scripts/handlebars-helpers.js", "vendor/scripts/console-helper.js", "vendor/scripts/jquery.serializeToJSON.js", "vendor/scripts/sound-manager2.js", "vendor/scripts/gapless.js", "vendor/scripts/jquery.powertip.js"],
        dest: "public/javascript/vendor.js"
      }
    },
    cssmin: {
      app: {
        files: {
          "production/index.css": ["public/css/index.css"]
        }
      }
    },
    stylus: {
      compile: {
        files: {
          "public/css/index.css": ["app/views/styles/bootstrap.styl", "app/views/styles/gapless.styl", "app/views/styles/application.styl", "app/views/styles/header.styl", "app/views/styles/footer.styl", "app/views/styles/index.styl", "app/views/styles/home-page.styl", "app/views/styles/login-page.styl", "app/views/styles/player.styl", "app/views/styles/playlists.styl", "app/views/styles/playlist.styl", "app/views/styles/edit-playlist.styl", "app/views/styles/queue.styl", "app/views/styles/about.styl", "app/views/styles/powerTip.styl"]
        }
      }
    },
    uglify: {
      app: {
        files: {
          "production/gd.min.js": ["public/javascript/vendor.js", "public/javascript/app.js"]
        }
      }
    },
    watch: {
      compile: {
        files: ["app/**/*.coffee"],
        tasks: ["compile:coffee"]
      },
      vendor: {
        files: ["vendor/**/*.js"],
        tasks: ["concat:vendor", "clean"]
      },
      handlebars: {
        files: ["app/views/templates/*.hbs"],
        tasks: ["compile:coffee"]
      },
      stylus: {
        files: ["app/views/styles/**/*.styl"],
        tasks: ["stylus"]
      }
    },
    copy: {
      production: {
        files: [
          {
            src: ["public/img/*"],
            dest: "production/img/"
          }, {
            src: ["public/index.html"],
            dest: "production/index.html"
          }
        ]
      }
    },
    compress: {
      js: {
        options: {
          mode: 'gzip'
        },
        src: ['production/gd.min.js'],
        dest: 'production/gd.min.js'
      },
      css: {
        options: {
          mode: 'gzip'
        },
        src: ['production/index.css'],
        dest: 'production/index.css'
      }
    },
    rename: {
      production: {
        files: [
          {
            src: 'production/gd.min.js.gz',
            dest: 'production/gd.min.js'
          }, {
            src: 'production/index.css.gz',
            dest: 'production/index.css'
          }
        ]
      }
    }
  });
  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-contrib-concat");
  grunt.loadNpmTasks("grunt-contrib-coffee");
  grunt.loadNpmTasks("grunt-contrib-handlebars");
  grunt.loadNpmTasks("grunt-contrib-stylus");
  grunt.loadNpmTasks("grunt-contrib-copy");
  grunt.loadNpmTasks("grunt-contrib-cssmin");
  grunt.loadNpmTasks("grunt-contrib-watch");
  grunt.loadNpmTasks("grunt-contrib-uglify");
  grunt.loadNpmTasks('grunt-contrib-compress');
  grunt.loadNpmTasks('grunt-contrib-rename');
  grunt.registerTask("compile", ["coffee", "handlebars", "concat", "stylus", "clean"]);
  grunt.registerTask("compile:coffee", ["coffee", "handlebars", "concat", "clean"]);
  return grunt.registerTask("production", ["coffee", "handlebars", "concat", "stylus", "clean", "copy:production", "cssmin", "uglify", "rename"]);
};
