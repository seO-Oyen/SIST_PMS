package tryForge.file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.file.dao.FileDao;
import tryForge.vo.FileStorage;

@Service
public class FileService {
	@Autowired(required = false)
	private FileDao dao;
	
	public List<FileStorage> FileList(FileStorage file){
			
		return dao.getFileList(file);
	}
	
	// type에 따른 아이콘 출력
	public String getIcon(String ftype) {
		switch (ftype) {
	        case "zip":
	            return "/icons/zip-icon.png";
	        case "html":
	        case "css":
	        case "javascript":
	            return "/icons/code-icon.png";
	        case "mp4":
	        case "avi":
	            return "/icons/video-icon.png";
	        case "mpeg":
	        case "wav":
	            return "/icons/audio-icon.png";
	        case "wordprocessingml.document":
	            return "/icons/word-icon.png";
	        case "spreadsheetml.sheet":
	            return "/icons/excel-icon.png";
	        case "presentationml.presentation":
	            return "/icons/ppt-icon.png";
	        case "pdf":
	            return "/icons/pdf-icon.png";
	        case "jpeg":
	        case "png":
	            return "/icons/image-icon.png";
	        case "plain":
	            return "/icons/text-icon.png";
	        // 실행 파일의 경우 일반적인 MIME 타입이 없으므로 확장자나 다른 방법으로 판별 필요
	        default:
	            return "/icons/default-icon.png";
		}
		
	}
}
