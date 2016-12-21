<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page contentType="text/html; charset=ISO-8859-1" import="java.util.*,utente.UtenteBean"%>
    
    <% String done = (String) request.getAttribute("done");
       UtenteBean bean = (UtenteBean) request.getAttribute("utente");
       String email= (String) session.getAttribute("email");
      %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ModificaDati</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/my.css" rel="stylesheet">

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  
</head>
<body>
<%if(email == null){ %>
   <script type="text/javascript">
   alert("Devi loggarti per avere accesso a questa pagina")
   history.go(-1)
   </script>
   <%}else{  %>
   <%@ include file ="sidebarprotected.jsp" %>
   <%} %>
<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Modifica Dati </h1>
<div class="registrazione" align=center> 
<form action="utente?azione=update" name="registrazione" method="post">
<br>
<label for="email">E-MAIL:</label><br> 
		<input name="email" id="irec" type="text" maxlength="30" required value="<%=bean.getEmail() %>" disabled="disabled" ><br>
<label for="password">PASSWORD:</label><br> 
		<input name="password" id="irec" type="password" maxlength="15" value="<%=bean.getPassword() %>" required ><br>
<label for="nome">NOME:</label><br> 
		<input name="nome" id="irec" type="text" maxlength="15" required value="<%=bean.getNome() %>" ><br>
<label for="cognome">COGNOME:</label><br> 
		<input name="cognome" id="irec" type="text" maxlength="15" required value="<%=bean.getPassword() %>"><br>
<label for="data">DATA DI NASCITA:</label><br> 
		<input name="data_nascita" id="irec" type="date" value="<%=bean.getData_nascita() %>" max="<%=new java.sql.Date(System.currentTimeMillis()) %>" required ><br>		
<label for="cap">CAP:</label><br> 
		<input name="cap" id="irec" type="number"  maxlength="5" value=<%=bean.getCap() %> required><br>
<label for="via">VIA:</label><br> 
		<input name="via" id="irec" type="text" maxlength="25" value="<%=bean.getVia() %>" required ><br>
<label for="civico">CIVICO:</label><br> 
		<input name="civico" id="irec" type="number" maxlength="4" value= <%=bean.getCivico() %> required ><br>
<label for="citta">CITTA:</label><br> 
		<input name="citta" id="citta" type="text" maxlength="10" value="<%=bean.getCitta() %>" required ><br>
<label for="provincia">PROVINCIA:</label><br> 
		<input name="provincia" id="provincia" type="text" maxlength="2"  value="<%=bean.getProvincia() %>" required ><br>
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