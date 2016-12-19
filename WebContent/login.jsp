<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <% String done = (String) request.getAttribute("done");
   String email= (String) request.getAttribute("email");
   String password = (String) request.getAttribute("password"); 
   %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<style>
input {
    border: 5px solid white; 
    -webkit-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    -moz-box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    box-shadow: 
      inset 0 0 8px  rgba(0,0,0,0.1),
            0 0 16px rgba(0,0,0,0.1); 
    padding: 15px;
    background: rgba(255,255,255,0.5);
    margin: 0 0 10px 0;
}
</style>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="sidebar.jsp" %>
<form action="utente?azione=login" method="post">
	<div align=center>
	<br>

	<h2>Login Form</h2>
	<label for="email">E-mail</label> <br>
	<input id="email" type="text" name="email" id="email" placeholder="Inserisci email" required>
	<br>
	<label for="password">Password</label> <br>
	<input id="email" type="password" name="password" id="password" placeholder="Inserisci password" required>
	<br>
	<br>
	<input id="log" type="submit" value="Login"/>
	<input id="log" type="reset"  value="Reset"/>
</form>
<%done=request.getParameter("done"); %>
<%if(done!=null){ 
if(done.equalsIgnoreCase("no")){%>
<script>
alert("Email e/o password errati")
</script>
<%} } %>
</body>
</html>