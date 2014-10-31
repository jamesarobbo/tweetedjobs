$(document).ready(function() {

 $(function(){
   var $container = $('#container');
   $container.imagesLoaded( function () {
       itemSelector: '.item',
       isFitWidth: true
   });
  });

});