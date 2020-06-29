package grape.dao;

import grape.domain.Parameters;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IParameterDao {
    @Select("select * from parameters id in (select parameterId from entity_parameters where entityId=#{entityId})")
    public List<Parameters> findById(Integer entityId)throws Exception;

    @Select("select * from parameters")
    public List<Parameters> list()throws Exception;

    @Insert("insert into parameters values(null,#{parameterId},#{parameterName},#{parameterType},#{unit},#{precision},#{tag})")
    public int insert(Parameters parameters)throws Exception;

    @Update("update parameters set parameterId=#{parameterId},parameterName=#{parameterName},unit=#{unit} where id=#{id}")
    public int update(@Param("parameterId") String parameterId, @Param("parameterName") String parameterName, @Param("unit") String unit,@Param("id") Integer id)throws Exception;

    @Delete("delete from parameters where id=#{id}")
    public void delete(Integer id)throws Exception;

    @Delete("delete from entity_parameters from where parameterId=#{parameterId}")
    public void deleteParams(Integer parameterId)throws Exception;

    @Select("select count(*) from entity_parameters where parameterId=#{parameterId}")
    public int exitParams(Integer parameterId)throws Exception;

    @Select("select * from parameters where parameterName LIKE CONCAT(CONCAT('%',#{nameStr},'%')) ORDER BY id")
    public List<Parameters> search(@Param("nameStr") String nameStr)throws Exception;

    @Select("select * from parameters where id in (select parameterId from entity_parameters where entityId=#{entityId})")
    public List<Parameters> findParamByEntityId(Integer entityId) throws Exception;
}
