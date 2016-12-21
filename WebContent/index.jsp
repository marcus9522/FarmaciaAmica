<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page contentType="text/html; charset=ISO-8859-1" import="java.util.*,prodotto.ProductBean"%>
    
    <%String email= (String) session.getAttribute("email");
    Collection<?> products = (Collection<?>) request.getAttribute("prodotti2");%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FarmaciaAmica</title>

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
    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide One');">
                <div align="center"><img width="1080" height="400"  src="http://www.mecretaildesign.com/amministrazione/images/slide/212/Farmacia-comunale-3.jpg">
                </div>
                </div>
                <div class="carousel-caption">
                    <h2></h2>
                </div>
            </div>
            <div class="item" >
                 <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Two');">
                 <div align="center"><img width="1080" height="400"  src="http://formiche.net/thumb/580x950/2015/02/10051/ac/zc1/q100/formiche-farmacie-ddl-concorrenza.jpg">
                 </div>               
                <div class="carousel-caption">
                    <h2></h2>
                </div>
            </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Three');">
                <div align="center"><img width="1080" height="400"  src="http://static.tantasalute.it/r/843X0/www.tantasalute.it/img/anziani-farmaci-originali-brand-generici.jpg">
                </div>
                <div class="carousel-caption">
                    <h2></h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Benvenuti in FarmaciaAmica
                </h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Consegna Rapida</h4>
                    </div>
                    <div class="panel-body">
                        <p>FarmaciaAmica inoltrerà il tuo ordine alla farmacia più vicina alla tua posizione, in questo modo potrai ricevere i tuoi farmaci in breve tempo e comodamente a casa.</p>
                     
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-medkit"></i> Un vasto catalogo</h4>
                    </div>
                    <div class="panel-body">
                        <p>FarmaciaAmica mette a disposizione una vasta scelta di medicinali adatte a tutte le esigenze, inoltre
                           il motore di ricerca presente all'interno della piattaforma ti aiuterà a trovare il farmaco che cerchi facilmente. </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i> Facile da utilizzare</h4>
                    </div>
                    <div class="panel-body">
                        <p>La piattaforma è stata implementata in modo da risultare di semplice utilizzo anche a persone meno esperte nel campo informatico.<br>
                        Ogni operazione della piattaforma è reversibile e potrai tornare allo stato precendente in qualunque momento senza conseguenze.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Prodotti</h2>
            </div>
            <%		
            int i=0;
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()&& i<5) {
					ProductBean bean = (ProductBean) it.next();
		%>
            <div class="col-md-4 col-sm-6">
                <a href="product?action=prodotto&nomeProdotto=<%=bean.getNome()%>">
                    <img class="img-responsive img-portfolio img-hover" src="<%= bean.getFoto() %>" alt="" width="300" height="150">
                </a>
                            </div>
                            <br>
                <%i++; %>
         <% } }%>
      
                </div>

       

        <hr>

        <!-- Call to Action Section -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <h4>Visita il nostro catalogo per visualizzare tutti i prodotti disponibili</h4>
                </div>
                <div class="col-md-4">
                    <a class="btn btn-lg btn-default btn-block" href="product?action=prodotti">Catalogo</a>
                </div>
            </div>
        </div>

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

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>
</html>