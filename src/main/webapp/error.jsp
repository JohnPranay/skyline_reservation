<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.util.ArrayList" %>
<%@ page import="devops.capstone.airline.FlightDetailBean" %>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Error Page</title>
	  <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
   <link href="assets/css/opensansfont.css" rel="stylesheet" />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Skylines</a>
            </div>
            <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;"> Welcome Guest &nbsp; <a href="index.jsp" class="btn btn-danger square-btn-adjust">Home</a>
						</div>
        </nav>
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
		                        <a  href="Home.jsp"><i class="fa fa-ticket fa-2x"></i> <b>Ticket Booking </b></a>
		                    </li>				
		                    <li>
		                        <a  href="index.jsp"><i class="fa fa-dashboard fa-2x"></i> <b>Ticket Checking-- Coming Soon !!</b></a>
		                    </li>
		                     <li>
		                        <a  href="index.jsp"><i class="fa fa-plane fa-2x "></i>International Booking-- Coming Soon !!</a>
		                    </li>
		                    <li>
		                        <a  href="index.jsp"><i class="fa fa-calendar fa-2x"></i>Calendar-- Coming Soon !!</a>
		                    </li>		                    
							<li>
		                        <a   href="index.jsp"><i class="fa fa-comment fa-2x"></i>Chat with our Travel Expert-- Coming Soon !!</a>
		                    </li>                  
		                    <li>
		                        <a   href="index.jsp"><i class="fa fa-edit fa-2x"></i>Donate to our Social Cause-- Coming Soon !!</a>
		                    </li>
		                    <li>
		                        <a   href="index.jsp"><i class="fa fa-desktop fa-2x"></i>Contact Us-- Coming Soon !!</a>
		                    </li>
                </ul>
            </div>
        </nav>
        <div id="page-wrapper" >
            <div id="page-inner">
                 <hr />
                    <form action="/AirlineReservationSystem/ActionServlet" method="post">
                      <h3><%=request.getAttribute("errorMsg") %>
                      </h3>
                      <hr />
                    </form>
                   <div class="row">
  				            <div class="col-md-6 col-sm-12 col-xs-12">
                         <div class="panel panel-default">
                            <div class="panel-body">
                               <h2>Special Deals</h2>
                               <h4>Fly anywhere in USA starting $99</h4>
                               <h4>Earn 1000 mileage points for each flight with American Airlines</h4>
                            </div>
                        </div>
                     </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                       <div class="panel panel-default">
                          <div class="panel-body">
                              <h2>Special Deals</h2>
                              <h4>Fly anywhere in USA starting $99</h4>
                              <h4>Earn 1000 mileage points for each flight with American Airlines</h4>
                         </div>
                      </div>
                   </div>
              </div>
            </div>
          </div>
        </div>
        <script type="text/javascript" src="assets/js/canvasjs.min.js"></script>
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
