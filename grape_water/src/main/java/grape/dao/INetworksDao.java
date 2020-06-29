package grape.dao;

import grape.domain.Networks;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface INetworksDao {
    @Insert("insert into networks values(null,#{objName},#{parameters},#{photo},#{remark},#{createTime})")
    public int insert(Networks networks)throws Exception;

    @Select("select * from networks")
    public List<Networks> list()throws Exception;

    @Delete("delete from networks where id=#{id}")
    public int delete(Integer id)throws Exception;

    @Update("update from networks set objName=#{objName},parameters=#{parameters},photo=#{photo},remark=#{remark} where id=#{id}")
    public int update(Networks networks)throws Exception;

    @Select("select * from networks where id=#{id}")
    public Networks findById(Integer id)throws Exception;

    @Update("update networks set photo=#{photo} where id=#{id}")
    public int update2(@Param("photo") String photo,@Param("id") Integer id)throws Exception;
}
