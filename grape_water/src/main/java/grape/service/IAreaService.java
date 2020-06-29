package grape.service;

import grape.domain.Area;

import java.util.List;

public interface IAreaService {
    public int add(Area area)throws Exception;

    public List<Area> getList(Integer page,Integer size)throws Exception;

    public Integer del(Integer id)throws Exception;

    public int edit(Area area)throws Exception;

    public List<Area> search(String nameStr)throws Exception;

    public int delete(String ids)throws Exception;

    public List<Area> getAll()throws Exception;
}
