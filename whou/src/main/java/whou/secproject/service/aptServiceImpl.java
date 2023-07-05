package whou.secproject.service;


import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class aptServiceImpl implements aptService {

//	@Autowired
//	private MemberMapper mapper;
	
	public String conn2(Model model) throws REXPMismatchException {
	      RConnection c = null;
	      try {
	            // Rserve에 연결
	            c = new RConnection();
	            
//	            c.eval("library(KoNLP)");
//	            c.eval("library(wordcloud2)");
//	            c.eval("library(htmltools)");
//	            c.eval("library(tm)");
//	            c.eval("library(stringr)");
//	            c.eval("useSejongDic()");
//	            c.eval("useNIADic()");
//	            c.eval("library(rvest)");
	            c.eval("library(RSelenium)");

	            c.eval("remDr$navigate(\"https://www.career.go.kr/inspct/web/psycho/vocation/report?seq=NjMzOTIwODQ\")");
	            c.eval("re <- remDr$findElements(\"css\",\"#ct > div.aptitude_result_wrap > div.aptitude-result-content > div.cont-wrap.page-break > ul > li > strong\")");
	            c.eval("test_all <- sapply(re, function(x){x$getElementText()})");
	            
	            c.eval("re <- remDr$findElements(\"css\",\"#ct > div.aptitude_result_wrap > div.aptitude-result-content > div.cont-wrap.page-break > div:nth-child(5) > table > tbody > tr > td:nth-child(even)\")");
	            c.eval("test_percent <- sapply(re, function(x){x$getElementText()})");
	            
	            c.eval("re <- remDr$findElements(\"css\",\"#ct > div.aptitude_result_wrap > div.aptitude-result-content > div.cont-wrap.page-break > div:nth-child(7) > table > tbody > tr > th\")");
	            c.eval("test_rcm <- sapply(re, function(x){x$getElementText()})");

	            model.addAttribute("wc",  c.eval("test_all$html").asString());
	            
	        } catch (RserveException e) {
	            e.printStackTrace();
	        } finally {
	            // 연결 종료
	            if (c != null) {
	                c.close();
	            }
	        }
	      return "hello2";
	   }
	
}

