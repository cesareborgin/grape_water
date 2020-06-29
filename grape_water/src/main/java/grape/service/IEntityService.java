package grape.service;

import grape.domain.Entity;
import grape.domain.Parameters;

import java.util.List;

public interface IEntityService {
    public List<Entity> list(Integer page,Integer size)throws Exception;
    public void add(Entity entity)throws Exception;
    public void addParamsToEntity(Integer entityId,Integer[] parameterIds)throws Exception;
    public List<Parameters> findOtherParams(Integer entityId)throws Exception;
    public Entity findById(Integer id)throws Exception;
    public List<Entity> search(String entityStr)throws Exception;
    public void delete(Integer id)throws Exception;
    public void deleteParams(Integer entityId)throws Exception;
    public int  exitEntity(Integer entityId)throws Exception;
    public int update(Entity entity)throws Exception;
    public Entity findId(Integer id)throws Exception;
    public List<Entity> findAll()throws Exception;
    public Entity findByName(String entityName )throws Exception;
    public List<Entity> getEntityI()throws Exception;
    public List<Entity> getEntityII()throws Exception;
    public List<Entity> getEntityIII()throws Exception;
    public List<Entity> getEntityIV()throws Exception;
    public List<Entity> getEntityV()throws Exception;
    public void deleteEntity(Integer entityId)throws Exception;
}
