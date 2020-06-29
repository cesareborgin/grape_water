package grape.service;

import grape.domain.Networks;

import java.util.List;

public interface IPictureService {

    public int insert(Networks networks)throws Exception;
    public List<Networks> list(Integer page,Integer size)throws Exception;

}
