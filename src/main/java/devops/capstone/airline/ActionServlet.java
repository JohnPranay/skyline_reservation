package devops.capstone.airline;

import java.io.IOException;
import java.util.ArrayList;
//import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


/**
 * Servlet implementation class ActionServlet
 */
@WebServlet("/ActionServlet")
public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		RequestDispatcher requestDispatcher = null;
		
			String requestType=request.getParameter("type");


			if("flightdetails".equalsIgnoreCase(requestType))
			{
				String departureAirportCode = request.getParameter("dac").toUpperCase();
				String arrivalAirportCode = request.getParameter("aac").toUpperCase();

				String adult = request.getParameter("adult") == null? "0":request.getParameter("adult");
				String children = request.getParameter("children") == null? "0":request.getParameter("children");
				String infant = request.getParameter("infant") == null? "0":request.getParameter("infant");
				
				adult = request.getParameter("adult") == ""? "0":request.getParameter("adult");
				children = request.getParameter("children") == ""? "0":request.getParameter("children");
				infant = request.getParameter("infant") == ""? "0":request.getParameter("infant");

				
					departureAirportCode=departureAirportCode.trim();
					arrivalAirportCode=arrivalAirportCode.trim();
					AirlineDAO dao = new AirlineDAO();
					ArrayList<FlightDetailBean> directflights = null;			
					directflights=dao.getFlightDetails(arrivalAirportCode, departureAirportCode, Integer.parseInt(adult)+Integer.parseInt(children)+Integer.parseInt(infant));
					
					request.setAttribute("direct", "yes");	
					request.setAttribute("departureCode", departureAirportCode);
					request.setAttribute("arrivalCode", arrivalAirportCode);
					request.setAttribute("flightDetails", directflights);				
					request.setAttribute("date", request.getParameter("date"));
					request.setAttribute("tclass", request.getParameter("tclass"));
					request.setAttribute("adult", request.getParameter("adult"));
					request.setAttribute("children", request.getParameter("children"));
					request.setAttribute("infant", request.getParameter("infant"));
					request.setAttribute("totalPassenger", ""+(Integer.parseInt(adult)+Integer.parseInt(children)+Integer.parseInt(infant)));
				
					System.out.println("Departure Airport Code:" + departureAirportCode);
					System.out.println("Arrival Airport Code:" + arrivalAirportCode);
					System.out.println("Departure Date:" + request.getParameter("date"));
					System.out.println("Travel Class:"+ request.getParameter("tclass"));
					System.out.println("No. of adults:"+ request.getParameter("adult"));
					System.out.println("No. of children:"+ request.getParameter("children"));
					System.out.println("No. of infants:"+ request.getParameter("infant"));	
				
					PrintWriter pout= response.getWriter();	
					
					
					
						if((directflights==null||directflights.size()==0))
						{
							pout.write("There are no flights between the given two airports");
							request.setAttribute("errorMsg", "There are no flights between the given two airports");
							requestDispatcher = request.getRequestDispatcher("error.jsp");
							requestDispatcher.include(request, response);
						}
						else
						{
							
							pout.write("Retrieved Connecting Flight Details Successfully");
							requestDispatcher = request.getRequestDispatcher("ConnectingFlights.jsp");
							requestDispatcher.forward(request, response);
						}
				

				}

				else if ("bookflight".equalsIgnoreCase(requestType)){

					int totalFlightCount = Integer.parseInt(request.getParameter("flightlist"));
					
					String airline = "";
					String flightNumber = "";
					String departureCode = "";
					String arrivalCode = "";
					String costPerPerson = "";
					String totalCost = "";
					String departureTime = "";
					String arrivalTime = "";
					String flightDuration = "";
				
					for (int i=0; i<totalFlightCount; i++){
					
						System.out.println("Selected Flight:"+request.getParameter("selectedFlight"+i));
					
						if (request.getParameter("selectedFlight"+i) != null ){
						
						String selectedFlight = request.getParameter("selectedFlight"+i);
						//System.out.println("Selected Flight"+selectedFlight);
						
						System.out.println("Credit Card# :"+request.getParameter("cardnum"));
						System.out.println("CC Expiry Month:"+request.getParameter("cardexpmm"));
						System.out.println("CC Expiry Year:"+request.getParameter("cardexpyy"));
						
						
						String[] tempArray = selectedFlight.split("~");
						airline = tempArray[0];
						flightNumber = tempArray[1];
						departureCode = tempArray[2];
						arrivalCode = tempArray[3];
						costPerPerson = tempArray[4];
						totalCost = tempArray[5];
						departureTime = tempArray[6];
						arrivalTime = tempArray[7];
						flightDuration = tempArray[8];	
						
						request.setAttribute("airline", airline);
						request.setAttribute("flightNumber", flightNumber);
						request.setAttribute("departureCode", departureCode);
						request.setAttribute("arrivalCode", arrivalCode);
						request.setAttribute("costPerPerson", costPerPerson);
						request.setAttribute("totalCost", totalCost);
						request.setAttribute("departureTime", departureTime);
						request.setAttribute("arrivalTime", arrivalTime);
						request.setAttribute("flightDuration", flightDuration);
						request.setAttribute("cardnum", request.getParameter("cardnum"));
						request.setAttribute("cardexpmm", request.getParameter("cardexpmm"));
						request.setAttribute("cardexpyy", request.getParameter("cardexpyy"));
						
						}
					}
				
					int totalPassengers = Integer.parseInt(request.getParameter("passcount"));
					String [] passengerNames = new String [totalPassengers];
				
					for (int i=0; i<totalPassengers; i++){
					
						System.out.println("Passenger Name:"+request.getParameter("passenger"+i));									
						passengerNames[i] = request.getParameter("passenger"+i);
					
					}
				
					request.setAttribute("passengers", passengerNames);
				
					//Generate Booking Number
					long LIMIT = 10000000000L;
					long last = 0;					
					long id = System.currentTimeMillis() % LIMIT;
					  
					if ( id <= last ) {
					    id = (last + 1) % LIMIT;
					  }
					
					request.setAttribute("bookingNumber", id);
					request.setAttribute("passcount", ""+totalPassengers);
					
					PrintWriter pout= response.getWriter();
					pout.write("Booking Successfully completed");
					
					requestDispatcher= request.getRequestDispatcher("bookingConfirmation.jsp");		
					requestDispatcher.forward(request, response);
				}
	}
}

