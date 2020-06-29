package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IMotorsDao;
import grape.domain.Motors;
import grape.service.IMotorsService;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class MotorsServiceImpl implements IMotorsService {
    @Autowired
    private IMotorsDao motorsDao;
    public List<Motors> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return motorsDao.findAll();
    }

    public void save(Motors motors) throws Exception {
        motorsDao.save(motors);
    }

    public List<Motors> findByCode(String codeStr, Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return motorsDao.findByCode(codeStr);
    }

    public void deleteById(Integer id) throws Exception {
        motorsDao.deleteById(id);
    }

    public void update(Motors motors) throws Exception {
        motorsDao.update(motors);
    }

    public List<Motors> getAll() throws Exception {
        return motorsDao.findAll();
    }

    public Motors findById(Integer id) throws Exception {
        return motorsDao.findMotorById(id);
    }
}
