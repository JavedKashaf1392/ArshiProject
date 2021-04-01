
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable ").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
 
 
$( '.navbar .container a' ).on( 'click', function () {
	$( '.navbar .container' ).find( 'a.active' ).removeClass( 'active' );
	$( this ).addClass( 'acti' );
});
 
 
 
setTimeout(function() {
			/*  $('#mydiv').fadeOut('fast'); */
			$('#mydiv').delay(300).fadeOut(100);
		}, 500); 
		


var modal = document.getElementById("myModal");


var btn = document.getElementById("myBtn");


var span = document.getElementsByClassName("close")[0];


btn.onclick = function() {
  modal.style.display = "block";
}


span.onclick = function() {
  modal.style.display = "none";
}


window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}		
});











