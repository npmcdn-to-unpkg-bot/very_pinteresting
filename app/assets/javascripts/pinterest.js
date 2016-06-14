function fireMasonry(){
  $('.pinterest-grid').imagesLoaded(function(){
    $('.pinterest-grid').masonry({
      itemSelector: '.pin-item',
      columnWidth: '.pin-item'
    });
  });
}

$(document).ready(fireMasonry);
$(document).on('page:load', fireMasonry);
