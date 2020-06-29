package grape.service;

import grape.domain.Pumps;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IPumpsService {
    public void save(Pumps pumps) throws Exception;
    public List<Pumps> findAll(Integer page,Integer size)throws Exception;
    public List<Pumps> findByName(String searchName,Integer page,Integer size)throws Exception;
    public void update (Pumps pumps) throws Exception;
    public void deleteById(Integer id) throws Exception;
    public Pumps findById(Integer id) throws Exception;
    public List<Pumps> getAll()throws Exception;
    public Integer importExcel(MultipartFile InputFile) throws Exception;
}
