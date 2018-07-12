<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>

#container {
	width: 100%;
	overflow: hidden;
	margin: 10px;
}

#form {
	margin:10px;
}
#StoreInfo {
	margin-left: 620px;
}
/* Set the size of the div element that contains the map */
#map {	
	height: 400px; /* The height is 400 pixels */
	width: 600px; /* The width is the width of the web page */
	float: left
}
</style>
</head>
<body>

	<h1>Store Token Page</h1>

	<div id="container">
		 
				
		 
		
		<div id="StoreInfo">
			 
		</div>
		

	</div>

	<script>
// Initialize and add the map
 
    
	<script type="text/javascript" src="static/js/jquery/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {

	    //alert("hi");

	});
	
	
	 
	
	function showStoreInfo(storeName, address, pincode) {
		var storeNameHtml = "<span>" + storeName + "</span><br>";
		var addressHtml = "<span>" + address + "</span><br>";
		var pincodeHtml = "<span>" + pincode + "</span><br>";
		var chooseStoreLink = "<span><a href=''>Select Store</a> </span><br>";
		
		var finalHtml = storeNameHtml + addressHtml + pincodeHtml + chooseStoreLink;
		
		$("#StoreInfo").html(finalHtml);
		
	}
	
	</script>
</body>
</html>