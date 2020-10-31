package devops.capstone.airline;
import static org.junit.Assert.*;
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import devops.capstone.airline.ActionServlet;

public class ActionServletTest extends Mockito{
	
	 @Mock
	 HttpServletRequest request;
	 @Mock
	 HttpServletResponse response;
	 @Mock
	 RequestDispatcher rd;
	 @Before
	 public void setUp() throws Exception {
	  MockitoAnnotations.initMocks(this);
	 }

   @Test
   public void testFlightDetailsSuccess() throws Exception {
	   
       when(request.getParameter("dac")).thenReturn("ATL");
       when(request.getParameter("aac")).thenReturn("DFW");
       when(request.getParameter("adult")).thenReturn("2");
       when(request.getParameter("children")).thenReturn("0");
       when(request.getParameter("infant")).thenReturn("0");
       when(request.getParameter("type")).thenReturn("flightdetails");
       when(request.getParameter("date")).thenReturn("04/10/2019");
       when(request.getParameter("tclass")).thenReturn("Economy");
              
       when(request.getRequestDispatcher("ConnectingFlights.jsp")).thenReturn(rd);            
       StringWriter stringWriter = new StringWriter();
       PrintWriter writer = new PrintWriter(stringWriter);
       when(response.getWriter()).thenReturn(writer);
       
       new ActionServlet().doPost(request, response);
    
       verify(rd).forward(request, response); 
       
       String result = stringWriter.getBuffer().toString().trim();
       //System.out.println("result:"+result);
       assertEquals("Retrieved Connecting Flight Details Successfully", result);
             
     
   }
   
   @Test
   public void testFlightDetailsFail() throws Exception {
	   
       when(request.getParameter("dac")).thenReturn("XYZ");
       when(request.getParameter("aac")).thenReturn("DFW");
       when(request.getParameter("adult")).thenReturn("2");
       when(request.getParameter("children")).thenReturn("0");
       when(request.getParameter("infant")).thenReturn("0");
       when(request.getParameter("type")).thenReturn("flightdetails");
       when(request.getParameter("date")).thenReturn("04/10/2019");
       when(request.getParameter("tclass")).thenReturn("Economy");
              
       when(request.getRequestDispatcher("error.jsp")).thenReturn(rd);            
       StringWriter stringWriter = new StringWriter();
       PrintWriter writer = new PrintWriter(stringWriter);
       when(response.getWriter()).thenReturn(writer);
       
       new ActionServlet().doPost(request, response);
    
       verify(rd).include(request, response); 
       
       String result = stringWriter.getBuffer().toString().trim();
       //System.out.println("result:"+result);
       assertEquals("There are no flights between the given two airports", result);
     
   }
   
   @Test
   public void testBookflightSuccess() throws Exception {
	   	   
	   when(request.getParameter("type")).thenReturn("bookflight");
	   when(request.getParameter("flightlist")).thenReturn("1");
       when(request.getParameter("selectedFlight0")).thenReturn("AA~1093~ATL~DFW~250.51~250.51~11:50:00~14:23:00~2h:33m");
       when(request.getParameter("passcount")).thenReturn("1");
       when(request.getParameter("passenger0")).thenReturn("Partha Das");
       when(request.getParameter("cardnum")).thenReturn("4012888888881881");
       when(request.getParameter("cardexpmm")).thenReturn("5");
       when(request.getParameter("cardexpyy")).thenReturn("29");
              
       when(request.getRequestDispatcher("bookingConfirmation.jsp")).thenReturn(rd);            
       StringWriter stringWriter = new StringWriter();
       PrintWriter writer = new PrintWriter(stringWriter);
       when(response.getWriter()).thenReturn(writer);
       
       new ActionServlet().doPost(request, response);
    
       verify(rd).forward(request, response); 
       
       String result = stringWriter.getBuffer().toString().trim();
       //System.out.println("result:"+result);
       assertEquals("Booking Successfully completed", result);
     
   }
	

}
