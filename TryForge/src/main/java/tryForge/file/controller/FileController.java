package tryForge.file.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import tryForge.vo.FileStorage;

@Controller
public class FileController {
	@GetMapping("file.do")
	public String upload(FileStorage file, Model d) {
		//d.addAttribute("fList", service.uploadFile(file));
		return "/project/index";
	}
}
