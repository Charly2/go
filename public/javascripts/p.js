/**
 * Created by Charly on 10/03/2017.
 */




var img = "";

function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object

    // Loop through the FileList and render image files as thumbnails.
    for (var i = 0, f; f = files[i]; i++) {

      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }

      var reader = new FileReader();

      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          // Render thumbnail.
          var span = document.createElement('span');
          span.innerHTML = ['<img id="re" class="thumb" src="', e.target.result,
                            '" title="', escape(theFile.name), '"/>'].join('');
          document.getElementById('list').insertBefore(span, null);
        };
        img = e.target.result;
      })(f);

      // Read in the image file as a data URL.
      reader.readAsDataURL(f);

      
    }
  }


    
  document.getElementById('files').addEventListener('change', handleFileSelect, false);


$('#sa').on('submit',function(){

	var a =document.getElementById('re');
	console.dir(a.src);
	$('#res').val(a.src);
});