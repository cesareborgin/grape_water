package grape.service;

import grape.domain.Repumps;

import java.util.List;

public interface IRepumpsService {
    public void save(Repumps repumps)throws Exception;
    public List<Repumps> findAll(Integer page, Integer size)throws Exception;
    public void deleteById(Integer id)throws Exception;
    public List<Repumps> searchCode(String codeStr, Integer page, Integer size)throws Exception;
    public List<Repumps> getAll()throws Exception;
    public Repumps fingById(Integer id)throws Exception;
    public void update(Repumps repumps)throws Exception;
}
