package grape.dao;

import grape.domain.Meters;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IMetersDao {
    @Select("select * from meters")
    public List<Meters> findAll()throws Exception;

    @Insert("insert into meters values(null,#{modelCode},#{productName},#{meterName},#{meterType},#{measureAccuracy},#{caliber},#{protector},#{specification},#{coumMethod},#{location},#{locationCode},#{status})")
    public void add(Meters meters)throws Exception;

    @Update("update meters set modelCode=#{modelCode},productName=#{productName},meterName=#{meterName},meterType=#{meterType},measureAccuracy=#{measureAccuracy},caliber=#{caliber},protector=#{protector},specification=#{specification},coumMethod=#{coumMethod},location=#{location},locationCode=#{locationCode},status=#{status} where id=#{id}")
    public void update(Meters meters)throws Exception;

    @Delete("delete from meters where id=#{id}")
    public void deleteById(Integer id)throws Exception;

    @Select("select * from meters where id=#{id}")
    public Meters findById(Integer id)throws Exception;

    @Select("select * from meters where modelCode LIKE CONCAT(CONCAT('%',#{codeStr},'%')) ORDER BY id")
    public List<Meters> findBymeterName(@Param("codeStr") String codeStr)throws Exception;

    @Select("select count(*) from meters where status=1 or status=2")
    public Integer getStatusI()throws Exception;
    @Select("select count(*) from meters where status=0")
    public Integer getStatusII()throws Exception;
    @Select("select count(*) from meters where status=1")
    public Integer getStatusIII()throws Exception;
    @Select("select count(*) from meters where status=2")
    public Integer getStatusIV()throws Exception;

    @Select("select count(*) from meters")
    public int sum()throws Exception;
}
