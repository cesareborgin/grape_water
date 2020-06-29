package grape.service;

import grape.domain.Energy;


import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IStatisticService {
    public List<Map<String,Object>> getData(Date date1,Date date2,String localStr)throws Exception;

    public List<Map<String,Object>> getPie(Date date1,Date date2,String localStr)throws Exception;
}
