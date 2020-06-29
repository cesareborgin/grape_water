package grape.dao;

import grape.domain.Sensors;
import grape.domain.Senter;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ISensorsDao {

    @Insert("insert into sensors values(null,#{sensorsName},#{sensorsType},#{installtionAddr},#{precision},#{baudRate},#{lastTime},#{nextTime},#{pressureGrade},#{tempGrade},#{prl},#{status}) ")
    public void save(Sensors sensor)throws Exception;

    @Select("select * from sensors")
    public List<Sensors> findAll()throws Exception;

    @Delete("delete from sensors where id=#{id}")
    public void deleteById(Integer id)throws Exception;

    @Select("select * from sensors where id=#{id}")
    public Sensors findById(Integer id)throws Exception;

    @Select("select * from sensors where sensorsName LIKE CONCAT(CONCAT('%',#{searchName},'%')) ORDER BY id")
    public List<Sensors> searchList(@Param("searchName") String searchName)throws Exception;
    
    @Select("select count(*) from sensors where status=1 or status=2")
    public Integer getStatusA()throws Exception;
    @Select("select count(*) from sensors where status=0")
    public Integer getStatusB()throws Exception;
    @Select("select count(*) from sensors where status=1")
    public Integer getStatusC()throws Exception;
    @Select("select count(*) from sensors where status=2")
    public Integer getStatusD()throws Exception;

    @Select("select count(*) from sensors")
    public int sum()throws Exception;

    @Update("update sensors set sensorsName=#{sensorsName},sensorsType=#{sensorsType},installtionAddr=#{installtionAddr} where id=#{id}")
    public int update(@Param("sensorsName") String sensorsName,@Param("sensorsType") String sensorsType,@Param("installtionAddr") String installtionAddr,@Param("id") Integer id)throws Exception;
}
