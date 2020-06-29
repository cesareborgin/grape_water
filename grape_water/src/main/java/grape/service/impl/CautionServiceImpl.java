package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.ICautionDao;
import grape.domain.Caution;
import grape.service.ICautionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
@Service("cautionService")
@Transactional
public class CautionServiceImpl implements ICautionService {
    @Autowired
    private ICautionDao cautionDao;
    public void insert(Caution caution) throws Exception {
        cautionDao.insert(caution);
    }

    public List<Caution> list(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return cautionDao.list();
    }

    public int countSum() throws Exception {
        return cautionDao.countSum();
    }

    public void delete(Integer id) throws Exception {
        cautionDao.delete(id);
    }

    public Caution findById(Integer id) throws Exception {
        return cautionDao.findById(id);
    }

    public void update(Caution caution) throws Exception {
        cautionDao.update(caution);
    }

    public int countSumM(String dateStr) throws Exception {
        return cautionDao.countSumW(dateStr);
    }

    public int countSumY(String dateStr) throws Exception {
        return cautionDao.countSumY(dateStr);
    }

    public List<Caution> search(Date date1, Date date2, String objNameStr) throws Exception {
        return cautionDao.search(date1, date2, objNameStr);
    }

}
