<style>
.h1style {
	display: block;
    margin-left: auto;
    margin-right: auto;
    width: 80%;
}

.bgimg {
    background-image: url('../images/home.png');
}

.container{
	height: 75%;
    max-width: 700px;
    margin: auto;
}

.userImage{
	  display: block;
	  margin-left: auto;
	  margin-right: auto;
	  width: 50%;
}

.healthCardInfo{
	font-size: 3.2rem;
    /* display: block;
    margin-left: auto;
    margin-right: auto;
    width: 50%; */
    
  width: 60%;   
 /*  border: 1px solid red; */
  margin-right: 10px;
  float: left;
}

.healthCardQRCode{
	width: 30%;   
 /*  border: 1px solid red; */
  margin-right: 10px;
  float: left;
}

.userNameDiv{
	margin:10px;
}

.distanceTravelledDiv{
	margin:10px;
}

.healthCardPointsDiv{
	margin:10px;
}

</style>
<body>
<jsp:include page ="header.jsp"/>

<div id="container" class="container">
	<h1 class="h1style">Tesco Carpoolcard Account</h1>
	<div class="accountInfo">
		<div id="userImage" class="userImage">
			<img alt="" src="../images/defaultavtar.png">		
		</div>
		<div>
			<div id="healthCardInfo" class="healthCardInfo">
				<div id="userNameDiv" class="userNameDiv">
					<span id="userNameLabel">Name:</span>
					<span id="userName"></span>
				</div>
				<div id="distanceTravelledDiv" class="distanceTravelledDiv">
					<span id="distanceTravelledLabel">Distance:</span>
					<span id="distanceTravelled"></span>
				</div>
				<div id="healthCardPointsDiv" class="healthCardPointsDiv">
					<span id="healthCardPointsLabel">Points:</span>
					<span id="healthCardPoints"></span>
				</div>									
			</div>
			<div id="healthCardQRCode" class="healthCardQRCode">
				<!-- <img alt="" src="../images/sampleQrCode.png"> -->	
			</div>
		</div>
	</div>
</div>
<jsp:include page ="footer.jsp"/>	
</body>
<script type="text/javascript" src="static/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery/jquery-ui.min.js"></script>
<script>
	
	$(document).ready(function () {
		//alert("hi called ready method");
		callHealthCardBarCodeService();
		callHealthCardDataService();
	});
	
	function callHealthCardBarCodeService() {
		
		$.ajax({
            url: "http://localhost:8080/miles/qrcode",
            data: "", //ur data to be sent to server
            contentType: "image/png;", 
            type: "GET",
            success: function (data) {
               //console.log("Service Response:" + JSON.stringify(data));
               //alert(JSON.stringify(data));
               populateQRCodeHtml(data);
            },
            error: function (x, y, z) {
               alert(x.responseText +"  " +x.status);
            }
        });
	}
	
	function populateQRCodeHtml(data) {
		var img = '<img src="' + data + '">';
		$("#healthCardQRCode").html(img);		 
	}
	
	function callHealthCardDataService() {
		
		$.ajax({
            url: "http://localhost:8080/miles/carpool",
            data: "", //ur data to be sent to server
            contentType: "application/json; charset=utf-8", 
            type: "GET",
            success: function (data) {
               console.log("Service Response:" + JSON.stringify(data));
               //alert(JSON.stringify(data));
               populateHtml(data);
            },
            error: function (x, y, z) {
               alert(x.responseText +"  " +x.status);
            }
        });
	}
	
	 
	function populateHtml(data) {
		$("#userName").html(data.name);
		$("#distanceTravelled").html(data.kms + " KM");
		$("#healthCardPoints").html(data.points);
	}

</script>
</html>