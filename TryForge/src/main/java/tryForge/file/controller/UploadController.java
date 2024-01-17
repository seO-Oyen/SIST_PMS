package tryForge.file.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import tryForge.file.service.UploadService;
import tryForge.vo.FileStorage;

@Controller
public class UploadController {
	@Autowired(required = false)
	private UploadService service;
	
	@PostMapping("upload.do")
	public String upload(FileStorage file, Model d) {
		d.addAttribute("msg", service.uploadFile(file));
		return "/project/fileStorage";
	}
}
