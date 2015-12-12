'use strict';
angular.module('notebookApp')
  .factory('NoteSvc', [
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
        save: {
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
        }
      });

      Build = function(obj) {

        obj = obj || {};
        return new Note({
          id:           obj.id            || null,
          name:         obj.name          || '',
          body:         obj.body          || '',
          order:        obj.order         || 0,
          divider_id:   obj.divider_id    || '',
          hstore:       obj.hstore        || {x: 0, y: 0},
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
