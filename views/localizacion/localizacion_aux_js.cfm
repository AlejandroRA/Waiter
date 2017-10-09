<script src="/includes/js/jquery-3.1.1.min.js"></script>
<cfprocessingdirective pageEncoding="utf-8">    
<script type="text/javascript">
	var map;
	function myMap() {
        //showPosition(10);
		//getLocation();
		var mapProp= {
    		center:new google.maps.LatLng(10,10),
    		zoom:15,
		};
		map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
	}

</script>