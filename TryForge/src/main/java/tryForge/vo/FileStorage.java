package tryForge.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileStorage {
	private String fname;
	private String path;
	private String ftype;
	private String fsize;
	private String description;
	private Date upload_time;
	private MultipartFile[] files;
	public FileStorage(String fname, String path, String ftype, String fsize, String description, Date upload_time,
			MultipartFile[] files) {
		this.fname = fname;
		this.path = path;
		this.ftype = ftype;
		this.fsize = fsize;
		this.description = description;
		this.upload_time = upload_time;
		this.files = files;
	}
	public FileStorage() {
		// TODO Auto-generated constructor stub
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public String getFsize() {
		return fsize;
	}
	public void setFsize(String fsize) {
		this.fsize = fsize;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getUpload_time() {
		return upload_time;
	}
	public void setUpload_time(Date upload_time) {
		this.upload_time = upload_time;
	}
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
}
