
<style>

#container {
	width: 100%;
	overflow: hidden;
	margin: 10px;
}

#form {
	margin:10px;
}

.div-group {
    margin-bottom: 15px;
    float: left;
    margin-right: 1px;
    margin-left: 15px;
}

/* #StoreInfo {
	margin-left: 620px;
} */
/* Set the size of the div element that contains the map */
#map {	
	height: 350px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
	float: left
}

#pincode {
	width:70px
}
#startDatepicker {
	 width:120px;
}
 
</style>

<jsp:include page ="header.jsp"/>

<body>
	<div class="container">
	
	<div class="row" style="padding-bottom:10px">
		<form class = "form-inline" onSubmit= "return false;">
			<!-- <div class="div-group">
				<label for="pincode">Enter PinCode:</label>
			</div>-->
			<div class="div-group">			    
			    <input type="text"  class="form-control" id="pincode" name="pincode" maxlength="6" placeholder="Enter Pincode">
			 </div>
			 <div class="div-group">			    
			     <input type="text" id="startDatepicker" maxlength="14" class="form-control calendar" placeholder="Shopping Date" readonly="true">
			 </div>			
			 <div class="div-group">
			 	<button class="btn btn-default" onclick="getStores(12345);">Search Store</button>
			 </div>
		</form>
			<!-- Enter PinCode: <input id="pincode" name="pincode" type="text" value="" /> <br>
			<br> <input type="button" value="search store" onclick="getStores(12345);" /> -->
		</div>
		
		<div class="row">
		
		<div class="col-sm-12 col-lg-8">
		<div id="map"></div>
		</div>
		
		<div class="col-sm-12 col-lg-4">
			<!-- <div id="shoppingDate">
				<input type="text" id="startDatepicker" class="calendar" placeholder="Shopping Date" readonly="true">
			</div>-->
			<div id="StoreInfo" style="font-weight:bold;text-align:center;">
			</div> 		
		</div>
	</div>

	</div>

	<script>
		// Initialize and add the map
		var map;
		
		function initMap() {
		  // The location of Uluru
		  var uluru = {lat: 51.506665, lng: -0.127816};
		  
		  // The map, centered at Uluru
		  map = new google.maps.Map(document.getElementById('map'), {zoom: 13, center: uluru});
		  // The marker, positioned at Uluru
		  //var marker = new google.maps.Marker({position: uluru, map: map});
		   
		}
    </script>
	<!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDKpewXV2qV0fucwoClofkOjwM67QdHFEE&callback=initMap"></script>
	<script type="text/javascript" src="static/js/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/jquery/jquery-ui.min.js"></script>
	 <link href="static/css/datepicker.css" rel="stylesheet" />
	<script type="text/javascript">
	
	$(document).ready(function () {
		//$("#shoppingDate").hide();
		
		$('#startDatepicker').click(function(){
			$('#ui-datepicker-div').css('clip', 'auto');
		});
		
		var date = new Date();
		var currentMonth = date.getMonth();
		var currentDate = date.getDate();
		var currentYear = date.getFullYear();

		$('#startDatepicker').val("");		 
		$('#startDatepicker').datepicker({
			dateFormat : "yy-mm-dd",
			buttonImage: '../images/datapicker/calendar_icon.png',
			minDate : new Date(currentYear, currentMonth, currentDate),
			maxDate : new Date(currentYear, currentMonth, currentDate + 15),
			showAnim : "fold",
			onSelect : function(selected) {
				enableDisableGoBtn();
			}
		});

	});
	 
	function getStores(pincode) {
		//alert("hi");
	    $.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "/stores/search/" + pincode,
	        timeout: 600000,
	        success: function (data) {	   
	        	//alert(data);
	            console.log("response : ", data);
	           // alert(data);
	            //var myArr = JSON.parse(data);
	            //alert(myArr[0].name + "  " + myArr[0].geo.latitude);
	              var myArr = data;            	       
	              var infowindow = new google.maps.InfoWindow();

	              var marker, i;
	            
	            
	            for (i = 0; i < myArr.length; i++) {  
	            	//alert(myArr[i].geo.latitude + "  " + myArr[i].geo.longitude);
	                marker = new google.maps.Marker({
	                  position: new google.maps.LatLng(myArr[i].geo.latitude, myArr[i].geo.longitude),
	                  map: map
	                });

	                google.maps.event.addListener(marker, 'click', (function(marker, i) {
	                  return function() {
	                    infowindow.setContent(myArr[i].name);
	                    infowindow.open(map, marker);
	                    showStoreInfo(myArr[i].name, myArr[i].formattedAddress, myArr[i].id);
	                  }
	                })(marker, i)); 
	            }
	        },
	        error: function (e) {	          
	            console.log("ERROR : ", e);	          
	        }
	    });
	}
	
	function showStoreInfo(storeName, address, id) {
		//alert("id: " + id);
		var storeNameHtml = "<span>" + storeName + "</span><br>";
		var addressHtml = "<span>" + address + "</span><br>";
		//var pincodeHtml = "<span>" + pincode + "</span><br>";
		var chooseStoreLink = "<span><a href='/storeslot?id=" + id +"'>Book your till</a> </span><br>";		
		var finalHtml = storeNameHtml + addressHtml + chooseStoreLink;
		//$("#shoppingDate").addClass("showshoppingDate");
		//$("#shoppingDate").show();
		$("#StoreInfo").html(finalHtml);
		
	}
	
	</script>
</body>

<jsp:include page ="footer.jsp"/>
</html>