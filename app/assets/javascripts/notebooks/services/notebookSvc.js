'use strict';
angular.module('notebookApp')
  .factory('NotebookSvc', [
    '$resource',
    function ($resource) {
      var Notebook, Build, TransformInstance;

      TransformInstance = function(schematic){
        return Build(schematic);
      };

      Notebook  = $resource('/api/v1/notebooks/:id', {
        id: '@id'
      },
      {
        query: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            angular.forEach(w.notebooks, function(notebook, idx) {
              // Replace each item with an instance of the resource object
              w.notebooks[idx] = TransformInstance(notebook);
            });
            return w;
          }
        },
        get: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            w.notebook = TransformInstance(w.notebook);
            w.notebook.geographies = w.geographies;
            return w.notebook;
          }
        },
        update: {
          method: 'PUT'
        },
        save: {
          method: 'POST',
          isArray: false, // <- not returning an array
          transformRequest: function(data, header) {
            var p = angular.toJson({notebook: data});
            return p;
          },
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);

            return w.notebook;
          }
        }
      });

      Build = function(obj) {

        obj = obj || {};
        return new Notebook({
          id:           obj.id            || null,
          name:         obj.name          || '',
          children:     obj.children      || [],
          description:  obj.description   || '',
          color_hex:    obj.color_hex     || '#000000',
          active:       obj.active        || true,
          created_at:   obj.created_at    || new Date(),
          updated_at:   obj.updated_at    || new Date()
        })
      };

      return {
        resource: Notebook,
        build: Build,
      };
  }]);
