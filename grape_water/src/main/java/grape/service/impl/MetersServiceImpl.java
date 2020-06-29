package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IMetersDao;
import grape.domain.Meters;

import grape.service.IMetersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("metersService")
@Transactional
public class MetersServiceImpl implements IMetersService {
    @Autowired
    private IMetersDao metersDao;

    public void add(Meters meters) throws Exception {
        metersDao.add(meters);
    }

    public List<Meters> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return metersDao.findAll();
    }

    public void update(Meters meters) throws Exception {
        metersDao.update(meters);
    }

    public List<Meters> findByName(String codeStr, Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return metersDao.findBymeterName(codeStr);
    }

    public void deleteById(Integer id) throws Exception {
        metersDao.deleteById(id);
    }

    public Meters findById(Integer id) throws Exception {
        return metersDao.findById(id);
    }

    public List<Meters> getAll() throws Exception {
        return metersDao.findAll();
    }

    public Integer getStatusI() throws Exception {
        return metersDao.getStatusI();
    }

    public Integer getStatusII() throws Exception {
        return metersDao.getStatusII();
    }

    public Integer getStatusIII() throws Exception {
        return metersDao.getStatusIII();
    }

    public Integer getStatusIV() throws Exception {
        return metersDao.getStatusIV();
    }

    public int sum() throws Exception {
        return metersDao.sum();
    }
}
