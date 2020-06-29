package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IEntityDao;
import grape.domain.Entity;
import grape.domain.Parameters;
import grape.service.IEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class EntityServiceImpl implements IEntityService {
    @Autowired
    private IEntityDao entityDao;
    public List<Entity> list(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return entityDao.list();
    }

    public void add(Entity entity) throws Exception {
        entityDao.add(entity);
    }

    public void addParamsToEntity(Integer entityId, Integer[] parameterIds) throws Exception {
        for(Integer parameterId:parameterIds){
            entityDao.addParameterToEntity(entityId,parameterId);
        }
    }

    public List<Parameters> findOtherParams(Integer entityId) throws Exception {
        return entityDao.findOtherParam(entityId);
    }

    public Entity findById(Integer id) throws Exception {
        return entityDao.findById(id);
    }

    public List<Entity> search(String entityStr) throws Exception {
        return entityDao.search(entityStr);
    }

    public void delete(Integer id) throws Exception {
        entityDao.delete(id);
    }

    public void deleteParams(Integer entityId) throws Exception {
        entityDao.deleteParams(entityId);
    }

    public int exitEntity(Integer entityId) throws Exception {
        return entityDao.exitEntity(entityId);
    }

    public int update(Entity entity) throws Exception {
        return entityDao.update(entity);
    }

    public Entity findId(Integer id) throws Exception {
        return entityDao.findId(id);
    }

    public List<Entity> findAll() throws Exception {
        return entityDao.list();
    }

    public Entity findByName(String entityName) throws Exception {
        return entityDao.findByName(entityName);
    }

    public List<Entity> getEntityI() throws Exception {
        return entityDao.getEntityI();
    }

    public List<Entity> getEntityII() throws Exception {
        return entityDao.getEntityII();
    }

    public List<Entity> getEntityIII() throws Exception {
        return entityDao.getEntityIII();
    }

    public List<Entity> getEntityIV() throws Exception {
        return entityDao.getEntityIV();
    }

    public List<Entity> getEntityV() throws Exception {
        return entityDao.getEntityV();
    }

    public void deleteEntity(Integer entityId)throws Exception{
        entityDao.deleteParams(entityId);
        entityDao.delete(entityId);
    }
}
