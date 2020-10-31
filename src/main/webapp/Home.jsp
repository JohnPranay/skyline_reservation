<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Search Flights</title>
	  <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' /> -->
   <link href="assets/css/opensansfont.css" rel="stylesheet" />
   <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
   <link href="assets/css/jquery-ui.css" rel="stylesheet" />
   <script src="assets/js/jquery-1.10.2.js"></script>
   <script src="assets/js/jquery-ui.js"></script>
  <script>
    // Datepicker
	  $(function() {
	    $( "#datepicker" ).datepicker();
	  });
    //  checkMe
	  function checkMe()
	  {

    		if(document.getElementById('dac').value=='' || document.getElementById('aac').value=='')
    		{
    			alert('Please enter both departure and arrival airport codes');
    			return false;
    		}

    		if(document.getElementById('dac').value==document.getElementById('aac').value)
    		{
    			alert('Please enter different departure and arrival airport codes');
    			return false;
    		}

    		if(document.getElementById('datepicker').value=='')
    		{
    			alert('Please select departure date');
    			return false;
    		}

    		if(document.getElementById('adult').value=='' && document.getElementById('children').value=='' && document.getElementById('infant').value=='')
    		{
    			alert('Please enter at least one passenger');
    			return false;
    		}

    		if(isNaN(document.getElementById('adult').value))
    		{
    			alert('Number of adults should be numeric');
    			return false;
    		}

    		if(isNaN(document.getElementById('children').value))
    		{
    			alert('Number of children should be numeric');
    			return false;
    		}

    		if(isNaN(document.getElementById('infant').value))
    		{
    			alert('Number of infants should be numeric');
    			return false;
    		}

    		if(Number(document.getElementById('adult').value) == 0 && Number(document.getElementById('children').value)  == 0
    				&& Number(document.getElementById('infant').value)  == 0 )
    		{
    			alert('Please enter at least one passenger');
    			return false;
    		}

    		if(((Number(document.getElementById('adult').value) + Number(document.getElementById('children').value)
    				+ Number(document.getElementById('infant').value))) > 9)
    		{
    			alert('Maximum of 9 passengers is allowed');
    			return false;
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
                <!-- <section id="home" class="text-center"> -->
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
                  <input type="hidden" name="type" value="flightdetails">
                  <div class="row">
                    <div class="col-md-12">
                         <h2>Search Flights</h2>
                         <h4>
                            Departure Airport Code : &nbsp;
                            <input type="text" autocomplete="off" size="17" maxlength="3" name="dac" id="dac" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            Arrival Airport Code : &nbsp;
                            <input type="text" autocomplete="off" size="17" maxlength="3" name="aac" id="aac" />
                        </h4>
                        <h4>
                            Departure Date : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" autocomplete="off" size="17" name="date" id="datepicker"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            Travel Class : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <select name="tclass" >
       							          	<option value="Economy">Economy</option>
        							          <option value="Business">Business</option>
        							          <option value="First Class">First Class</option>
      						          </select>
                        </h4>
                        <h4>
                            Number Of Adults : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="number" autocomplete="off" size="17" min="1" max="9" name="adult" id="adult" />
                            &nbsp;&nbsp;&nbsp;
                            Number Of Children : &nbsp;
                            <input type="number" autocomplete="off" size="17" min="1" max="9" name="children" id="children" />
                            </h4>
                        <h4>
                            Number Of Infants : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="number" autocomplete="off" size="17" min="1" max="9" name="infant" id="infant" />
                        </h4>
                        <br />&nbsp;
                        <input type="submit" name="submit" value="Search" class="btn btn-success ">
                    </div>
                </div>
                <hr />
                <hr />
            </form>
            <div class="row">
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                          <h2>Special Deals</h2>
                          <h4>Fly anywhere in USA starting $9999</h4>
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
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
