var socket = io('//'+document.location.hostname+':'+document.location.port);
var x;
socket.on('carrito', function (data) {
    
    
    var aux = data.c.split(',');
    var tmp = "<div class='carrito'><h3> Carrito de "+data['n']+"</h3><ul> ";
    for(i in aux){
    	if(aux[i] != "") {
			tmp = tmp + "<li>"+aux[i]+"</li>";
    	}
    	
    }
    tmp+="</ul></div>"
    $('.body').append(tmp);
    
});


$.getJSON( "/carsData", function( data ) {
  var items = [];
  $.each( data, function( key, val ) {
  	console.log(val)
  	var aux = val.prod.split(',');
    var tmp = "<div class='carrito'><h3> Carrito de "+val.user+"</h3><ul> ";
    for(i in aux){
    	if(aux[i] != "") {
			tmp = tmp + "<li>"+aux[i]+"</li>";
    	}
    	
    }
    tmp+="</ul></div>"
    $('.body').append(tmp);
    
  });
 
  
});