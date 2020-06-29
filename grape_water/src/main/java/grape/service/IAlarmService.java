package grape.service;

import grape.domain.AlarmType;

import java.util.List;

public interface IAlarmService {
    public void insert(AlarmType alarmType)throws Exception;
    public List<AlarmType> list(Integer page,Integer size)throws Exception;
    public void delete(Integer id)throws Exception;
    public void update(AlarmType alarmType)throws Exception;
    public List<AlarmType> getAll()throws Exception;
}
