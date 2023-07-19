package whou.secproject.component;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class CrawingResult {

	public CrawingResult() {
		// TODO Auto-generated constructor stub
	}
	public StringBuilder elementToSb(WebDriver driver, String tag,StringBuilder sb) {
		List<WebElement> Elements = driver.findElements(By.cssSelector(tag));
		for (WebElement element : Elements) sb = replSb(sb,element);
		return sb;
	}
	public StringBuilder replSb(StringBuilder sb, WebElement element) {
		return sb.append(element.getText());
	}
}
