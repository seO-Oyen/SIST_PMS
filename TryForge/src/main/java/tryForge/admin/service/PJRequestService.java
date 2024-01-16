package tryForge.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tryForge.admin.dao.PJRequestDao;

@Service
public class PJRequestService {
	@Autowired(required = false)
	private PJRequestDao dao;
	
	
}
