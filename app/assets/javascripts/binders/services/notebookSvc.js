'use strict';
angular.module('binderApp')
  .factory('NotebookSvc', [
    '$resource',
    'DividerSvc',
    function ($resource, DividerSvc) {
      var Notebook, Build, TransformInstance;

      TransformInstance = function(notebook){
        return Build(notebook);
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

        obj.children = obj.children || []

        var childs = []
        angular.forEach(obj.children, function(child){
          childs.push(DividerSvc.build(child))
        })

        return new Notebook({
          id:           obj.id            || null,
          name:         obj.name          || '',
          children:     childs,
          description:  obj.description   || '',
          color_hex:    obj.color_hex     || '#000000',
          active:       obj.active        || true,
          binder_id:    obj.binder_id     || 0,
          created_at:   obj.created_at    || new Date(),
          updated_at:   obj.updated_at    || new Date()
        })
      };

      return {
        resource: Notebook,
        build: Build,
      };
  }]);
