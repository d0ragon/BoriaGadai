<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*, authorization.User"%>

<!DOCTYPE html>
<html>
<head>
<script src="ExternalLogin.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="google-signin-client_id"
	 content="360066525699-udo2lm0hrdvgd8uconqsg9l54dnbgrdh.apps.googleusercontent.com">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="Homepage.css">
<title>Home</title>
</head>
<body>

	<div id="Navigation-bar"></div>

	<script>
		$(function() {
			$("#Navigation-bar").load("NavigationBar.html");
		});
	</script>
		
	<!-- google signout code -->
	
    <div id="divCheckbox" style="display: none;"><div class="g-signin2" data-onsuccess="onSignIn"></div></div>
	<script>function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	    });
	  }</script>
	
	<!--  end of google signout code -->

  <div class = wrap>
	<div class="container fortune-tellings">
	
		<div class="row">
			<a href="GameDescription.jsp?gameName=lottery&gameLink=Lottery.html">
					<img id=p4 class = predPic src="./Images/lottery-icon.png" onmouseover="onmousePic(this)" onmouseout="outmousePic(this)" >
				</a>
			
				<a class = predLink href="GameDescription.jsp?gameName=cookie&gameLink=Cookie.html">
				<img id=p1 class = predPic src="./Images/cookie-icon.png"  onmouseover="onmousePic(this)" onmouseout="outmousePic(this)">
				</a>
				<a class = predLink href="GameDescription.jsp?gameName=weather&gameLink=Weather.htm"> 
				 <img id=p2 class = predPic src="./Images/weather-icon.png" onmouseover="onmousePic(this)" onmouseout="outmousePic(this)">
				</a>
				<a class = predLink href="GameDescription.jsp?gameName=yesno&gameLink=YesNo.jsp"> 
				 <img id=p3 class = predPic src="./Images/yesno-icon.png" onmouseover="onmousePic(this)" onmouseout="outmousePic(this)">
				</a>		
		</div>
		<div class = finalRow>
			<a class = predLink href="GameDescription.jsp?gameName=tarot&gameLink=Tarot.html">
				<img  id = tarot class = predPic src="./Images/tarot-icon.png" onmouseover="onmousePic(this)" onmouseout="outmousePic(this)">
			</a>
		</div>
		
	</div>
	</div>
	
	
	
	<!-- 	<div id=popDiv class="col-xs-1 popularUsers">
		<h1 class="pop-users">ტოპ  მომხმარებლები</h1>
			<table class="table table-hover">
				<tbody>
					<tr>
						<td><a href="#">megobari1</a></td>
					</tr>
					<tr>
						<td><a href="#">megobari2</a></td>
					</tr>
					<tr>
						<td><a href="#">megobari3</a></td>
					</tr>
					<tr>
						<td><a href="#">megobari4</a></td>
					</tr>
				</tbody>
			</table>
		</div> -->

<script>
$(document).ready(function(){
	 $(".predPic").fadeIn(5000);
});

function onmousePic(x){	
	$(x).animate({width:"250px"},100);
}



function outmousePic(x){
	$(x).animate({width:"140px"},100);
}

</script>	

<script src="ChatRequest.js"></script>
<script src="checkUser.js"></script>
</body>
</html>

