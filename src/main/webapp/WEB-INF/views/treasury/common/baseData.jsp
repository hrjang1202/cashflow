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
  padding: 40px 15px;
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
	         		<li class="active"><a href="/treasury/common/">Common</a></li>
	         		<li><a href="/treasury/dealing/">Dealing</a></li>
	       		</ul>
	     	</div>
	     	
	  	</div>
	  	
	</nav>
	
	
	<div class="container">
	
		<div class="content-template">
			
			<p>기초데이터 ID : <input type="text" size="20">
				<button type="button" onclick="location.href='/treasury/common/baseDataList'">조회</button>
			</p>
			
			<table class="table table-hover">
				<thead>
			    	<tr>
			      		<th>기초데이터 ID</th>
					    <th>기초데이터 코드1</th>
					    <th>기초데이터 코드2</th>	
					    <th>기초데이터 코드3</th>
					    <th>기초데이터 코드4</th>	
			    	</tr>
			  	</thead>
			  	<tbody>
			    	<c:forEach items="${baseDataList}" var="list">
					<tr>
					    <td>${list.base_data_id}</td>
					    <td>${list.base_data_code1}</td>
					    <td>${list.base_data_code2}</td>
					    <td>${list.base_data_code3}</td>
					    <td>${list.base_data_code4}</td>
					</tr>
					</c:forEach>
			    </tbody>
			</table>
			
		</div>
	
	</div>

</body>
</html>
