package devops.capstone.airline;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxBinary;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import org.openqa.selenium.firefox.FirefoxOptions;

import devops.capstone.airline.IntegrationTest;

import org.junit.*;
import static org.junit.Assert.*;

import java.io.File;

import org.junit.experimental.categories.Category;

@Category(IntegrationTest.class)
public class SearchFlightFunctionalTest {
	
	static WebDriver driver;

	@BeforeClass
	public static void setup() {
		
		FirefoxBinary firefoxBinary = new FirefoxBinary();
        firefoxBinary.addCommandLineOptions("--headless");
        System.setProperty("webdriver.gecko.driver", "/usr/bin/geckodriver");
        FirefoxOptions firefoxOptions = new FirefoxOptions();
        firefoxOptions.setBinary(firefoxBinary);
        
        driver = new FirefoxDriver(firefoxOptions);
	}

	@AfterClass
	public static void cleanUp() {
		driver.quit();
	}

	@Test
	public void getFlightDetailsSuccess() {
        driver.get("http://localhost:6080/AirlineReservation/Home.jsp");
        WebElement dac = driver.findElement(By.name("dac"));
        WebElement aac = driver.findElement(By.name("aac"));
        WebElement date = driver.findElement(By.name("date"));
        WebElement tclass = driver.findElement(By.name("tclass"));
        WebElement adult = driver.findElement(By.name("adult"));
        WebElement button = driver.findElement(By.name("submit"));   
        
        dac.sendKeys("ATL");
        aac.sendKeys("DFW");
        date.sendKeys("04/10/2019");
        tclass.sendKeys("Economy");
        adult.sendKeys("2");
        
        button.click();
        
        assertTrue(driver.getPageSource().contains("Following are the flights between ATL and DFW"));
        //Checking for one Flight Details
        assertTrue(driver.getPageSource().contains("536"));
        assertTrue(driver.getPageSource().contains("AA"));
        assertTrue(driver.getPageSource().contains("07:59:00"));
        assertTrue(driver.getPageSource().contains("10:32:00"));
        assertTrue(driver.getPageSource().contains("2h:33m"));
        assertTrue(driver.getPageSource().contains("200.21"));
        assertTrue(driver.getPageSource().contains("400.42"));
	}
	
	@Test
	public void getFlightDetailsFailure() {
        driver.get("http://localhost:6080/AirlineReservation/Home.jsp");
        WebElement dac = driver.findElement(By.name("dac"));
        WebElement aac = driver.findElement(By.name("aac"));
        WebElement date = driver.findElement(By.name("date"));
        WebElement tclass = driver.findElement(By.name("tclass"));
        WebElement adult = driver.findElement(By.name("adult"));
        WebElement button = driver.findElement(By.name("submit"));   
        
        dac.sendKeys("XYZ");
        aac.sendKeys("DFW");
        date.sendKeys("04/10/2019");
        tclass.sendKeys("Economy");
        adult.sendKeys("2");
        
        button.click();

        assertTrue(driver.getPageSource().contains("There are no flights between the given two airports"));

	}

}
