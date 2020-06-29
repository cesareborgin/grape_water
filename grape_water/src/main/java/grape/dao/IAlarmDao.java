package grape.dao;

import grape.domain.AlarmType;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IAlarmDao {
    @Insert("insert into alarmType values(#{id},#{uid},#{alarmId},#{alarmStr})")
    public void insert(AlarmType alarmType)throws Exception;

    @Select("select * from alarmType")
    public List<AlarmType> list();

    @Delete("delete from alarmType where id=#{id}")
    public void delete(Integer id)throws Exception;

    @Update("update alarmType set uid=#{uid},alarmId=#{alarmId},alarmStr=#{alarmStr} where id=#{id}")
    public void update(AlarmType alarmType)throws Exception;
}
