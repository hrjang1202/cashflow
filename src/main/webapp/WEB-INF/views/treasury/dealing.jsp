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
			<p><a href="/treasury/dealing/fxNew">FX신규</a></p>
			<p><a href="/treasury/dealing/swapNew">스왑신규</a></p>
			<p><a href="/treasury/dealing/bondBaseInfo">채권기본정보조회</a></p>
		</div>
	
	</div>
	
</body>
</html>

