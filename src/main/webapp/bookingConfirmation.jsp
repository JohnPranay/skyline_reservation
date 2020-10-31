<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.util.ArrayList" %>
<%-- <%@ page import="devops.capstone.airline.FlightBean" %> --%>
<%@ page import="devops.capstone.airline.FlightDetailBean" %>
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flight Instances</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
   <link href="assets/css/opensansfont.css" rel="stylesheet" />
   
    <script>
    
    function printContent(identifier)
    { 	
    	var restorepage = document.body.innerHTML;
    	var printcont = document.getElementById(identifier).innerHTML;
    	document.body.innerHTML = printcont;
    	window.print();
    	document.body.innerHTML = restorepage;
    }
  
  function checkMe()
  {
	  //alert("The form was submitted");
	  var countPassenger = Number(document.getElementById('passcount').value);  
	  var flightCount = Number(document.getElementById('flightlist').value == null ? "0":document.getElementById('flightlist').value);
	  
	  //alert("passenger count"+countPassenger);
	  var count = 0;	  
	  for(l=0;l<flightCount;l++)
      {
		  if(document.getElementById('selectedFlight'+l).checked)
			{
			  count++;
			}
      }
	  
	  if (count == 0){	  
		  alert('Please select one flight');
		  return false;		  
	  }
	  else {
		  
		  if (count > 1){	  
			  alert('Please select maximum of one flight');
			  return false;		  
		  }
	  }
	  	
      
	  for(k=0;k<countPassenger;k++)
      {
		  if(document.getElementById('passenger'+k).value=='')
			{
				alert('Guest Details can not be left blank');
				return false;
			}
      }
	  	
	  var cardno = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
		  
	  if(document.getElementById('cardnum').value.match(cardno))
	  {
		   //Do nothing
	  }
	  else
	  {
		     alert("Not a valid Visa credit card number");
		     return false;
	  }
	  
	  if(isNaN(document.getElementById('cardexpmm').value) || document.getElementById('cardexpmm').value == '')
		{
			alert('Visa Card Expiry Month should be numeric');
			return false;
		}
	  
	  if(isNaN(document.getElementById('cardexpyy').value) || document.getElementById('cardexpyy').value == '')
		{
			alert('Visa Card Expiry Year should be numeric');
			return false;
		}
		  
	  if(isNaN(document.getElementById('cardcvv').value) || document.getElementById('cardcvv').value == '')
		{
			alert('Visa Card CVV should be numeric');
			return false;
		}
	  
	  if (Number(document.getElementById('cardexpmm').value) <= 0 ||  Number(document.getElementById('cardexpmm').value) > 12)
	  {
		alert('Visa Card Expiry Month should be between 1 - 12');
		return false;  
	  }
      
	  if (Number(document.getElementById('cardexpyy').value) < 19 ||  Number(document.getElementById('cardexpyy').value) >= 30)
	  {
		alert('Visa Card Expiry Month should be between 2019 - 2029');
		return false;  
	  }
	  
	  if (Number(document.getElementById('cardexpyy').value) < 19)
	  {
		alert('Please enter a non-expired Visa Card Details');
		return false;  
	  }
	  else 
	  {
		  if (Number(document.getElementById('cardexpyy').value) == 19 && Number(document.getElementById('cardexpmm').value) < 4)
		  {
			alert('Please enter a non-expired Visa Card Details');
			return false;  
		  }
	  }  
  }	  
  </script> 
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
                <div id = "printarea">
       
		                <form action="ActionServlet" method="post" >		                
		                	<% java.util.Date currentDate = new java.util.Date();%>	                                              
		                	<h2>Travel Itinerary</h2>
		                	<h4><b>Booking Number : <%=request.getAttribute("bookingNumber") %> </b></h4>		                
		                	<h4><b>Booking Date : <%out.println(currentDate.toString());%> </b></h4>
		                    <h4></h4>
		                
		                <table style="width: 100%" border="1">
		                	<tr>
				                <th style="width:6%;text-align:center" align="center">Airline
				                </th>
		                
				                <th style="width:6%;text-align:center" align="center">Flight#
				                </th>
		                                
				                <th style="width:15%;text-align:center" align="center">Departure Airport
				                </th>
		                
				                <th style="width:15%;text-align:center" align="center">Departure Time
				                </th>
				                
				                <th style="width:12%;text-align:center" align="center">Arrival Airport
				                </th>
				                
				                <th style="width:12%;text-align:center" align="center">Arrival Time
				                </th>
				                
				                <th style="width:12%;text-align:center" align="center">Flight Duration
				                </th>
				                
				                <th style="width:11%;text-align:center" align="center">Total Cost
				                </th>
		                </tr>
		                
		                <tr>
		                
		                <td align="center">
		                <%=request.getAttribute("airline") %>
		                </td>
		                
		                <td align="center">
		                <%=request.getAttribute("flightNumber") %>
		                </td>
		                
		                <td align="center">
		                <%=request.getAttribute("departureCode") %>
		                </td>
		                
		                <td align="center">
		                <%=request.getAttribute("departureTime") %>
		                </td>
		                
		                <td align="center">
		                <%=request.getAttribute("arrivalCode") %>
		                </td>
		                
		                <td align="center">
		                <%=request.getAttribute("arrivalTime") %>
		                </td>
		                
		                <td align="center">
		                <%=request.getAttribute("flightDuration") %>
		                </td>
		                
		                <td align="center">
		                <%="$"+request.getAttribute("totalCost") %>
		                </td>
		                
		                </tr>
		                </table>
		
		                <br />  
		                
		                <%
		                //String[] list = (String []) request.getParameterValues("passengers"); 
		                String[] list = new String[((String[])request.getAttribute("passengers")).length];
		                list = ((String[])request.getAttribute("passengers"));
		                
		                %>
		                              
		                <h4>
		                 <b> Guest Details: &nbsp; </b>
		                </h4>
		                
		                <table style="width: 20%" border="1">
		                
		                <tr>
		                
		                <th style="width:20%;text-align:center" align="center">Guest Name
		                </th>
		                
		                </tr>
		                
		                <%for(int j=0;j<Integer.parseInt((String)request.getAttribute("passcount")) ;j++)
		                {
		                %>
		                
		                <tr>
		                
		                 <td align="center">
		                 	<%=list[j] %>
		                 </td>
		                
		                </tr>
		                <%} %>
		                </table>
		                
		                <br />  
		                
		                <h4>
		                 <b> Payment Details: &nbsp; </b>
		                </h4>
		                
		                <h4>
		                  Visa Card Number : &nbsp;
		                  <%=request.getAttribute("cardnum") %>
		                </h4>
		                <h4>  
		                  Expiry Month (MM) :
		                  <%=request.getAttribute("cardexpmm") %>
		                  
		                  &nbsp;&nbsp;&nbsp;Expiry Year (YY) : &nbsp;
		                  <%=request.getAttribute("cardexpyy") %>
		                </h4>
		                
		                <br />
		                <br /> 
		                      
		                 &nbsp;     
		                
                </div>
                 
				<input type="button" value="Print Itinerary" onClick="printContent('printarea')">
                
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
