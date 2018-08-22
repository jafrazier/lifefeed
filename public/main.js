$('.allPost').hide()
$('.allPosts').click(function(){
  $('.allPost').slideToggle(1000)
});
$('.sure').hide()
$('.setting').hide()
$('.mySet').click(function(){
  $('.setting').slideToggle(1000)
});

$('.delete').click(function(){
  $('.sure').slideToggle(1000)
});

$('.close').click(function(){
  $('.setting').hide()
  $('.sure').hide()
});
