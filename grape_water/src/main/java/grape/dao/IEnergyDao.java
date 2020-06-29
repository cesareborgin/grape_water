package grape.dao;

import grape.domain.Energy;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

public interface IEnergyDao {

    @Insert("insert into energy values(null,#{energyTime},#{energyLocal},#{energyCode},#{energyElec},#{energyPay},#{energyCoal},#{energyCO2})")
    public int save(Energy energy)throws Exception;

    @Select("select * from energy order by id")
    public List<Energy> findAll()throws Exception;

    @Delete("delete from energy where id=#{id}")
    public Integer deleteById(Integer id)throws Exception;

    @Select("select * from energy where id=#{id}")
    public Energy findById(Integer id)throws Exception;

    @Update("update energy set energyTime=#{energyTime},energyLocal=#{energyLocal},energyCode=#{energyCode},energyElec=#{energyElec},energyPay=#{energyPay},energyCoal=#{energyCoal},energyCO2=#{energyCO2} where id=#{id}")
    public Integer update(Energy energy)throws Exception;

    @Select("select * from energy where energyTime>=#{beginTime} and energyTime<=#{endTime} ORDER BY id")
    public List<Energy> findlist(@Param("beginTime") Date date1,@Param("endTime") Date date2)throws Exception;

    @Select("select * from energy order by energyTime")
    public List<Energy> getAll()throws Exception;
}
