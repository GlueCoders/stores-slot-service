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

#slots {
	width: 850px;
	height: 600px;
	margin: 20px;
}

.slot {
	width: 150px;
	height: 100px;
	margin: 20px;
	border: 1px solid;
	float: left;
	padding: 10px;
}

#form {
	margin:10px;
}
#StoreInfo {
	margin-left: 100px;
}
</style>
</head>
<body>

	<h1>Store Token Page</h1>

	<div id="container">
		<div id="storeInfo">
		
		
		</div>		 
		<div id="slots">
			<!-- <div class="slot">			
			</div>		
			<div class="slot">
			</div>
			<div class="slot">
			</div>
			<div class="slot">
			</div>
			<div class="slot">						
			</div>-->		
		</div>		
	</div>

	<script type="text/javascript" src="static/js/jquery/jquery.min.js"></script>

	<script type="text/javascript">
	$(document).ready(function () {
		var id = getQueryStringValue("id");
		alert(id);
	   getStoreSlotInfo(id);

	});
	
	function getStoreSlotInfo(id) {
		alert("fetching slots")
		 $.ajax({
		        type: "GET",
		        contentType: "application/json",
		        url: "/stores/" + id ,
		        timeout: 600000,
		        success: function (data) {	   
		        	//alert(data);
		            console.log("response : ", data);
		           	alert(data);
		           	showStoreInfo(data.name, data.formattedAddress, "12345");
		            showSlots(data);
		             		           		          		            
		            
		        },
		        error: function (e) {	          
		            console.log("ERROR : ", e);	          
		        }
		    });
	}
	
	function showSlots(data) {
		alert(data.slots.length);
		var slotsHtml = "";
		for (i = 0; i < data.slots.length; i++) { 
			var url = "/stores/" + data.id + "/book?slotTime=" + data.slots[i].timeSlot;
       	 	var slot = "<div class='slot'><span>" + data.slots[i].timeSlot + "</span><br><span>capacity:" + data.slots[i].capacity+ "</span><br><span>booked:" + data.slots[i].booked + "</span><br><span><a href='" + url + "'>Book Slot</a></span></div>";
       	 	slotsHtml += slot;
        }		
		$("#slots").html(slotsHtml);
	}
	 
	function getQueryStringValue (key) {  
		  return decodeURIComponent(window.location.search.replace(new RegExp("^(?:.*[&\\?]" + encodeURIComponent(key).replace(/[\.\+\*]/g, "\\$&") + "(?:\\=([^&]*))?)?.*$", "i"), "$1"));  
		}  

	
	function showStoreInfo(storeName, address, pincode) {
		var storeNameHtml = "<span>" + storeName + "</span><br>";
		var addressHtml = "<span>" + address + "</span><br>";		 
		//var chooseStoreLink = "<span><a href=''>Select Store</a> </span><br>";
		
		var finalHtml = storeNameHtml + addressHtml;
		
		$("#storeInfo").html(finalHtml);
		
	}
	
	</script>
</body>
</html>