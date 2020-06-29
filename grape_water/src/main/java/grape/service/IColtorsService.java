package grape.service;

import grape.domain.Coltors;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

public interface IColtorsService {
    public List<Coltors> findAll(Integer page,Integer size) throws Exception;
    public void save(Coltors coltors) throws Exception;
    public List<Coltors> findByColorName(String searchName,Integer page,Integer size) throws Exception;
    public void deleteById(Integer id) throws Exception;
    public Coltors findById(Integer id) throws Exception;
    public int update(Coltors coltors)throws Exception;
    public List<Coltors> getAll()throws Exception;
    public Integer getStatusA()throws Exception;
    public Integer getStatusB()throws Exception;
    public Integer getStatusC()throws Exception;
    public Integer getStatusD()throws Exception;
    public int sum()throws Exception;
}
