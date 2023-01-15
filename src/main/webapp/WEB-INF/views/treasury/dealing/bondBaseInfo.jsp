<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
body {
  padding-top: 50px;
}
.content-template {
  padding: 20px 0px;
  text-align: left;
}
</style>
<script>

$(document).ready(function() {
	
	$("#btn_search").click(function() {
		
		console.log("btn_search click");

		//요청 data 조립
	    var requestData = new Object();
		
	    $.ajax({
	    	
	    	contentType: "application/json",
	    	dataType: "json",
	    	data: JSON.stringify(requestData),
	    	url: "/treasury/dealing/bondBaseInfo/search", 
            type: "POST",
            success: function (responseData) {
             	
             	console.log(responseData);
                
             }
	    });
		    
	});
	
});

</script>
</head>

<body>

	 <nav class="navbar navbar-inverse navbar-fixed-top">
	 
	 	<div class="container">
	 	
	    	<div class="navbar-header">
	        	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		         	<span class="sr-only">Toggle navigation</span>
		         	<span class="icon-bar"></span>
		         	<span class="icon-bar"></span>
		         	<span class="icon-bar"></span>
	      		</button>
	       		<a class="navbar-brand" href="/treasury">Treasury</a>
	     	</div>
	     	
	     	<div id="navbar" class="collapse navbar-collapse">
	       		<ul class="nav navbar-nav">
	         		<li><a href="/treasury/common/">Common</a></li>
	         		<li class="active"><a href="/treasury/dealing/">Dealing</a></li>
	       		</ul>
	     	</div>
	     	
	  	</div>
	  	
	</nav>
	
	
	<div class="container">
	
		<div class="content-template">
		
			법인등록번호 : <input type="text" id="crno">
			채권발행인명 : <input type="text" id="bondIsurNm">
			<button class="btn btn-primary" id="btn_search">조회</button>
				
		</div>
	
	</div>

</body>
</html>
