package tryForge.file.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import tryForge.file.dao.UploadDao;
import tryForge.vo.FileStorage;

@Service
public class UploadService {
	@Autowired(required = false)
	private UploadDao dao;
	
@Value("${file.upload}")
private String path;

	public String uploadFile(FileStorage upload) {
		int chk = 0;
		
		MultipartFile[] mpfs = upload.getFiles();
		
		if(mpfs!=null && mpfs.length>0) {
			
			try {
				for(MultipartFile mpf:mpfs) {
				//  1) 파일업로드 처리
					String fname = mpf.getOriginalFilename();
					// MultipartFile ==> File 변환해서 저장.
					mpf.transferTo(new File(path+fname));
				//  2) db파일업로드 정보 입력	
				//  등록되는 갯수만큼 numbering 처리..
			//		chk += dao.uploadFile();
						//사이즈 등록도 해야 함	new FileStorage(fname,path,upload.getFname());
				}
			} catch (IllegalStateException e) {
				System.out.println("#파일업로드 예외1:"+e.getMessage());
	//			msg+="#파일업로드 예외1:"+e.getMessage()+"\\n";
			} catch (IOException e) {
				System.out.println("#파일업로드 예외2:"+e.getMessage());
		//		msg+="#파일업로드 예외2:"+e.getMessage()+"\\n";
			} catch(Exception e) {
				System.out.println("#기타 예외3:"+e.getMessage());
		//		msg+="#기타 예외3:"+e.getMessage()+"\\n";
			}
		}
		String msg = "파일 "+ chk+"건 등록 완료";
		return msg;
	}
}
