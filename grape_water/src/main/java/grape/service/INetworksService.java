package grape.service;

import grape.domain.Networks;

import java.util.List;

public interface INetworksService {
    public void insert(Networks networks)throws Exception;
    public List<Networks> list(Integer page,Integer size)throws Exception;
    public void delete(Integer id)throws Exception;
    public int update(Networks networks)throws Exception;
    public Networks finById(Integer id)throws Exception;
    public int update2(String photo,Integer id)throws Exception;
}
