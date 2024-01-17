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
		List<FileStorage> fileList = dao.getFileList(file);
		for(FileStorage fs:fileList) { // ftype 에 따른 icon get
			String iconPath = getIcon(fs.getFtype());
			fs.setIconPath(iconPath);
		}
		return fileList;
	}
	
	// type에 따른 아이콘 출력
	public String getIcon(String ftype) {
	    switch (ftype) {
        case "bmp":
            return "${path}/icons/bmp-icon.png";
        case "cad":
        	return "/icons/cad-icon.png";
        case "dwg":
            return "/icons/dwg-icon.png";
        case "css":
            return "/icons/css-icon.png";
        case "db":
            return "/icons/db-icon.png";
        case "doc":
        	return "/icons/doc-icon.png";
        case "docx":
            return "/icons/docx-icon.png";
        case "gif":
            return "/icons/gif-icon.png";
        case "html":
            return "/icons/html-icon.png";
        case "ini":
            return "/icons/ini-icon.png";
        case "iso":
            return "/icons/iso-icon.png";
        case "java":
            return "/icons/java-icon.png";
        case "jpg":
            return "/icons/jpg-icon.png";
        case "jpeg":
            return "/icons/jpeg-icon.png";
        case "js":
            return "/icons/js-icon.png";
        case "mp3":
            return "/icons/mp3-icon.png";
        case "mp4":
            return "/icons/mp4-icon.png";
        case "pdf":
            return "/icons/pdf-icon.png";
        case "php":
            return "/icons/php-icon.png";
        case "png":
            return "/icons/png-icon.png";
        case "ppt":
            return "/icons/ppt-icon.png";
        case "rar":
            return "/icons/rar-icon.png";
        case "svg":
            return "/icons/svg-icon.png";
        case "plain":
            return "/icons/text-icon.png";
        case "tiff":
            return "/icons/tiff-icon.png";
        case "xls":
            return "/icons/xls-icon.png";
        case "xlsx":
            return "/icons/xlsx-icon.png";
        case "zip":
            return "/icons/zip-icon.png";
        case "msword":
            return "/icons/doc-icon.png";
        case "vnd.openxmlformats-officedocument.wordprocessingml.document":
            return "/icons/docx-icon.png";
        case "vnd.ms-excel":
            return "/icons/xls-icon.png";
        case "vnd.openxmlformats-officedocument.spreadsheetml.sheet":
            return "/icons/xlsx-icon.png";
        case "vnd.ms-powerpoint":
            return "/icons/ppt-icon.png";
        case "vnd.openxmlformats-officedocument.presentationml.presentation":
            return "/icons/ppt-icon.png";
        default:
            return "/icons/exe-icon.png";
	    }
		
	}
}
