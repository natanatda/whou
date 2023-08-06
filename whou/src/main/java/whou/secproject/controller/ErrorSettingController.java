package whou.secproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.NoHandlerFoundException;

@Controller
public class ErrorSettingController {
	/*
	private static Logger LOGGER = LoggerFactory.getLogger(ErrorSettingController.class);

	@GetMapping("/error404")
	public String Error404(HttpServletResponse res, Model model) {
		model.addAttribute("code", "ERROR_404");
		return "error/404";
	}

	@GetMapping("/error500")
	public String Error500(HttpServletResponse res, Model model) {
		model.addAttribute("code", "ERROR_500");
		return "error/500";
	}

	@GetMapping("/errorGeneral")
	public String ErrorGeneral(HttpServletResponse res, Model model) {
		model.addAttribute("code", "errorGeneral");
		return "error/errorGeneral";
	}*/

//	@RequestMapping("/error")
//    public String handleError() {
//        return "error/errorGeneral"; // 일반 에러 페이지의 뷰 이름을 반환합니다.
//    }

    @RequestMapping("/error404")
    public String handle404Error() {
        return "error/error404"; // 404 에러 페이지의 뷰 이름을 반환합니다.
    }

    @RequestMapping("/error500")
    public String handle500Error() {
        return "error/error500"; // 500 에러 페이지의 뷰 이름을 반환합니다.
    }

}
@ControllerAdvice
class GlobalControllerExceptionHandler {

//    @ExceptionHandler(Exception.class)
//    public String handleGeneralException(Exception ex, Model model) {
//        // 기타 일반적인 예외에 대한 처리 로직을 여기에 작성합니다.
//        model.addAttribute("code", "errorGeneral");
//        return "error/errorGeneral"; // 일반 에러 페이지의 뷰 이름을 반환합니다.
//    }

    @ExceptionHandler(NoHandlerFoundException.class)
    public String handle404Exception(Exception ex, Model model) {
        // 404 에러에 대한 처리 로직을 여기에 작성합니다.
        model.addAttribute("code", "error404");
        return "error/error404"; // 404 에러 페이지의 뷰 이름을 반환합니다.
    }
    
    @ExceptionHandler(HttpServerErrorException.class)
    public String handle500Exception(HttpServerErrorException ex, Model model) {
        // 500 에러에 대한 처리 로직을 여기에 작성합니다.
        model.addAttribute("code", "error500");
        return "error/error500"; // 500 에러 페이지의 뷰 이름을 반환합니다.
    }
}
