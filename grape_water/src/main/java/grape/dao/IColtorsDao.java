package grape.dao;

import grape.domain.Coltors;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface IColtorsDao {
    @Select("select * from coltors")
    public List<Coltors> findAll() throws Exception;

    @Insert("insert into coltors(coltorName,coltorType,sysNumber,code,installtionName,installtionCode,testobjName,serialPort,tableAdrr,status) values(#{coltorName},#{coltorType},#{sysNumber},#{code},#{installtionName},#{installtionCode},#{testobjName},#{serialPort},#{tableAdrr},#{status})")
    public void save(Coltors coltors) throws Exception;

    @Select("select * from coltors where coltorName LIKE CONCAT(CONCAT('%',#{searchName},'%')) ORDER BY id")
    public List<Coltors> searchList(@Param("searchName") String searchName)throws Exception;

    @Delete("delete from coltors where id=#{id}")
    public void deleteById(Integer id)throws Exception;

    @Select("select * from coltors where id=#{id}")
    public Coltors findById(Integer id) throws Exception;

    @Update("update coltors set coltorName=#{coltorName},coltorType=#{coltorType},sysNumber=#{sysNumber},code=#{code},installtionName=#{installtionName},installtionCode=#{installtionCode},testobjName=#{testobjName},serialPort=#{serialPort},tableAdrr=#{tableAdrr} where id=#{id}")
    public int update(Coltors coltors);

    @Insert("insert into coltors(coltorName,coltorType,sysNumber,code,installtionName,installtionCode,testobjName,serialPort,tableAdrr,status) values(#{coltorName},#{coltorType},#{sysNumber},#{code},#{installtionName},#{installtionCode},#{testobjName},#{serialPort},#{tableAdrr},#{status})")
    public void InputExcel(Map<String,Object> map) throws Exception;

    @Select("select count(*) from coltors where status=1 or status=2")
    public Integer getStatusA()throws Exception;
    @Select("select count(*) from coltors where status=0")
    public Integer getStatusB()throws Exception;
    @Select("select count(*) from coltors where status=1")
    public Integer getStatusC()throws Exception;
    @Select("select count(*) from coltors where status=2")
    public Integer getStatusD()throws Exception;

    @Select("select count(*) from coltors")
    public int sum()throws Exception;
}
