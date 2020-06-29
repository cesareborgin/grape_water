package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IEnergyDao;
import grape.domain.Energy;
import grape.service.IEnergyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
@Service
@Transactional
public class EnergyServiceImpl implements IEnergyService {
    @Autowired
    private IEnergyDao energyDao;
    public int add(Energy energy) throws Exception {
        return energyDao.save(energy);
    }

    public List<Energy> findAll() throws Exception {
        return energyDao.getAll();
    }

    public List<Energy> findList(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return energyDao.findAll();
    }

    public Integer deleteById(Integer id) throws Exception {
        return energyDao.deleteById(id);
    }

    public Energy findById(Integer id) throws Exception {
        return energyDao.findById(id);
    }

    public Integer update(Energy energy) throws Exception {
        return energyDao.update(energy);
    }

    public List<Energy> getlist(Date date1, Date date2) throws Exception {
        return energyDao.findlist(date1,date2);
    }
}
