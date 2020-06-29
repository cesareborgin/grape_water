package grape.dao;

import grape.domain.Repumps;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRepumpsDao {
    @Select("select * from reporta")
    public List<Repumps> findAll()throws Exception;

    @Insert("insert into reporta values(null,#{monitorfirstDate},#{monitorsecondDate},#{modelCode},#{inletPressure},#{outletPressure},#{temperature},#{headDelivery},#{rateFlow},#{operateEfficiency},#{transferEfficiency},#{suctionHeight},#{drainageHeight},#{craftPressure},#{backwaterPressure},#{potentialDifference})")
    public void save(Repumps repumps)throws Exception;

    @Delete("delete from reporta where id=#{id}")
    public void deleteById(Integer id)throws Exception;

    @Select("select * from reporta where id = #{id}")
    public Repumps findById(@Param("id") Integer id)throws Exception;

    @Select("select * from reporta where modelCode LIKE CONCAT(CONCAT('%',#{codeStr},'%')) ORDER BY id")
    public List<Repumps> searchList(@Param("codeStr") String codeStr)throws Exception;

    @Update("update reporta set monitorfirstDate=#{monitorfirstDate},monitorsecondDate=#{monitorsecondDate},modelCode=#{modelCode},inletPressure=#{inletPressure},outletPressure=#{outletPressure},temperature=#{temperature},headDelivery=#{headDelivery},rateFlow=#{rateFlow},operateEfficiency=#{operateEfficiency},transferEfficiency=#{transferEfficiency},suctionHeight=#{suctionHeight},drainageHeight=#{drainageHeight},craftPressure=#{craftPressure},backwaterPressure=#{backwaterPressure},potentialDifference=#{potentialDifference} where id=#{id}")
    public void update(Repumps repumps)throws Exception;

}
