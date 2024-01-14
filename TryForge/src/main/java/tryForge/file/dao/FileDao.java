package tryForge.file.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import tryForge.vo.FileStorage;

public interface FileDao {
	@Select("SELECT * FROM FILESTORAGE WHERE PROJECT_KEY=#{project_key}")
	List<FileStorage> getFileList(FileStorage file);
}
