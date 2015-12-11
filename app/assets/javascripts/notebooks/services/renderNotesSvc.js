'use strict';
angular.module('notebookApp')
  .service('RenderNotebookSvc', [
    function () {
      var SlapOnPage;

      SlapOnPage = function(element, note){
        var noteElement = angular.element('<div>' + note.body + '</div>')
        noteElement.css('width', ('' + note.hstore.width + 'px'))
        noteElement.css('position', 'absolute')
        noteElement.offset({left: note.hstore.x, top: note.hstore.y})
        element.append(noteElement)
      }

      return {
        slapOnPage: SlapOnPage
      }

  }]);
