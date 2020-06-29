package grape.dao;

import grape.domain.Caution;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

public interface ICautionDao {
    @Insert("insert into caution values(null,#{objName},#{targetType},#{alarmLevel},#{startTime},#{durationTime},#{status})")
    public void insert(Caution caution)throws Exception;

    @Select("select * from caution order by id")
    public List<Caution> list();

    @Select("select count(*) from caution")
    public int countSum()throws Exception;

    @Delete("delete from caution where id=#{id}")
    public void delete(Integer id)throws Exception;

    @Select("select * from caution where id=#{id}")
    public Caution findById(@Param("id") Integer id)throws Exception;

    @Update("update caution set objName=#{objName},targetType=#{targetType},alarmLevel=#{alarmLevel},startTime=#{startTime},durationTime=#{durationTime},status=#{status} where id=#{id}")
    public void update(Caution caution)throws Exception;

    @Select("select count(*) from caution where startTime LIKE CONCAT(CONCAT(#{dateStr},'%')) and alarmLevel<4")
    public int countSumW(@Param("dateStr") String dateStr)throws Exception;

    @Select("select count(*) from caution where startTime LIKE CONCAT(CONCAT(#{dateStr},'%')) and alarmLevel>=4")
    public int countSumY(@Param("dateStr") String dateStr)throws Exception;

    @Select("select * from caution where startTime>=#{date1} and startTime<=#{date2} and objName LIKE CONCAT(CONCAT('%',#{objNameStr},'%'))")
    public List<Caution> search(@Param("date1") Date date1, @Param("date2") Date date2, @Param("objNameStr") String objNameStr)throws Exception;
}
