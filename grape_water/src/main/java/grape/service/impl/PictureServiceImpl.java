package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.INetworksDao;
import grape.domain.Networks;
import grape.service.IPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class PictureServiceImpl implements IPictureService {
    @Autowired
    private INetworksDao networksDao;
    public int insert(Networks networks) throws Exception {
        return networksDao.insert(networks);
    }

    public List<Networks> list(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return networksDao.list();
    }
}
