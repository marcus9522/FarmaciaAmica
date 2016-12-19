<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String done = (String) request.getAttribute("done");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrazione</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
</head>
<body>
<%@ include file="sidebar.jsp" %>
<div class="registrazione" align=center> 
<form action="utente?azione=registrati" name="registrazione" method="post">
<br>
<h3>FORM DI REGISTRAZIONE</h3>
<label for="email">E-MAIL:</label><br> 
		<input name="email" id="irec" type="text" maxlength="30" required placeholder="Inserisci e-mail" ><br>
<label for="password">PASSWORD:</label><br> 
		<input name="password" id="irec" type="password" maxlength="15" required placeholder="Inserisci password"><br>
<label for="nome">NOME:</label><br> 
		<input name="nome" id="irec" type="text" maxlength="15" required placeholder="Inserisci il tuo nome"><br>
<label for="cognome">COGNOME:</label><br> 
		<input name="cognome" id="irec" type="text" maxlength="15" required placeholder="Inserisci il tuo cognome"><br>
<label for="data">DATA DI NASCITA:</label><br> 
		<input name="data_nascita" id="irec" type="date" max="<%=new java.sql.Date(System.currentTimeMillis()) %>" required ><br>		
<label for="cap">CAP:</label><br> 
		<input name="cap" id="irec" type="number" maxlength="5" required placeholder="Inserisci il cap"><br>
<label for="via">VIA:</label><br> 
		<input name="via" id="irec" type="text" maxlength="25" required placeholder="Inserisci la via"><br>
<label for="civico">CIVICO:</label><br> 
		<input name="civico" id="irec" type="number" maxlength="4" required placeholder="Inserisci il civico"><br>
<label for="citta">CITTA:</label><br> 
		<input name="citta" id="citta" type="text" maxlength="10" required placeholder="Inserisci città"><br>
<label for="provincia">PROVINCIA:</label><br> 
		<input name="provincia" id="provincia" type="text" maxlength="2" required placeholder="Inserisci provincia"><br>
		<p></p>
   <input id="registra" type="submit" value="Invia">
  <input id="registra" type ="reset" value="Reset"/>	 
  </form>
</div>
<%if(done!=null){ 
if(done.equalsIgnoreCase("true")){%>
<script>
alert("Email già presente nel database")
history.go(-1);
</script>
<%} %>
<% if(done.equalsIgnoreCase("false")){%>
<script>
alert("Registrazione effettuata")
</script> 
<%}
   }  %>
</body>
</html>