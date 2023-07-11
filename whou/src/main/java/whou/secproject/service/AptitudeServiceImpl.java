package whou.secproject.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import whou.secproject.component.AptitudeTestTemporarySaveDTO;
import whou.secproject.component.AptitudeTestValueDTO;
import whou.secproject.mapper.AptitudeMapper;

@Service
public class AptitudeServiceImpl implements AptitudeService{
	
	@Autowired
	private AptitudeMapper mapper;
	
	//크롤링 하기
	@Override
	public AptitudeTestValueDTO testCrawling(String testURL, String qnum) {
		AptitudeTestValueDTO dto = new AptitudeTestValueDTO();
        System.setProperty("webdriver.chrome.driver", "D:\\r\\selenium-server-standalone-master\\bin\\chromedriver.exe");

        WebDriver driver = new ChromeDriver();
        driver.get(testURL);
        
        if(qnum.equals("27")) {
        	List<WebElement> developElements = driver.findElements(By.cssSelector("div.develop-type > ul > li.on"));
        	StringBuilder developType = new StringBuilder();
            for (WebElement element : developElements) {
                developType.append(element.getText().replaceAll("\\n", "+"));
            }
            System.out.println(developType);

            // 개발 점수 정보 가져오기
            List<WebElement> scoreElements = driver.findElements(By.cssSelector("div.aptitude-result-content.cont_result > div:nth-child(2) > div:nth-child(5) > table > tbody"));
            StringBuilder developScore = new StringBuilder();
            for (WebElement element : scoreElements) {
                developScore.append(element.getText().replaceAll("\\n", " ").replaceAll("구분 점수 구분 점수 ", ""));
            }
            System.out.println(developScore);

            // 기획 유형 정보 가져오기
            StringBuilder planningSB = new StringBuilder();
            String planning ="";
            for (int i = 2; i <= 11; i += 3) {
                String selector = "div.aptitude-result-content.cont_result > div:nth-child(2) > div:nth-child(12) > table > tbody > tr:nth-child(" + i + ") > td";
                List<WebElement> planningElements = driver.findElements(By.cssSelector(selector));
                StringBuilder temp1 = new StringBuilder();
                for (WebElement element : planningElements) {
                	temp1.append(element.getText());
                }
                planningSB.append(temp1).append(" ");
            }
            planning = planningSB.toString().replaceAll("\\n", "+");
            System.out.println(planning);

         // 준비 유형 정보 가져오기
            List<WebElement> preparationElements = driver.findElements(By.cssSelector("div.aptitude-result-content.cont_result > div:nth-child(3) > div.box_graph > table > tbody"));
            StringBuilder preparation = new StringBuilder();
            String result = "";
            for (WebElement element : preparationElements) {
                preparation.append(element.getText());
            }
            String present=preparation.toString().replaceAll("\\n", "+");
            
            int startIndex = present.indexOf("검사결과+");
            int endIndex = present.substring(startIndex + 6).indexOf("+");
            
            while (present.contains("검사결과+")) {
                result += present.substring(startIndex, endIndex + startIndex + 6 + 1);
                present = present.substring(endIndex + startIndex + 6);
                startIndex = present.indexOf("검사결과+");
                endIndex = present.substring(startIndex + 6).indexOf("+");
            }
            String preparation2=result;
            String preparation3 = preparation2.substring(0,preparation2.length()/2);
            preparation2=result;
            String preparation4 = preparation2.substring(preparation2.length()/2);
            
            System.out.println(preparation2);
            driver.quit();  // WebDriver 종료
            
            
            //DB에 넣으려고 검사 크롤링 값 dto에 셋하기
            dto.setTest27_1(developType.toString());
    		dto.setTest27_2(developScore.toString());
    		dto.setTest27_3(planning);
    		dto.setTest27_4(preparation3);
    		dto.setTest27_5(preparation4);
        }
        
        
        
        if(qnum.equals("25")) {
        	// 가치 요약 정보 가져오기
            List<WebElement> summaryElements = driver.findElements(By.cssSelector("div.aptitude-tbl-list.value.import > table > tbody > tr:nth-child(1) > td:nth-child(2)"));
            String valueSummary = "";
            for (WebElement element : summaryElements) {
                valueSummary += element.getText() + " + ";
            }
            List<WebElement> categoryElements = driver.findElements(By.cssSelector("div.aptitude-tbl-list.value.import > table > tbody > tr:nth-child(2) > td:nth-child(1)"));
            for (WebElement element : categoryElements) {
                valueSummary += element.getText() + " + ";
            }
            List<WebElement> typeElements = driver.findElements(By.cssSelector("div.aptitude-tbl-list.value.import > table > tbody > tr:nth-child(2) > td.left.center.me"));
            for (WebElement element : typeElements) {
                valueSummary += element.getText() + " + ";
            }
            System.out.println(valueSummary);

            // 가치 점수 정보 가져오기
            List<WebElement> scoreElements = driver.findElements(By.cssSelector("div.aptitude-result-content > div:nth-child(1) > div:nth-child(5) > table > tbody"));
            String valueScore = "";
            for (WebElement element : scoreElements) {
                valueScore += element.getText().replaceAll("\\n", " ");
            }
            System.out.println(valueScore);

            // 가치 유형 정보 가져오기
            List<WebElement> valueTypeElements = driver.findElements(By.cssSelector("div.aptitude-result-content > div:nth-child(1) > div:nth-child(8) > table > tbody > tr:nth-child(2) > th"));
            String valueType = "";
            for (WebElement element : valueTypeElements) {
                valueType += element.getText().replaceAll("\\n", "+");
            }
            System.out.println(valueType);
            
            // value_import 정보 가져오기
            List<WebElement> valueImportElements = null;
            String valueImport = "";
            for (int i = 1; i <= 3; i++) {
                String selector = "div.aptitude-tbl-list.value.best > table > tbody > tr:nth-child(2) > td:nth-child(" + i + ")";
                valueImportElements = driver.findElements(By.cssSelector(selector));
                for (WebElement element : valueImportElements) {
                    valueImport += element.getText() + " + ";
                }
            }
            System.out.println(valueImport);

            
            driver.quit();  // WebDriver 종료
            
            
            //DB에 넣으려고 검사 크롤링 값 dto에 셋하기
            dto.setTest25_1(valueSummary);
    		dto.setTest25_2(valueScore);
    		dto.setTest25_3(valueType);
    		dto.setTest25_4(valueImport);
        }
		
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
	public List<String> crawlingSplit(AptitudeTestValueDTO dto, String qnum) {
	    // 결과를 저장할 리스트를 생성합니다.
	    List<String> resultList = new ArrayList<>();
	    
	    // qnum이 "31"인 경우 실행합니다.
	    if (qnum.equals("31")) {
	        // dto 객체의 Test31_2 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest31_2().toString().split("\\+");
	        
	        // 나눈 각 값을 반복하여 처리합니다.
	        for(String num : array) {
	            // 문자열을 실수로 변환하고 10을 곱합니다.
	            double value = Double.parseDouble(num.trim()) * 10;
	            
	            // 실수를 정수로 변환합니다.
	            int intValue = (int) value;
	            
	            // 변환한 정수 값을 resultList에 추가합니다.
	            resultList.add(String.valueOf(intValue));
	        }
	    }
	    
	    // qnum이 "21"인 경우 실행합니다.
	    if (qnum.equals("21")) {
	        // dto 객체의 Test21_2 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest21_2().toString().split("\\+");
	        
	        // 나눈 값을 resultList에 할당합니다.
	        resultList = Arrays.asList(array);
	    }
	    
	    // 결과 리스트를 반환합니다.
	    return resultList;
	}

	@Override
	public List<String> crawlingSplitRank(AptitudeTestValueDTO dto, String qnum) {
	    // 결과를 저장할 리스트를 생성합니다.
	    List<String> resultRankList = new ArrayList<>();
	    
	    // qnum이 "31"인 경우 실행합니다.
	    if (qnum.equals("31")) {
	        // dto 객체의 Test31_1 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest31_1().toString().split("\\+");
	        
	        // 나눈 값을 resultRankList에 할당합니다.
	        resultRankList = Arrays.asList(array);
	    }
	    
	    // qnum이 "21"인 경우 실행합니다.
	    if (qnum.equals("21")) {
	        // dto 객체의 Test21_1 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest21_1().toString().split("\\+");
	        
	        // 나눈 값을 resultRankList에 할당합니다.
	        resultRankList = Arrays.asList(array);
	    }
	    
	    // 결과 리스트를 반환합니다.
	    return resultRankList;
	}

	@Override
	public List<String> crawlingSplitJob(AptitudeTestValueDTO dto, String qnum) {
	    // 결과를 저장할 리스트를 생성합니다.
	    List<String> resultRankList = new ArrayList<>();
	    
	    // qnum이 "31"인 경우 실행합니다.
	    if (qnum.equals("31")) {
	        // dto 객체의 Test31_3 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest31_3().toString().split("\\+");
	        
	        // 나눈 값을 resultRankList에 할당합니다.
	        resultRankList = Arrays.asList(array);
	    }
	    
	    // qnum이 "21"인 경우 실행합니다.
	    if (qnum.equals("21")) {
	        // dto 객체의 Test21_3 필드 값을 "+"를 기준으로 나눕니다.
	        String[] array = dto.getTest21_3().toString().split("\\+");
	        
	        // 나눈 값을 resultRankList에 할당합니다.
	        resultRankList = Arrays.asList(array);
	    }
	    
	    // 결과 리스트를 반환합니다.
	    return resultRankList;
	}
	
	
	
	//크롤링한 거 DB에 넣기
	@Override
	public void crawlingInsert(AptitudeTestValueDTO dto) {
		mapper.crawlingInsert(dto);
	}
	
	
	//크롤링한 검사결과 화면에 출력하도록 가공
	@Override
	public List<String> reportView(String qnum, AptitudeTestValueDTO dto) {
		List<String> result = new ArrayList<>();
		AtomicInteger counter = new AtomicInteger(1);
		if (qnum.equals("27")) {
		    result = Stream.of(
		        dto.getTest27_1(),
		        dto.getTest27_2(),
		        dto.getTest27_3(),
		        dto.getTest27_4() + dto.getTest27_5()
		    )
		    .flatMap(value -> {
		        if (value.equals(dto.getTest27_2())) {
		            return Arrays.stream(value.split(" "));
		        } else {
		            return Arrays.stream(value.split("\\+"));
		        }
		    })
		    .map(value -> value.replace("검사결과", ""))
		    .map(String::trim) // 공백 제거
		    .filter(value -> value != null && !value.isEmpty())
		    .collect(Collectors.toList());
		    System.out.println("27의 결과 리스트" + result);
		}
		
		
		if (qnum.equals("25")) {
		    result = Stream.of(
		        dto.getTest25_1(),
		        dto.getTest25_2(),
		        dto.getTest25_3(),
		        dto.getTest25_4()
		    )
		    .flatMap(value -> {
		        if (value.equals(dto.getTest25_2())) {
		            return Arrays.stream(value.split(" "));
		        } else {
		            return Arrays.stream(value.split("\\+"));
		        }
		    })
		    .map(String::trim) // 공백 제거
		    .filter(value -> value != null && !value.isEmpty())
		    .collect(Collectors.toList());
		    System.out.println("25의 결과 리스트" + result);
		}
		
		return result;
	}
	
	// 검사지 임시 저장
	@Override
	public void temporarySaveInsert(List<String> answers, AptitudeTestTemporarySaveDTO dto, String qnum) {
		StringBuilder answer = new StringBuilder();
		for(int i = 0; i<answers.size(); i++) {
	    	answer.append(i+1).append("=").append(answers.get(i)).append(" ");
	    	if(qnum.equals("25") && i==48)
	    		answer.append(i+1).append("=").append("");
	    }
	    answer.setLength(answer.length() - 1); 
	    System.out.println(answer);
	    dto.setTest_num(Integer.parseInt(qnum));
	    dto.setTest_answers(answer.toString());
	    
	    String testName="";
	    if(qnum.equals("21")) {
	    	testName="직업적성검사";
	    }
	    if(qnum.equals("25")) {
	    	testName="직업가치관검사";
	    }
	    if(qnum.equals("27")) {
	    	testName="진로개발역량검사";
	    }
	    if(qnum.equals("31")) {
	    	testName="진로개발역량검사";
	    }
	    dto.setTest_name(testName);
	    
	    mapper.temporarySaveInsert(dto);
	}

	
	// 최근 검사 회수와 일자 정보 DB에서 select
	@Override
	public List<AptitudeTestValueDTO> getRecentTest(AptitudeTestValueDTO dto) {
		return mapper.getRecentTest(dto);
	}

	// 임시저장한 값 DB에서 꺼내기
	@Override
	public List<AptitudeTestTemporarySaveDTO> getTemporarySave(AptitudeTestTemporarySaveDTO dto) {
		return mapper.getTemporarySave(dto);
	}

	//임시저장한 검사지를 제출하면 DB에서 삭제
	@Override
	public void temporarySaveDelete(int test_num) {
		mapper.temporarySaveDelete(test_num);		
	}
	
	//임시저장한 검사지를 다시 임시저장하면, DB 업데이트
	@Override
	public void temporarySaveUpdate(List<String> answers, AptitudeTestTemporarySaveDTO dto, String qnum) {
		StringBuilder answer = new StringBuilder();
	    for(int i = 0; i<answers.size(); i++) {
	    	answer.append(i+1).append("=").append(answers.get(i)).append(" ");
	    	if(qnum.equals("25") && i==48)
	    		answer.append(i+1).append("=").append("");
	    }
	    answer.setLength(answer.length() - 1); 
	    
	    
	    dto.setTest_num(Integer.parseInt(qnum));
	    dto.setTest_answers(answer.toString());
	    
		mapper.temporarySaveUpdate(dto);
	}

}
