package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.ISysLogDao;
import grape.domain.SysLog;
import grape.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {
    @Autowired
    private ISysLogDao sysLogDao;
    public void save(SysLog sysLog) throws Exception {
        sysLogDao.save(sysLog);
    }

    public List<SysLog> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return sysLogDao.findAll();
    }

    public List<SysLog> search(String usernameStr) throws Exception {
        return sysLogDao.search(usernameStr);
    }

    public void delete(Integer id) throws Exception {
        sysLogDao.delete(id);
    }
}
