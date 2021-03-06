'use strict';
angular.module('binderApp')
  .factory('BinderSvc', [
    '$resource',
    'NotebookSvc',
    function ($resource, NotebookSvc) {
      var Binder, Build, TransformInstance;

      TransformInstance = function(binder){
        return Build(binder);
      };

      Binder  = $resource('/api/v1/binders/:id', {
        id: '@id'
      },
      {
        query: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            angular.forEach(w.binders, function(binder, idx) {
              // Replace each item with an instance of the resource object
              w.binders[idx] = TransformInstance(binder);
            });
            return w;
          }
        },
        get: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            w.binder = TransformInstance(w.binder);
            return w.binder;
          }
        },
        update: {
          method: 'PUT'
        },
        save: {
          method: 'PUT',
          isArray: false, // <- not returning an array
          transformRequest: function(data, header) {
            var p = angular.toJson({binder: data});
            return p;
          },
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);

            return w.binder;
          }
        },
        create: {
          method: 'POST',
          isArray: false, // <- not returning an array
          transformRequest: function(data, header) {
            var p = angular.toJson({binder: data});
            return p;
          },
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);

            return w.binder;
          }
        }
      });

      Build = function(obj) {
        obj = obj || {};

        obj.notebooks = obj.notebooks || []

        var nBooks = []
        angular.forEach(obj.notebooks, function(nBook){
          nBooks.push(NotebookSvc.build(nBook))
        })

        return new Binder({
          id:           obj.id            || null,
          name:         obj.name          || '',
          notebooks:    nBooks,
          description:  obj.description   || '',
          color_hex:    obj.color_hex     || '#000000',
          shelf_id:     obj.shelf_id      || true,
          active:       obj.active        || true,
          created_at:   obj.created_at    || new Date(),
          updated_at:   obj.updated_at    || new Date()
        })
      };

      return {
        resource: Binder,
        build: Build,
      };
  }]);
