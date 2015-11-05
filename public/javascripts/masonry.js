
// masonry
$(document).ready( function() {
  // init Masonry after all images have loaded
  var $grid = $('#masonry-grid').imagesLoaded( function() {
    $grid.masonry({
      itemSelector: '.grid-item',
      percentPosition: true,
      columnWidth: '.grid-sizer'
    }); 
	});
});