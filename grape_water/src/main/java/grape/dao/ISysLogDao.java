package grape.dao;

import grape.domain.SysLog;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ISysLogDao {
    @Insert("insert into syslog(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    public void save(SysLog sysLog) throws Exception;

    @Select("select * from sysLog")
    public List<SysLog> findAll() throws Exception;

    @Select("select * from sysLog where username LIKE CONCAT(CONCAT('%',#{searchStr},'%')) ORDER BY id")
    public List<SysLog> search(@Param("searchStr") String usernameStr)throws Exception;

    @Delete("delete from sysLog where id = #{id}")
    public void delete(@Param("id") Integer id)throws Exception;
}
