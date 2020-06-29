package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.ISensorsDao;
import grape.domain.Sensors;
import grape.service.ISensorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
@Service("sensorsService")
@Transactional
public class SensorsServiceImpl implements ISensorsService {

    @Autowired
    private ISensorsDao sensorsDao;
    public List<Sensors> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return sensorsDao.findAll();
    }

    public void save(Sensors sensors) throws Exception {
        sensorsDao.save(sensors);
    }

    public List<Sensors> findByEquipmentName(String searchName, Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return sensorsDao.searchList(searchName);
    }

    public void deleteById(Integer id) throws Exception {
        sensorsDao.deleteById(id);
    }

    public Sensors findById(Integer id) throws Exception {
        return sensorsDao.findById(id);
    }

    public List<Sensors> getAll() throws Exception {
        return sensorsDao.findAll();
    }
    public Integer getStatusA() throws Exception {
        return sensorsDao.getStatusA();
    }

    public Integer getStatusB() throws Exception {
        return sensorsDao.getStatusB();
    }

    public Integer getStatusC() throws Exception {
        return sensorsDao.getStatusC();
    }

    public Integer getStatusD() throws Exception {
        return sensorsDao.getStatusD();
    }

    public int sum() throws Exception {
        return sensorsDao.sum();
    }

    public int update(String sensorsName, String sensorsType, String installtionAddr, Integer id) throws Exception {
        return sensorsDao.update(sensorsName, sensorsType, installtionAddr, id);
    }
}
