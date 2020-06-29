package grape.service.impl;

import grape.dao.IStatisticDao;
import grape.domain.Energy;
import grape.domain.statMonths;
import grape.service.IStatisticService;
import grape.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class StatisticServiceImpl implements IStatisticService{
    @Autowired
    private IStatisticDao statisticDao;

    public List<Map<String, Object>> getData(Date date1, Date date2, String localStr) throws Exception {
        List<Map<String,Object>> data = new ArrayList<Map<String, Object>>();
        List<Map<String,Object>> listdata = statisticDao.getData(date1, date2, localStr);
        if(listdata.size()>0){
            for(int i=0;i<listdata.size();i++){
                Map<String,Object> map = new HashMap<String,Object>();
                map.put("timeData", DateUtils.date2String((Date)listdata.get(i).get("energyTime"),"yyyy-MM-dd"));
                map.put("enPower",listdata.get(i).get("energyElec"));
                map.put("enCharge",listdata.get(i).get("energyPay"));
                map.put("enCoal",listdata.get(i).get("energyCoal"));
                map.put("enCarbon",listdata.get(i).get("energyCO2"));
                data.add(map);
            }
        }
        return data;
    }

    public List<Map<String, Object>> getPie(Date date1, Date date2, String localStr) throws Exception {
        List<Map<String,Object>> data = new ArrayList<Map<String, Object>>();
        List<Map<String,Object>> pieData = statisticDao.getPie(date1, date2, localStr);
        if(pieData.size()>0){
            for(int i=0;i<pieData.size();i++){
                Map<String,Object> map = new HashMap<String,Object>();
                map.put("enPower",pieData.get(i).get("enPower"));
                map.put("enCharge",pieData.get(i).get("enCharge"));
                map.put("enCoal",pieData.get(i).get("enCoal"));
                map.put("enCarbon",pieData.get(i).get("enCarbon"));
                data.add(map);
            }
        }
        return data;
    }
}
