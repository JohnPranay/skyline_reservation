package devops.capstone.airline;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

public class AirlineDAOTest {
	
	@Test
	public void testCountOfFlights() {
		
		ArrayList<FlightDetailBean> flightDetails = new AirlineDAO().getFlightDetails("DFW","ATL",1);
		assertEquals(3,flightDetails.size());
	}

}
