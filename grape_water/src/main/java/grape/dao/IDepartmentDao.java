package grape.dao;

import grape.domain.Department;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IDepartmentDao {

    @Insert("insert into department values(null,#{departName},#{energyCode},#{managerName})")
    public Integer add(Department department)throws Exception;

    @Select("select * from department order by id")
    public List<Department> getAll()throws Exception;

    @Delete("delete from department where id = #{id}")
    public Integer delete(Integer id)throws Exception;

    @Update("update department set departName=#{departName},energyCode=#{energyCode},managerName=#{managerName} where id=#{id}")
    public Integer edit(Department department)throws Exception;

    @Select("select * from department where departName like concat(concat('%',#{departNameStr},'%'))")
    public List<Department> search(@Param("departNameStr") String departNameStr)throws Exception;
}
