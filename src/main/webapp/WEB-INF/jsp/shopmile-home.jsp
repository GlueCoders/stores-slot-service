<style>

.bgimg {
    background-image: url('../images/home.png');
}

.shopmilecontainer{
	width:50%;
	height: 75%;
    max-width: 700px;
    margin: auto;
}

.userOptions{
	font-size: 3.2rem;
	    width: 90%;
    margin-left: auto;
    margin-right: auto;
    display: block;
}

.userOptions div{
	margin:20px;
	text-align: center;
}
.shopmileHealthCardPage:hover{
	background-color: #00284C;
}

.shopmileCarPoolCardPage:hover{
	background-color: #00284C;
}

.clubcardPage:hover {
	background-color: #00284C;
}
</style>
<body>
<jsp:include page ="header.jsp"/>

<div id="shopmilecontainer" style="width:30%; height: 75%; max-width: 700px; margin: auto;">
	<div id="userOptions" class="userOptions">
		<div id="clubcardPage" class="clubcardPage">
			<a href="/shopmileclubcard">
				My Clubcard Account
			</a>
		</div>
		<div id="shopmileHealthCardPage" class="shopmileHealthCardPage">
			<a href="/shopmilehealthcard">
				My Healthcard Account
			</a>
		</div>
		<div id="shopmileCarPoolCardPage" class="shopmileCarPoolCardPage">
			<a href="/shopmilecarpoolcard">
				My Carpool Account
			</a>
		</div>	
		<div id="myorders" class="shopmileCarPoolCardPage">
			<a href="#">
				My Orders
			</a>
		</div>	
		<div id="editProfile" class="shopmileCarPoolCardPage">
			<a href="#">
				Edit Profile
			</a>
		</div>	
		<div id="changePassword" class="shopmileCarPoolCardPage">
			<a href="#">
				Change Password
			</a>
		</div>	
	</div>			
</div>
<jsp:include page ="footer.jsp"/>	

</body>
</html>