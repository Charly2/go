var _Nombre ="";

$(window).ready(function(){
  swal("Escribe aquí tu nombre:", {
    content: "input",
  })
  .then((value) => {
    swal(`Tu Nombre es: ${value}`);
    _Nombre=value;
  });
});

var socket = io('//'+document.location.hostname+':'+document.location.port);
socket.on('save', function (val) {
	console.log(val)
    console.log("AddUser");
    var tm = "<li id='p" + val.idproducto + "'> <strong>Nombre: <strong>"+val.nombre+" <br> <strong>Precio: <strong>"+val.precio+" <br> <strong>Stock: <strong>"+val.stock+" <br> <img class='imag' src='"+val.img+"'> </li>" ;
    var aux = $('.my-new-lists').html();
    $('.my-new-lists').html(aux + tm)
    window.location.reload();
    
});

socket.on('getAll', function (data) {
    console.log("GetALL");
    //console.log(data);
});



var car = [];
function addCart(e,n){
	console.log(e+n);
	$('#carBody').append("<p>"+n+"</p>");
	car.push(n);
}

$('#listo').on('click',function(){
  var aux = "";
  for (c in car){
    aux = aux + car[c] +",";
    console.log(aux);
  }
  console.log(aux);
	$.post( "/carrito", {'c': aux,'n':_Nombre}).done(function( data ) {
		
    swal("Listo!", "Se guardo el carrito!", "success").then((value) => {
      window.location.reload();
    })

	    
	  });
})

$.getJSON( "/producto", function( data ) {
  var items = [];
  $.each( data, function( key, val ) {
  	console.log(val)
    items.push( "<li id='p" + val.idproducto + "'> <strong>Nombre: </strong>"+val.nombre+" <br> <strong>Precio: </strong>"+val.precio+" <br> <strong>Stock: </strong>"+val.stock+" <br> <img class='imag' src='"+val.img+"'> <button onclick='addCart("+val.idproducto+",\""+val.nombre+"\")'>Agregar</button> </li>" );
  });
 
  $( "<ul/>", {
    "class": "my-new-list",
    html: items.join( "" )
  }).appendTo( ".app" );
});

