package tryForge.file.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import tryForge.file.service.FileService;
import tryForge.vo.FileStorage;

@Controller
public class FileController {
	@Autowired(required = false)
	private FileService service;
	
	@GetMapping("file.do")
	public String upload(FileStorage file, Model d) {
		d.addAttribute("fList", service.FileList(file));
		return "/project/index";
	}
}
