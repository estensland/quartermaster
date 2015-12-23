'use strict';
angular.module('binderApp')
  .factory('DividerSvc', [
    '$resource',
    'NoteSvc',
    function ($resource, NoteSvc) {
      var Divider, Build, TransformInstance;

      TransformInstance = function(divider){
        return Build(divider);
      };

      Divider  = $resource('/api/v1/dividers/:id', {
        id: '@id'
      },
      {
        query: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            angular.forEach(w.notebooks, function(divider, idx) {
              // Replace each item with an instance of the resource object
              w.dividers[idx] = TransformInstance(divider);
            });
            return w;
          }
        },
        get: {
          method: 'GET',
          isArray: false, // <- not returning an array
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);
            w.divider = TransformInstance(w.divider);
            w.divider.geographies = w.geographies;
            return w.divider;
          }
        },
        update: {
          method: 'PUT'
        },
        save: {
          method: 'PUT',
          isArray: false, // <- not returning an array
          transformRequest: function(data, header) {
            var p = angular.toJson({divider: data});
            return p;
          },
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);

            return w.divider;
          }
        },
        create: {
          method: 'POST',
          isArray: false, // <- not returning an array
          transformRequest: function(data, header) {
            var p = angular.toJson({divider: data});
            return p;
          },
          transformResponse: function(data, header) {
            var w = angular.fromJson(data);

            return w.divider;
          }
        }
      });

      Build = function(obj) {

        var childs = []
        angular.forEach(obj.children, function(child){
          childs.push(Build(child))
        })

        var notations = []
        angular.forEach(obj.notes, function(note){
          notations.push(NoteSvc.build(note))
        })

        obj = obj || {};
        return new Divider({
          id:            obj.id            || null,
          name:          obj.name          || '',
          description:   obj.description   || '',
          parent_id:     obj.parent_id     || '',
          children:      childs,
          notes:         notations,
          parent_type:   obj.parent_type   || '',
          active:        obj.active        || true,
          display_order: obj.display_order || 0,
          created_at:    obj.created_at    || new Date(),
          updated_at:    obj.updated_at    || new Date()
        })
      };

      return {
        resource: Divider,
        build: Build,
      };
  }]);
