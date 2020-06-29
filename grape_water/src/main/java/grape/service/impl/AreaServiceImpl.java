package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IAreaDao;
import grape.domain.Area;
import grape.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AreaServiceImpl implements IAreaService {
    @Autowired
    private IAreaDao areaDao;
    public int add(Area area) throws Exception {
        return areaDao.add(area);
    }

    public List<Area> getList(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return areaDao.getAll();
    }

    public Integer del(Integer id) throws Exception {
        return areaDao.del(id);
    }

    public int delete(String ids) throws Exception {
        return areaDao.delete(ids);
    }

    public List<Area> getAll() throws Exception {
        return areaDao.getAll();
    }

    public int edit(Area area) throws Exception {
        return areaDao.edit(area);
    }

    public List<Area> search(String nameStr) throws Exception {
        return areaDao.find(nameStr);
    }
}
