<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
/* Set the size of the div element that contains the map */
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}
</style>
</head>
<body>

	<h1>Welcome to Store Locator</h1>

	<div id="container">
		<div id="form">
			Enter PinCode: <input id="pincode" name="pincode" type="text" value="" /> <br>
			<br> <input type="button" value="search store" onclick="getStores(12345);" />

		</div>

		<div id="map"></div>

	</div>

	<script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: -25.344, lng: 131.036};
  // The map, centered at Uluru
  var map = new google.maps.Map(
  document.getElementById('map'), {zoom: 4, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
	<!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDKpewXV2qV0fucwoClofkOjwM67QdHFEE&callback=initMap"></script>
	<script type="text/javascript" src="static/js/jquery/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {

	    //alert("hi");

	});
	
	
	function getStores(pincode) {
		alert("hi");
	    $.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "/storelocatorjson",
	        timeout: 600000,
	        success: function (data) {	   
	        	//alert(data);
	            console.log("response : ", data);
	            alert(data);
	            /* for (i = 0; i < data.length; i++) {  
	                marker = new google.maps.Marker({
	                  position: new google.maps.LatLng(locations[i][1], locations[i][2]),
	                  map: map
	                });

	                google.maps.event.addListener(marker, 'click', (function(marker, i) {
	                  return function() {
	                    infowindow.setContent(locations[i][0]);
	                    infowindow.open(map, marker);
	                  }
	                })(marker, i)); */
	        },
	        error: function (e) {	          
	            console.log("ERROR : ", e);	          
	        }
	    });
	}
	
	</script>
</body>
</html>