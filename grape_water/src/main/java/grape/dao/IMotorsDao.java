package grape.dao;

import grape.domain.Motors;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IMotorsDao {
    @Select("select * from motors")
    public List<Motors> findAll()throws Exception;

    @Insert("insert into motors values(null,#{modelCode},#{testTime},#{inName},#{location},#{voltage},#{electricity},#{inputPower},#{outputPower},#{operateEfficiency},#{energyUnit},#{energyUsed})")
    public void save(Motors motors)throws Exception;

    @Select("select * from motors where modelCode LIKE CONCAT(CONCAT('%',#{codeStr},'%')) ORDER BY id")
    public List<Motors> findByCode(@Param("codeStr") String codeStr)throws Exception;

    @Delete("delete from motors where id = #{id}")
    public void deleteById(Integer id)throws Exception;

    @Update("update motors set modelCode=#{modelCode},testTime=#{testTime},inName=#{inName},location=#{location},voltage=#{voltage},electricity=#{electricity},inputPower=#{inputPower},outputPower=#{outputPower},operateEfficiency=#{operateEfficiency},energyUnit=#{energyUnit},energyUsed=#{energyUsed} where id=#{id}")
    public void update(Motors motors)throws Exception;

    @Select("select * from motors where id =#{id}")
    public Motors findMotorById(Integer id)throws Exception;
}
