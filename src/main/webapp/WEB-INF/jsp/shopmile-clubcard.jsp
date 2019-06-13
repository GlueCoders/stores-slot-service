<style>
.h1style {
	display: block;
    margin-left: auto;
    margin-right: auto;
    width: 88%;
}

.bgimg {
    background-image: url('../images/home.png');
}

.clubcardcontainer{
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

.accountInfo img{
	    width: 70%;
}

</style>
<body>
<jsp:include page ="header.jsp"/>

<div id="container" class="clubcardcontainer">
	<h1 class="h1style">Tesco Clubcard Account</h1>
	<div class="accountInfo">		 
		<img alt="" src="../images/clubcardpage.png">				 		 
	</div>
</div>
<jsp:include page ="footer.jsp"/>	
</body>
<script type="text/javascript" src="static/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery/jquery-ui.min.js"></script>
<script>
	
	$(document).ready(function () {
		//alert("hi called ready method");
		callHealthCardDataService();
	});
	
	function callHealthCardBarCodeService() {
		
		$.ajax({
            url: "http://localhost:8080/miles/health",
            data: "", //ur data to be sent to server
            contentType: "image/png; charset=utf-8", 
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
	
	function callHealthCardDataService() {
		
		$.ajax({
            url: "http://localhost:8080/miles/health",
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