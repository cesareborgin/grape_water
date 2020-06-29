package grape.service;

import grape.domain.Energy;

import java.util.Date;
import java.util.List;

public interface IEnergyService {

    public int add(Energy energy)throws Exception;

    public List<Energy> findAll()throws Exception;

    public List<Energy> findList(Integer page,Integer size)throws Exception;

    //单条数据的删除
    public Integer deleteById(Integer id)throws Exception;

    public Energy findById(Integer id)throws Exception;

    public Integer update(Energy energy)throws Exception;

    public List<Energy> getlist(Date date1, Date date2)throws Exception;
}
