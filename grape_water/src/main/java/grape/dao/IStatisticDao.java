package grape.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IStatisticDao {

    @Select("select energyTime,energyElec,energyPay,energyCoal,energyCO2 from energy "
            +"where energyTime>=#{date1} AND energyTime<=#{date2} AND energyLocal LIKE CONCAT(CONCAT('%',#{localStr},'%'))"
            +"ORDER BY energyTime")
    public List<Map<String,Object>> getData(@Param("date1") Date date1,@Param("date2") Date date2,@Param("localStr") String localStr)throws Exception;


    @Select("select SUM(energyElec) AS enPower,SUM(energyPay) AS enCharge,SUM(energyCoal) AS enCoal,SUM(energyCO2) AS enCarbon from energy "
            +"where energyTime>=#{date1} AND energyTime<=#{date2} AND energyLocal LIKE CONCAT(CONCAT('%',#{localStr},'%'))")
    public List<Map<String,Object>> getPie(@Param("date1") Date date1,@Param("date2") Date date2,@Param("localStr") String localStr)throws Exception;
}
