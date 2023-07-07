package whou.secproject.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.TestVoDTO;
import whou.secproject.mapper.TestVoMapper;

@Service
public class aptServiceImpl implements aptService {

	@Autowired
	private TestVoMapper mapper;
	
	@Override
	public TestVoDTO testCrawling(String testURL, String qnum)  {
		
		TestVoDTO dto = new TestVoDTO();
		System.setProperty("webdriver.chrome.driver", "D:\\r\\selenium-server-standalone-master\\bin\\chromedriver.exe");
		
		WebDriver driver = new ChromeDriver();
		driver.get(testURL);
		
		if (qnum.equals("21")) {
		    // 페이지 로드가 코드 실행보다 느려서 지연 추가
		    try {
		        TimeUnit.SECONDS.sleep(1); // 3초 동안 대기
		    } catch (InterruptedException e) {
		        e.printStackTrace();
		    }
		    // TOP3
	         List<WebElement> developElements = driver.findElements(By.cssSelector(
	               "div.cont-wrap.page-break > ul > li > strong"));
	         String text ="";
	         for (WebElement element : developElements) {
	            text += element.getText() + "+";
	         }
	         // 백분위
	         List<WebElement> scoreElements = driver.findElements(By.cssSelector(
		               "div.cont-wrap.page-break > div:nth-child(5) > table > tbody > tr > td:nth-child(even)"));
		         String scoreText ="";
		         for (WebElement element : scoreElements) {
		        	 scoreText += element.getText() + "+";
		         }
		         
	         // 직업추천
	         List<WebElement> jobElements = driver.findElements(By.cssSelector(
		               "div.cont-wrap.page-break > div:nth-child(7) > table > tbody > tr > th"));
		         String jobText ="";
		         for (WebElement element : jobElements) {
		        	 jobText += element.getText() + "+";
		         }
	         driver.quit(); // WebDriver 종료

	         // DB에 넣으려고 검사 크롤링 값 dto에 셋하기
	         dto.setTest21_1(text);
	         dto.setTest21_2(scoreText);
	         dto.setTest21_3(jobText);
	      }
		
		if (qnum.equals("31")) {
			 // TOP3
	         List<WebElement> developElements = driver.findElements(By.cssSelector(
	               "#ct > div:nth-child(1) > div.aptitude-result-content > div:nth-child(1) > ul > li > span"));
	         String text ="";
	         for (WebElement element : developElements) {
	            text += element.getText() + "+";
	         }
	      // 백분위
	         List<WebElement> scoreElements = driver.findElements(By.cssSelector(
		               "#ct > div:nth-child(2) > div > div > div > table > tbody > tr > td > div > div.scoreBar > span"));
	         String scoreText ="";
	         for (WebElement element : scoreElements) {
	        	 scoreText += element.getText() + "+";
	         }
		      // 직업추천
	         List<WebElement> jobElements = driver.findElements(By.cssSelector(
	               "#ct > div:nth-child(1) > div.aptitude-result-content > div:nth-child(2) > div > table > thead > tr > th"));
	         String jobText ="";
	         for (WebElement element : jobElements) {
	        	 jobText += element.getText() + "+";
	         }

	         driver.quit(); // WebDriver 종료

	         // DB에 넣으려고 검사 크롤링 값 dto에 셋하기
	         dto.setTest31_1(text);
	         dto.setTest31_2(scoreText);
	         dto.setTest31_3(jobText);
	      }
		
		return dto;
	}
	
	@Override
	public Map<String,Object> crawlingSplit(TestVoDTO dto) {
		
		String[] array = dto.getTest31_2().toString().split("\\+");
		Map<String, Object> scoreMap = new HashMap<>();
		String[] scores = dto.getTest31_2().toString().split("\\+");
		String score = "";
		for(int i = 1; i < scores.length; i++) {
			score = scores[i];
			scoreMap.put("key"+i, score);
		}
		System.out.println(scoreMap);
		return scoreMap;
	}
	
	@Override
	public void crawlingInsert(TestVoDTO dto) {
		mapper.crawlingInsert(dto);
	}
	
}

