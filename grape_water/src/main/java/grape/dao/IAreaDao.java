package grape.dao;

import grape.domain.Area;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IAreaDao {
    @Insert("insert into area values(null,#{enLocal},#{enCode})")
    public int add(Area area)throws Exception;

    @Select("select * from area order by id")
    public List<Area> getAll()throws Exception;

    @Delete("delete from area where id=#{id}")
    public Integer del(Integer id)throws Exception;

    @Select("select * from area where enLocal like concat(concat('%',#{nameStr},'%'))")
    public List<Area> find(@Param("nameStr") String nameStr)throws Exception;

    @Update("update area set enLocal=#{enLocal},enCode=#{enCode} where id=#{id}")
    public int edit(Area area)throws Exception;

    @Delete("delete from area where id in (${value})")
    public int delete(String ids)throws Exception;

}
