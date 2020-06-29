package grape.dao;


import grape.domain.Pumps;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IPumpsDao {
    @Select("select * from pumps")
    public List<Pumps> findAll()throws Exception;

    @Insert("insert into pumps(inernalName,modelType,MTOP,ROF,electricity,voltage,efficiency,shaft,DGAT,SGAT,REV,HODL,LOFT) values(#{inernalName},#{modelType},#{MTOP},#{ROF},#{electricity},#{voltage},#{efficiency},#{shaft},#{DGAT},#{SGAT},#{REV},#{HODL},#{LOFT})")
    public void save(Pumps pumps)throws Exception;

    @Select("select * from pumps where inernalName LIKE CONCAT(CONCAT('%',#{searchName},'%')) ORDER BY id")
    public List<Pumps> searchList(@Param("searchName") String searchName)throws Exception;

    @Delete("delete from pumps where id=#{id}")
    public void deleteById(Integer id)throws Exception;

    @Select("select * from pumps where id=#{id}")
    public Pumps findById(Integer id) throws Exception;

    @Update("update pumps set inernalName=#{inernalName},modelType=#{modelType},MTOP=#{MTOP},ROF=#{ROF},electricity=#{electricity},voltage=#{voltage},efficiency=#{efficiency},shaft=#{shaft},DGAT=#{DGAT},SGAT=#{SGAT},REV=#{REV},HODL=#{HODL},LOFT=#{LOFT} where id=#{id}")
    public void update(Pumps pumps)throws Exception;
}
