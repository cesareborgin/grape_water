package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IAlarmDao;
import grape.domain.AlarmType;
import grape.service.IAlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class AlarmServiceImpl implements IAlarmService {
    @Autowired
    private IAlarmDao alarmDao;
    public void insert(AlarmType alarmType) throws Exception {
        alarmDao.insert(alarmType);
    }

    public List<AlarmType> list(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return alarmDao.list();
    }

    public void delete(Integer id) throws Exception {
        alarmDao.delete(id);
    }

    public void update(AlarmType alarmType) throws Exception {
        alarmDao.update(alarmType);
    }

    public List<AlarmType> getAll() throws Exception {
        return alarmDao.list();
    }
}
