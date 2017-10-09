<script src="/includes/js/jquery-3.1.1.min.js"></script>
<cfprocessingdirective pageEncoding="utf-8">    
<script type="text/javascript">
    //https://developers.google.com/maps/documentation/javascript/examples/
	var long_add;
	var lat_add;
	var map;
	var marks = [];
    var geocoder;
	$(document).ready(function(){
      
    $('#inModalAddress').on('hidden.bs.modal', function () {
      $(this).find('input').val('');
    });
        
	});
  function localizarAdd(){
    console.log("Se acepto la consulta");
    if($("#address").val() == "")
      return false;
    var inAddrr = $("#address").val();
    document.getElementById("formAddress").reset();
    geoCoderAddress(inAddrr);
     $("#inModalAddress").modal('toggle');
  
  }
  function showModalAddress(){
    $("#inModalAddress").modal('toggle');
  }
	function currentLocation(){
        getLocation();
    }
  function userAddress(){
    var dataAdd = <cfoutput>'#session.cbstorage.usuario.address#'</cfoutput>;
    geoCoderAddress(dataAdd);

  }
  function geoCoderAddress(strAdd){
        geocoder = new google.maps.Geocoder();
        geocoder.geocode({'address': strAdd}, function(results, status) {
            if (status === 'OK') {
                map.setCenter(results[0].geometry.location);
            }
            else{
                alert('Geocode was not successful for the following reason: ' + status);
            }
         });

    }
    
	function getLocation() {
        //var coords;
        $.getJSON("http://ip-api.com/json", function (data, status) {
            if(status === "success") {
                map.setCenter( {lat: data.lat, lng: data.lon});
            }
        });
        
	}
	function showPosition(coords) {
		var mapProp= {
    		center:new google.maps.LatLng(21.5113041,-104.8950863),
    		zoom:15,
		};
		map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		geocoder = new google.maps.Geocoder();
        <cfoutput>
            <cfloop query="#prc.restaurantes#">
                var address = "#DELEGACION#" +" "+ "#COLONIA#" +" "+#CODIGOPOSTAL#+ " " + "#CALLE#"+ " "+"#NUMEXT#"; 
                var nombre = "#NOMBRE#";
                var id = #ID#;
                putMarker(geocoder,map,id,nombre,address);
            </cfloop>  
        </cfoutput>
	}
	function myMap() {
        showPosition();
		//getLocation();
	}
	function putMarker(geocoder, resultsMap,id,nombre,address){
		/*Info window*/
		
		 var contentString = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">'+nombre+'</h1>'+
            '<div id="bodyContent">'+
            '<p>'+address+'</p>'+
            '<center><a class="btn btn-primary" href="/index.cfm//localizacion/localizacion/consultar?id='+id+'">Ver más</a></center>'+
            '</div>'+
            '</div>';
        console.log(contentString);
        
        var infowindow = new google.maps.InfoWindow({
          content: contentString,
          maxWidth: 200
        });
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
           var image = "/includes/img/localizacion/food.png";
            var marker = new google.maps.Marker({
              map: resultsMap,
              icon: image,
              animation: google.maps.Animation.DROP,
              position: results[0].geometry.location
            });
            marker.addListener('click', function() {
          		infowindow.open(resultsMap, marker);
        	});
        	marks.push(marker);
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
	}
</script>