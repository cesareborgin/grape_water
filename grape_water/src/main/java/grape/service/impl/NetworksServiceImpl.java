package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.INetworksDao;
import grape.domain.Networks;
import grape.service.INetworksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class NetworksServiceImpl implements INetworksService {
    @Autowired
    private INetworksDao networksDao;
    public void insert(Networks networks) throws Exception {
        networksDao.insert(networks);
    }

    public List<Networks> list(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return networksDao.list();
    }

    public void delete(Integer id) throws Exception {
        networksDao.delete(id);
    }

    public int update(Networks networks) throws Exception {
       return networksDao.update(networks);
    }

    public Networks finById(Integer id) throws Exception {
        return networksDao.findById(id);
    }

    public int update2(String photo,Integer id) throws Exception {
        return networksDao.update2(photo, id);
    }
}
