<script src="/includes/js/jquery-3.1.1.min.js"></script>
<cfprocessingdirective pageEncoding="utf-8">   
<script type="text/javascript">
    var position = {
      coords: {
        latitude: '',
        longitude: ''
      }
    };

$.getJSON("http://ip-api.com/json", function (data, status) {
  console.log(data);
        if(status === "success") {
            if(data) {
              if(data.zip != "")
                $.getJSON("http://maps.googleapis.com/maps/api/geocode/json?address=" + data.zip, function (data, status) {
                    if(status === "success") {
                        position.coords.latitude = data.results[0].geometry.location.lat;
                        position.coords.longitude = data.results[0].geometry.location.lng;
                        console.log(position.coords.latitude);
                        console.log(position.coords.longitude);
                    
                      //  locationOnSuccess(position);
                    } else {
                      alert("No se pudo realizar la conexion")
                     //   locationOnError();
                    }
                });

                else{
                  console.log("No se pudo realizar la conexión correspondiente");
                }      
            } 
          }
    });
 
</script>