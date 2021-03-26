




$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable ").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
 
 
 $( '.navbar .container a' ).on( 'click', function () {
	$( '.navbar .container' ).find( 'a.active' ).removeClass( 'active' );
	$( this ).addClass( 'active' );
});
 
 
 
setTimeout(function() {
			/*  $('#mydiv').fadeOut('fast'); */
			$('#mydiv').delay(300).fadeOut(100);
		}, 500); 
		
		
	 
 
});











