package whou.secproject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import whou.secproject.component.EducationApiParamDTO;
import whou.secproject.component.EducationMajorResponseDTO;
import whou.secproject.component.EducationMajorResponseDTO.MajorInfo;
import whou.secproject.repository.EducationApiDAO;

@Controller
@RequestMapping("/education")
public class EducationController {
	
	@Autowired
	private EducationApiDAO dao;
	
	@RequestMapping("/majorList")
	public String educationList(Model model, HttpServletRequest request) throws IOException {
		String notFirst = request.getParameter("notFirst"); // jsp에서 폼제출 받았는지 체크
		
		if(notFirst != null && notFirst.equals("notFirst")) {
			StringBuilder sb = null;
			
			//파라미터 가져오기
			String univSe="";
			String [] univSeArr = request.getParameterValues("univSe"); //대학 전문대학
			if(request.getParameterValues("univSe") != null) {
				sb = new StringBuilder(univSeArr[0]);
				for(int i=1; i<univSeArr.length; i++) {
					sb.append(",").append(univSeArr[i]);
				}
				univSe=sb.toString();
			}
			
			String subject="";
			String [] subjectArr = request.getParameterValues("subject"); // 학과 계열
			if(subjectArr != null) {
				sb = new StringBuilder(subjectArr[0]);
				for(int i=1; i<subjectArr.length; i++) {
					sb.append(",").append(subjectArr[i]);
				}
				subject=sb.toString();
			}
			
			String thisPage = request.getParameter("thisPage")!=null ? request.getParameter("thisPage"):"1"; //현재페이지
			String perPage = request.getParameter("perPage")!= null ? request.getParameter("perPage"):"10"; //한페이지당 건수
			String searchTitle = request.getParameter("searchTitle"); //검색어
			
			
			
			//파라미터 DTO에 set하기
			EducationApiParamDTO paramDTO= new EducationApiParamDTO();
			paramDTO.setUnivSe(univSe);
			paramDTO.setSubject(subject);
			paramDTO.setThisPage(thisPage);
			paramDTO.setPerPage(perPage);
			if(searchTitle.length() > 0) {
				paramDTO.setSearchTitle(searchTitle);
			}
			
			// 결과 개수 세기
			EducationMajorResponseDTO pageCount = dao.getMajorApi(paramDTO);
			int pageNum = 1;
			while(pageCount.getDataSearch().getContent().size() == 10) {
				pageNum++;
				paramDTO.setThisPage(String.valueOf(pageNum));
				pageCount = dao.getMajorApi(paramDTO);
			}
			System.out.println(pageNum);
			
			// 모든 결과 불러오기
			List<EducationMajorResponseDTO.MajorInfo> majorDetailLstResponseDTO = new ArrayList<>();
			EducationMajorResponseDTO responseDTO = dao.getMajorApi(paramDTO);
			int univCount = responseDTO.getDataSearch().getContent().size();
			
			
			for(int i=0; i<10; i++) {
				majorDetailLstResponseDTO.add(responseDTO.getDataSearch().getContent().get(i));
			}

		    System.out.println("이게 머야 majorDetailLstResponseDTO "+majorDetailLstResponseDTO);
		    System.out.println();
			
			model.addAttribute("paramDTO", paramDTO);
			model.addAttribute("univCount", univCount); //총 결과 수
			model.addAttribute("pageNum", univCount/Integer.parseInt(perPage)+1); //총 페이지 수
			model.addAttribute("RESULT", responseDTO);
			model.addAttribute("majorDetailLstResponseDTO", majorDetailLstResponseDTO);
		}
		
		
		// 학과 설명 가져오기
		
		
		model.addAttribute("notFirst", notFirst);
	    return "/education/education";
	}
	
	
	
}
