<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page contentType="text/html; charset=ISO-8859-1" import="java.util.*,prodotto.ProductBean,acquista.Cart"%>
    <%String email= (String) session.getAttribute("email");
   Cart cart = (Cart) request.getSession().getAttribute("cart");%>
<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carrello</title>
<head>

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
   <%@ include file ="sidebar.jsp" %>
   <%}else{  %>
   <%@ include file ="sidebarprotected.jsp" %>
   <%} %>
 <%if(cart!=null) 
 if(cart.getProducts().isEmpty()==false){%>
<div class="container">
       
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Carrello</h2>
            </div>
            <%		
            double totale = 0;
            List<ProductBean> prodcart=cart.getProducts();
	        for(ProductBean bean:prodcart){
					%>
					
					<div class="col-md-4 text-center">
	                <div class="thumbnail">
	                <a href="product?action=prodotto&nomeProdotto=<%=bean.getNome()%>">
	                    <img class="img-responsive" src="<%=bean.getFoto()%>" alt="">
	                    </a>
	                    <div class="caption">
	                        <h3><%=bean.getNome()%><br>
	                            <small><%=bean.getPrezzo()%> &euro;</small>
	                        </h3>
	                        <p><%=bean.getDescrizione()%></p>
	                        <a href="Cart?action=deleteC&nomeprodotto=<%=bean.getNome()%>"><button>Elimina</button></a>
	                    </div>
	                </div>
	            </div>
	            <%totale+=bean.getPrezzo();%>
	            <%} %>
                    </div>
            <div align = center> <h3>Totale = <%=totale %> &euro;</h3></div>
      
<div align = right>
<form action="acquista?azione=insert" method="post" >
<label for="email">NUMERO CARTA:</label> 
		<input name="ncarta" type="text" maxlength="30" required placeholder="Inserisci il numero della carta" >
<label for="email">DATA SCADENZA CARTA:</label> 
		<input name="date" type="date" min="<%=new java.sql.Date(System.currentTimeMillis()) %>" maxlength="30" required placeholder="Inserisci il numero della carta" >
<label for="email">CVV/CVV2:</label> 
		<input name="ncarta" type="number" max=999 required placeholder="Inserisci il numero della carta" >
<label>URGENZA</label>
<select name="urgenza">
         <option value="Bassa">Bassa</option>
         <option value="Media">Media</option>
	     <option value="Alta">Alta</option>	     
	     </select>
</div>
<div align = center><input id="carrello" type="submit" value="Conferma"></div>
<br>
</form>
<%} %>           
 <%if((cart==null)||(cart.getProducts().isEmpty()==true)) { %>
 <div align = center><h1>Carrello Vuoto</h1></div>
 <%} %>    
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; FarmaciaAmica 2016</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
