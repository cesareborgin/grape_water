package grape.service;

import grape.domain.Meters;

import java.util.List;

public interface IMetersService {
    public void add(Meters meters)throws Exception;
    public List<Meters> findAll(Integer page,Integer size)throws Exception;
    public void update(Meters meters)throws Exception;
    public List<Meters> findByName(String codeStr,Integer page,Integer size)throws Exception;
    public void deleteById(Integer id)throws Exception;
    public Meters findById(Integer id)throws Exception;
    public List<Meters> getAll()throws Exception;
    public Integer getStatusI()throws Exception;
    public Integer getStatusII()throws Exception;
    public Integer getStatusIII()throws Exception;
    public Integer getStatusIV()throws Exception;
    public int sum()throws Exception;
}
