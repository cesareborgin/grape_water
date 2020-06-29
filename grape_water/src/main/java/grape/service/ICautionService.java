package grape.service;

import grape.domain.Caution;

import java.util.Date;
import java.util.List;

public interface ICautionService {
    public void insert(Caution caution)throws Exception;
    public List<Caution> list(Integer page,Integer size)throws Exception;
    public int countSum()throws Exception;
    public void delete(Integer id)throws Exception;
    public Caution findById(Integer id)throws Exception;
    public void update(Caution caution)throws Exception;
    public int countSumM(String dateStr)throws Exception;
    public int countSumY(String dateStr)throws Exception;
    public List<Caution> search(Date date1, Date date2, String objNameStr)throws Exception;
}
