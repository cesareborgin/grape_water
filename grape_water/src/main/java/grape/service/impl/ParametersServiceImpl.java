package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IParameterDao;
import grape.domain.Parameters;
import grape.service.IParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ParametersServiceImpl implements IParameterService {
    @Autowired
    private IParameterDao parameterDao;
    public int insert(Parameters parameters) throws Exception {
        return parameterDao.insert(parameters);
    }

    public List<Parameters> list(Integer page, Integer size) throws Exception{
        PageHelper.startPage(page,size);
        return parameterDao.list();
    }

    public int update(String parameterId, String parameterName,String unit, Integer id) throws Exception {
        return parameterDao.update(parameterId,parameterName,unit,id);
    }

    public void delete(Integer id) throws Exception {
        parameterDao.delete(id);
    }

    public int exitParams(Integer parameterId) throws Exception {
        return parameterDao.exitParams(parameterId);
    }

    public void deleteParams(Integer parameterId) throws Exception {
        parameterDao.deleteParams(parameterId);
    }

    public List<Parameters> search(String nameStr) throws Exception {
        return parameterDao.search(nameStr);
    }
}
