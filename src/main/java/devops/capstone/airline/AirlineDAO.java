package devops.capstone.airline;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;




public class AirlineDAO {


	private static Connection connection;
	
	String[][] Flight ={{"536","AA","Sun_Mon_Tue_Wed_Thu_Fri_Sat","ATL","07:59:00","DFW","10:32:00","2h:33m","200.21"}, 
			 {"1093","AA","Mon_Wed_Thu_Fri","ATL","11:50:00","DFW","14:23:00","2h:33m","250.51"},
			 {"5817","AA","Sun_Mon_Tue_Wed_Thu_Fri_Sat","ATL","17:57:00","DFW","20:30:00","2h:33m","260.11"},
			 {"1111","AA","Sun_Mon_Tue_Wed_Thu_Fri_Sat","ATL","06:34:00","MIA","09:00:00","2h:26m","300.09"},
			 {"4009","AA","Mon_Wed_Thu_Fri","ATL","12:42:00","MIA","15:08:00","2h:26m","200.21"},
			 {"2419","AA","Sun_Mon_Tue_Wed_Thu_Fri_Sat","ATL","17:39:00","MIA","20:05:00","2h:26m","450.00"},
			 {"7027","AA","Sun_Mon_Tue_Wed_Thu_Fri_Sat","ATL","06:51:00","ORD","09:41:00","2h:50m","460.99"},
			 {"5496","AA","Mon_Wed_Thu_Fri","ATL","11:38:00","ORD","14:28:00","2h 50m","900.23"},
			 {"1486","AA","Sun_Mon_Tue_Wed_Thu_Fri_Sat","ATL","18:33:00","ORD","21:23:00","2h:50m","890.56"},
			 {"5222","AA","Sun_Mon_Tue_Wed_Thu_Fri_Sat","ATL","07:45:00","PHL","10:37:00","2h:52m","247.31"}
			};

    public AirlineDAO() {
      //  connection = DbUtil.getConnection();
    }

    public ArrayList<FlightDetailBean> getFlightDetails(String arrivalAirportCode, String departureAirportCode, int numberOfPass) {

    	ArrayList<FlightDetailBean> flights = new ArrayList<FlightDetailBean>();
        	
        	for (int counter=0; counter<Flight.length; counter++){
        		
        		//System.out.println(counter);
        		
        		if (Flight[counter][3].equals(departureAirportCode.toUpperCase()) && Flight[counter][5].equals(arrivalAirportCode.toUpperCase())){
        			
                	FlightDetailBean bean = new FlightDetailBean();
        			bean.setFlightNumber(Integer.parseInt(Flight[counter][0]));
                	bean.setWeekdays(Flight[counter][2]);
                	bean.setAirline(Flight[counter][1]);
                	bean.setArrivalTime(Flight[counter][6]);
                	bean.setDepartureTime(Flight[counter][4]);
                	bean.setFlightDuration(Flight[counter][7]);
                	bean.setCostPerperson(Flight[counter][8]);
                	bean.setTotalCost(Double.parseDouble(Flight[counter][8])*numberOfPass);
                	
                	flights.add(bean);
        			
        		}
        	}
        	
        return flights;
    }

}