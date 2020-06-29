package grape.dao;

import grape.domain.Entity;
import grape.domain.Parameters;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IEntityDao {

    @Insert("insert into entity values(null,#{entityId},#{customerName},#{entityName},#{entityType},#{entityTypeStr})")
    public void add(Entity entity)throws Exception;

    @Select("select * from entity order by id")
    public List<Entity> list()throws Exception;

    @Select("select * from entity where id=#{id}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "entityId",column = "entityId"),
            @Result(property = "customerName",column = "customerName"),
            @Result(property = "entityName", column = "entityName"),
            @Result(property = "entityType", column = "entityType"),
            @Result(property = "parameters",column = "id",javaType = java.util.List.class,many = @Many(select = "grape.dao.IParameterDao.findParamByEntityId"))
    })
    public Entity findById(Integer id)throws Exception;

    @Select("select * from entity where entityName=#{entityName}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "entityId",column = "entityId"),
            @Result(property = "customerName",column = "customerName"),
            @Result(property = "entityName", column = "entityName"),
            @Result(property = "entityType", column = "entityType"),
            @Result(property = "parameters",column = "id",javaType = java.util.List.class,many = @Many(select = "grape.dao.IParameterDao.findParamByEntityId"))
    })
    public Entity findByName(String entityName )throws Exception;

    @Select("select * from entity where id=#{id}")
    public Entity findId(Integer id)throws Exception;

    @Insert("insert into entity_parameters values(#{entityId},#{parameterId})")
    public void addParameterToEntity(@Param("entityId") Integer entityId, @Param("parameterId") Integer parameter)throws Exception;

    @Select("select * from parameters where id not in (select parameterId from entity_parameters where entityId=#{entityId})")
    public List<Parameters> findOtherParam(@Param("entityId") Integer entityId)throws Exception;

    @Select("select * from entity where entityName LIKE CONCAT(CONCAT('%',#{nameStr},'%')) ORDER BY id")
    public List<Entity> search(@Param("nameStr") String entityStr)throws Exception;

    @Delete("delete from entity where id=#{id}")
    public void delete(Integer id)throws Exception;

    @Delete("delete from entity_parameters where entityId=#{entityId}")
    public void deleteParams(Integer entityId)throws Exception;

    @Select("select count(*) from entity_parameters where entityId=#{entityId}")
    public int exitEntity(Integer entityId)throws Exception;

    @Update("update entity set entityId=#{entityId},customerName=#{customerName},entityName=#{entityName},entityType=#{entityType},entityTypeStr=#{entityTypeStr} where id=#{id}")
    public int update(Entity entity)throws Exception;

    @Select("select * from entity where entityType=1")
    public List<Entity> getEntityI()throws Exception;
    @Select("select * from entity where entityType=2")
    public List<Entity> getEntityII()throws Exception;
    @Select("select * from entity where entityType=3")
    public List<Entity> getEntityIII()throws Exception;
    @Select("select * from entity where entityType=4")
    public List<Entity> getEntityIV()throws Exception;
    @Select("select * from entity where entityType=5")
    public List<Entity> getEntityV()throws Exception;
}
