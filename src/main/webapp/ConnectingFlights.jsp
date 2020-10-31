<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.util.ArrayList" %>
<%-- <%@ page import="devops.capstone.airline.FlightBean" %> --%>
<%@ page import="devops.capstone.airline.FlightDetailBean" %>
<head>
    <!-- <meta charset="utf-8" /> -->
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flight Instances</title>
 	  <!-- BOOTSTRAP STYLES -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES -->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS -->
    <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
    <link href="assets/css/opensansfont.css" rel="stylesheet" />
    <script>
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
                <form action="ActionServlet" method="post" onsubmit="return checkMe();">
                   <input type="hidden" name="type" value="bookflight">
                   <input type="hidden" name="passcount" id="passcount" value=<%= Integer.parseInt((String)request.getAttribute("totalPassenger")) %>>
                     <%ArrayList<FlightDetailBean> list = (ArrayList<FlightDetailBean>)request.getAttribute("flightDetails"); %>
                     <%if(list!=null && list.size()>0){ %>
                   <input type="hidden" name="flightlist" id="flightlist" value=<%= list.size() %>>

                <h2>Following are the flights between <%=request.getAttribute("departureCode") %> and <%=request.getAttribute("arrivalCode") %></h2>

                <br />

                <table style="width: 100%" border="1">
                <tr>

                <th style="width:5%;text-align:center" align="center">Select
                </th>

                <th style="width:6%;text-align:center" align="center">Airline
                </th>

                <th style="width:6%;text-align:center" align="center">Flight#
                </th>

                <!-- <th style="width:15%" align="center">&nbsp;&nbsp;&nbsp;Weekdays
                </th> -->

                <th style="width:12%;text-align:center" align="center">Departure Airport
                </th>

                <th style="width:12%;text-align:center" align="center">Departure Time
                </th>

                <th style="width:12%;text-align:center" align="center">Arrival Airport
                </th>

                <th style="width:12%;text-align:center" align="center">Arrival Time
                </th>

                <th style="width:12%;text-align:center" align="center">Flight Duration
                </th>

                <th style="width:12%;text-align:center" align="center">Cost/Person
                </th>

                <th style="width:11%;text-align:center" align="center">Total Cost
                </th>

                </tr>

                <%for(int i=0;i<list.size();i++)
                	{
                	//System.out.println(list.get(i).getFlightNumber());
                	%>
                <tr>

                <td align="center">
                	<input type="checkbox" name="selectedFlight<%=i%>" id="selectedFlight<%=i%>"
                	value=<%=list.get(i).getAirline()+"~"+list.get(i).getFlightNumber()+"~"+request.getAttribute("departureCode")
        			+"~"+request.getAttribute("arrivalCode")+"~"+list.get(i).getCostPerperson()+"~"+list.get(i).getTotalCost()
        			+"~"+list.get(i).getDepartureTime()+"~"+list.get(i).getArrivalTime()+"~"+list.get(i).getFlightDuration() %> >
                </td>

                <td align="center">
                <%=list.get(i).getAirline() %>
                </td>

                <td align="center">
                <%=list.get(i).getFlightNumber() %>
                </td>

                <%-- <td align="center">
                <%=list.get(i).getWeekdays() %>
                </td> --%>

                <td align="center">
                <%=request.getAttribute("departureCode") %>
                </td>

                <td align="center">
                <%=list.get(i).getDepartureTime() %>
                </td>

                <td align="center">
                <%=request.getAttribute("arrivalCode") %>
                </td>

                <td align="center">
                <%=list.get(i).getArrivalTime() %>
                </td>

                <td align="center">
                <%=list.get(i).getFlightDuration() %>
                </td>

                <td align="center">
                <%="$"+list.get(i).getCostPerperson() %>
                </td>

                <td align="center">
                <%="$"+list.get(i).getTotalCost() %>
                </td>


                </tr>
                <%} %>
                </table>
                <%} %>

                <%if("yes".equals((String)request.getAttribute("direct")) &&(list==null|| list.size()==0)){ %>
                <h2>There are no direct flights between <%=request.getAttribute("departureCode") %> and <%=request.getAttribute("arrivalCode") %></h2>
                <%} %>


                <br />
                <br />

                <%int noOfPassenger = Integer.parseInt((String)request.getAttribute("totalPassenger")); %>

                <h4>
                 <b> Guest Details: &nbsp; </b>
                </h4>

                <%for(int j=0;j<noOfPassenger;j++)
                {
                %>

                <h4>
                  <%=j+1%>. Guest Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="text" autocomplete="off" size="17" name="passenger<%=j%>" id="passenger<%=j%>" />
                </h4>

                <%} %>

                 <br />
                <br />

                <h4>
                 <b> Payment Details: &nbsp; </b>
                </h4>

                <h4>
                  Visa Card Number : &nbsp;
                  <input type="text" autocomplete="off" size="17" maxlength="16" name="cardnum" id="cardnum" />
                </h4>
                <h4>
                  Expiry Month (MM):&nbsp;
                  <input type="number" autocomplete="off" size="17" min="1" max="12" maxlength="2" name="cardexpmm" id="cardexpmm" />

                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Expiry Year (YY): &nbsp;
                  <input type="number" autocomplete="off" size="17" min="19" max="29" maxlength="2" name="cardexpyy" id="cardexpyy" />
                </h4>
                <h4>
                  CVV : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="text" autocomplete="off" size="17" maxlength="3" name="cardcvv" id="cardcvv" />
                </h4>

                <br />
                <br />

                 &nbsp;
                <input type="submit" name="submit" value="Book Flight" class="btn btn-success ">

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




             <!-- /. PAGE INNER  -->

         <!-- /. PAGE WRAPPER  -->
        </div>
        </div>
        </div>
        </div>
        <script type="text/javascript" src="assets/js/canvasjs.min.js"></script>

     <!-- /. WRAPPER  -->
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
