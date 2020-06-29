package grape.service;

import grape.domain.Sensors;
import grape.domain.Senter;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ISensorsService {
    public List<Sensors> findAll(Integer page,Integer size)throws Exception;
    public void save(Sensors sensors)throws Exception;
    public List<Sensors> findByEquipmentName(String searchName,Integer page,Integer size)throws Exception;
    public void deleteById(Integer id)throws Exception;
    public Sensors findById(Integer id)throws Exception;
    public List<Sensors> getAll()throws Exception;//不分页
    public Integer getStatusA()throws Exception;
    public Integer getStatusB()throws Exception;
    public Integer getStatusC()throws Exception;
    public Integer getStatusD()throws Exception;
    public int sum()throws Exception;
    public int update(String sensorsName,String sensorsType,String installtionAddr,Integer id)throws Exception;
}
