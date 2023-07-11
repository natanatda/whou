package whou.secproject.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
import whou.secproject.component.AptitudeTestValueDTOSJ;
import whou.secproject.mapper.AptitudeMapperSJ;

@Service
public class AptitudeServiceImplSJ implements AptitudeServiceSJ{

	@Autowired
	private AptitudeMapperSJ mapper;
	
	@Override
	public AptitudeTestValueDTOSJ testCrawling(String testURL, String qnum) {
		AptitudeTestValueDTOSJ dto = new AptitudeTestValueDTOSJ();
        System.setProperty("webdriver.chrome.driver", "D:\\crollingstudy\\bin\\chromedriver.exe");

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
            
            

//            //지향별 직업
//            String temp = null;
//            List <String> list = new ArrayList<>();
//            for (int i = 1; i <= 4; i++) {
//                String selector = "div.aptitude-result-content > div:nth-child(4) > ul > li:nth-child(" + i + ") > dl";
//                List<WebElement> elements = driver.findElements(By.cssSelector(selector));
//
//                for (WebElement element : elements) {
//                    temp = element.getText();
//                    temp = temp.replaceAll("\\n", "+");
//                }
//                list.add(temp);
//            }
            
            
            driver.quit();  // WebDriver 종료
            
            
            //DB에 넣으려고 검사 크롤링 값 dto에 셋하기
            dto.setTest25_1(valueSummary);
    		dto.setTest25_2(valueScore);
    		dto.setTest25_3(valueType);
    		dto.setTest25_4(valueImport);
//    		dto.setTest25_5(list.get(0));
//    		dto.setTest25_6(list.get(1));
//    		dto.setTest25_7(list.get(2));
//    		dto.setTest25_8(list.get(3));
        }
        
        
        
		if (qnum.equals("21")) {
			List<WebElement> developElements = driver.findElements(By.cssSelector(
					"div.cont-wrap.page-break > ul > li:nth-child(1) > strong"));
			StringBuilder str =new StringBuilder();
			for (WebElement element : developElements) {
				String text = element.getText();
				str.append(text);
			}
			System.out.println(str.toString());

			driver.quit(); // WebDriver 종료

			// DB에 넣으려고 검사 크롤링 값 dto에 셋하기
			dto.setTest21_1(str.toString());
		}
        return dto;
    }
	
	
	@Override
	public void crawlingInsert(AptitudeTestValueDTOSJ dto) {
		mapper.crawlingInsert(dto);
	}
	
	@Override
	public List<String> reportView(String qnum, AptitudeTestValueDTOSJ dto) {
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

	
	@Override
	public void temporarySaveInsert(List<String> answers, AptitudeTestTemporarySaveDTO dto, String qnum) {
		StringBuilder answer = new StringBuilder();
	    for(int i = 0; i<answers.size(); i++)
	    	answer.append(i+1).append("=").append(answers.get(i)).append(" ");
	    answer.setLength(answer.length() - 1); 
	    System.out.println(answer);
	    dto.setTestNum(Integer.parseInt(qnum));
	    dto.setTestAnswers(answer.toString());
	    mapper.temporarySaveInsert(dto);
	}
	
	
	@Override
	public List<AptitudeTestValueDTOSJ> getRecentTest(AptitudeTestValueDTOSJ dto){
		return mapper.getRecentTest(dto);
	}
	
	@Override
	public List<AptitudeTestTemporarySaveDTO> getTemporarySave(AptitudeTestTemporarySaveDTO dto){
		
		return null;
	} //임시저장한 값

}
