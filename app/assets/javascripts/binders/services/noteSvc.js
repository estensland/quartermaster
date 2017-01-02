'use strict';
angular.module('binderApp')
  .factory('NoteSvc', [
    '$resource',
    '$resource',
    function ($resource) {
      var Note, Build, TransformInstance;

      TransformInstance = function(note){
        return Build(note);
      };

      Note  = $resource('/api/v1/notes/:id', {
        id: '@id'
      },
      {
        query: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            angular.forEach(w.notebooks, function(note, idx) {
              // Replace each item with an instance of the resource object
              w.notes[idx] = TransformInstance(note);
            });
            return w;
          }
        },
        get: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            w.note = TransformInstance(w.note);
            w.note.geographies = w.geographies;
            return w.note;
          }
        },
        update: {
          method: 'PUT'
        },
        destroy:{
          method: 'PUT'
        },
        create: {
          method: 'POST',
          isArray: false, // <- not returning an array
          transformRequest: function(data, header) {
            var p = angular.toJson({note: data});
            return p;
          },
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);

            return w.note;
          }
        },
        save: {
          method: 'PUT',
          isArray: false, // <- not returning an array
          transformRequest: function(data, header) {
            var p = angular.toJson({note: data});
            return p;
          },
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);

            return w.note;
          }
        }
      });


        var debounce = function(func, wait, immediate) {
          var timeout;

          return function() {
            var context = this
            var args = arguments;

            var later = function() {
              timeout = null;
              func.apply(context, args);
            };

            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
          };
        };

      Note.prototype.debouncerSave = debounce(function(htmlBody){
          if (this.id){
            this.body = htmlBody
            this.$save();
          }
        }, 400);

      Build = function(obj) {

        obj = obj || {};

        var hstore    = obj.hstore    || {}
        hstore.x      = hstore.x      || 1
        hstore.y      = hstore.y      || 1
        hstore.width  = hstore.width  || 100

        return new Note({
          id:           obj.id            || null,
          name:         obj.name          || '',
          body:         obj.body          || '',
          order:        obj.order         || 0,
          divider_id:   obj.divider_id    || '',
          hstore:       hstore,
          active:       obj.active        || true,
          created_at:   obj.created_at    || new Date(),
          updated_at:   obj.updated_at    || new Date()
        })
      };

      return {
        resource: Note,
        build: Build,
      };
  }]);
