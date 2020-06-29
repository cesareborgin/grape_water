package grape.service;

import grape.domain.Parameters;

import java.util.List;

public interface IParameterService {
    public int insert(Parameters parameters)throws Exception;
    public List<Parameters> list(Integer page,Integer size)throws Exception;
    public int update(String parameterId,String parameterName,String unit,Integer id)throws Exception;
    public void delete(Integer id)throws Exception;
    public int exitParams(Integer parameterId)throws Exception;
    public void deleteParams(Integer parameterId)throws Exception;
    public List<Parameters> search(String nameStr)throws Exception;

}
