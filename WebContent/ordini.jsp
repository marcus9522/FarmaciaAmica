<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page contentType="text/html; charset=ISO-8859-1" import="java.util.*,prodotto.ProductBean"%>
<%String email= (String) session.getAttribute("email");
Collection<?> products = (Collection<?>) request.getAttribute("prodotti2");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>I Miei Ordini</title>
<head>

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
</head>
<body>
 <%if(email == null){ %>
   <%@ include file ="sidebar.jsp" %>
   <%}else{  %>
   <%@ include file ="sidebarprotected.jsp" %>
   <%} %>
<div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">I Miei Ordini
                </h1>
            </div>
        </div>
            <%		
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();		
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
	                    </div>
	                </div>
	            </div>
	            <%} }%>
           

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