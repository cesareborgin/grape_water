package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IRepumpsDao;
import grape.domain.Repumps;
import grape.service.IRepumpsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
@Service
@Transactional
public class RepumpsServiceImpl implements IRepumpsService {
    @Autowired
    private IRepumpsDao repumpsDao;
    public void save(Repumps repumps) throws Exception {
        repumpsDao.save(repumps);
    }

    public List<Repumps> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        List<Repumps> repumpsList =  repumpsDao.findAll();
        return repumpsList;
    }

    public void deleteById(Integer id) throws Exception {
        repumpsDao.deleteById(id);
    }
    public List<Repumps> searchCode(String codeStr, Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return repumpsDao.searchList(codeStr);
    }

    public List<Repumps> getAll() throws Exception {
        return repumpsDao.findAll();
    }

    public Repumps fingById(Integer id) throws Exception {
        return repumpsDao.findById(id);
    }

    public void update(Repumps repumps) throws Exception {
        repumpsDao.update(repumps);
    }

}
