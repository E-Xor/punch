$(function(){

  var $menuSelector = $("ul.punch-nav-menu > li > a");
  if(window.location.pathname == '/employees') {
    $($menuSelector[1]).addClass('punch-active-menu');
  }
  else {
    $($menuSelector[0]).addClass('punch-active-menu');
  }
  $menuSelector.click(function(e){
    $menuSelector.removeClass('punch-active-menu'); // remove from all menu items
    $(e.target).addClass('punch-active-menu');
  });
});
