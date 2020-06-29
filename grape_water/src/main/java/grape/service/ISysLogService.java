package grape.service;

import grape.domain.SysLog;

import java.util.List;

public interface ISysLogService {
    public void save(SysLog sysLog) throws Exception;
    public List<SysLog> findAll(Integer page,Integer size) throws Exception;

    public List<SysLog> search(String usernameStr)throws Exception;

    public void delete(Integer id)throws Exception;
}
