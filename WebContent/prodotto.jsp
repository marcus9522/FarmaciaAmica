<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page contentType="text/html; charset=ISO-8859-1" import="java.util.*,prodotto.ProductBean"%>
    
<!DOCTYPE html>
<html>
<head>
<%String email= (String) session.getAttribute("email");
  ProductBean product = (ProductBean) request.getAttribute("prodotto");%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=product.getNome()%></title>
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
<script type="text/javascript">
var site = window.location.href
if(site.indexOf("add=yes")!=-1) {alert("Prodotto aggiunto al carrello")}
</script>
<%if(email == null){ %>
   <%@ include file ="sidebar.jsp" %>
   <%}else{  %>
   <%@ include file ="sidebarprotected.jsp" %>
   <%} %>
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Info
                    <small><%=product.getNome() %></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="product2">Home</a>
                    </li>
                    <li class="active"><%=product.getNome() %></li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Intro Content -->
        <div class="row">
            <div class="col-md-6">
                <img class="img-responsive" src="<%= product.getFoto() %>" alt="">
            </div>
            <div class="col-md-6">
                <h2><%= product.getNome()%></h2>
                <p><%=product.getDescrizione() %>  </p>
               <br>
                <b><p>Prezzo: <%=product.getPrezzo()%> &euro;</p></b>
            </div>
            <%if (email!=null) {%>
	                    <div align="center"><a href="Cart?action=addC&nomeprodotto=<%=product.getNome()%>"><button>Aggiungi al carrello</button></a></div>
	                    <%}else{  %>
	                    <div align="center"><a href="login.jsp"><button>Effettua il login per aggiungere al carrello</button></a></div>
	                    <%} %>
        </div>
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
