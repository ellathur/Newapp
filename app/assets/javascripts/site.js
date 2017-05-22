var refreshRating = function() {
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
};

$(document).on('turbolinks:load ajaxSuccess', function(){
   $(".alert").delay(4000).fadeOut("slow");
     refreshRating();

     /* elevateZoom*/
     $('.img-zoom').elevateZoom({
       zoomType: "lens",
       lensShape: "round",
       lensSize: 300,
       lensFadeIn: 500,
       lensFadeOut: 500
    });
});
