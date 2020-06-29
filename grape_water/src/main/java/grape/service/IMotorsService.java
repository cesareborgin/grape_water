package grape.service;

import grape.domain.Motors;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

public interface IMotorsService {
    public List<Motors> findAll(Integer page, Integer size)throws Exception;
    public void save(Motors motors)throws Exception;
    public List<Motors> findByCode(String codeStr,Integer page,Integer size)throws Exception;
    public void deleteById(Integer id)throws Exception;
    public void update(Motors motors)throws Exception;
    public List<Motors> getAll()throws Exception;
    public Motors findById(Integer id)throws Exception;
}
