'use strict';
angular.module('binderApp')
  .factory('ShelfSvc', [
    '$resource',
    'BinderSvc',
    function ($resource, BinderSvc) {
      var Shelf, Build, TransformInstance;

      TransformInstance = function(shelf){
        return Build(shelf);
      };

      Shelf  = $resource('/api/v1/shelves/:id', {
        id: '@id'
      },
      {
        query: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            angular.forEach(w.shelf, function(shelf, idx) {
              // Replace each item with an instance of the resource object
              w.shelf[idx] = TransformInstance(shelf);
            });
            return w;
          }
        },
        get: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            w.shelf = TransformInstance(w.shelf);
            w.shelf.geographies = w.geographies;
            return w.shelf;
          }
        },
        update: {
          method: 'PUT'
        },
        save: {
          method: 'PUT',
          isArray: false, // <- not returning an array
          transformRequest: function(data, header) {
            var p = angular.toJson({shelf: data});
            return p;
          },
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);

            return w.shelf;
          }
        },
        create: {
          method: 'POST',
          isArray: false, // <- not returning an array
          transformRequest: function(data, header) {
            var p = angular.toJson({shelf: data});
            return p;
          },
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);

            return w.shelf;
          }
        }
      });

      Build = function(obj) {
        obj = obj || {};

        obj.binders = obj.binders || []

        var bindas = []
        angular.forEach(obj.binders, function(binda){
          bindas.push(BinderSvc.build(binda))
        })

        return new Shelf({
          id:           obj.id            || null,
          name:         obj.name          || '',
          binders:      bindas,
          description:  obj.description   || '',
          color_hex:    obj.color_hex     || '#000000',
          active:       obj.active        || true,
          created_at:   obj.created_at    || new Date(),
          updated_at:   obj.updated_at    || new Date()
        })
      };

      return {
        resource: Shelf,
        build: Build,
      };
  }]);
