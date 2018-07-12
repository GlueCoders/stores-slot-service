
<style>
#container {
	width: 100%;
	overflow: hidden;
	margin: 10px;
}


.slot {
	margin: 10px 35px;
	background-color: #0000ff2e;
    text-align: center;
	border: 1px solid blue;
	float: left;
	padding: 10px;
}

#form {
	margin:10px;
}
#StoreInfo {
	/*margin-left: 100px;*/
	text-align: center;
}
</style>
</head>
<jsp:include page ="header.jsp"/>
<body>

	<div class="container" style="font-weight:bold">
		<div id="storeInfo">
		
		
		</div>	
	 
		<div  id="slots">
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
	   getStoreSlotInfo(id);

	});
	
	function getStoreSlotInfo(id) {
		//alert("fetching slots")
		 $.ajax({
		        type: "GET",
		        contentType: "application/json",
		        url: "/stores/" + id ,
		        timeout: 600000,
		        success: function (data) {	   
		        	//alert(data);
		            console.log("response : ", data);
		           	//alert(data);
		           	showStoreInfo(data.name, data.formattedAddress, "12345");
		            showSlots(data);		             		           		          		            		            
		        },
		        error: function (e) {	          
		            console.log("ERROR : ", e);	          
		        }
		    });
	}
	
	function showSlots(data) {
		//alert(data.slots.length);
		var slotsHtml = "";
		for (i = 0; i < data.slots.length; i++) { 
			var url = "/stores/" + data.id + "/book?slotTime=" + data.slots[i].timeSlot;
			//var url = "/slotconfirmation?id=" + data.id + "&timeslot=" + data.slots[i].timeSlot;
       	 	var slot = "<div class='slot'><a href='" + url + "'><span>" + data.slots[i].timeSlot + "</span><br><span>capacity:" + data.slots[i].capacity+ "</span><br><span>booked:" + data.slots[i].booked + "</span></div>";
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
<jsp:include page ="footer.jsp"/>
</html>