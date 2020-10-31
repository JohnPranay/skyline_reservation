package devops.capstone.airline;

public class FlightDetailBean {


	private String weekdays;

	private int flightNumber;

	private String airline;
	
	private String departureTime;
	
	private String arrivalTime;

	private String flightDuration;
	
	private String costPerperson;
	
	private Double totalCost;


	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getWeekdays() {
		return weekdays;
	}

	public void setWeekdays(String weekdays) {
		this.weekdays = weekdays;
	}

	public int getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(int flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getFlightDuration() {
		return flightDuration;
	}

	public void setFlightDuration(String flightDuration) {
		this.flightDuration = flightDuration;
	}

	public String getCostPerperson() {
		return costPerperson;
	}

	public void setCostPerperson(String costPerperson) {
		this.costPerperson = costPerperson;
	}

	public Double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(Double totalCost) {
		this.totalCost = totalCost;
	}

}
