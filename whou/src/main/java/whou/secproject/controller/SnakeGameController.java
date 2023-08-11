package whou.secproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SnakeGameController {
		@RequestMapping("indexPage")
		public String snakeGamePage() {
			return "/indexPage/snakeGame";
		}
}
