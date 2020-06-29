package grape.service;

import grape.domain.Permission;

import java.util.List;

public interface IPermissionService {
    public List<Permission> findAll(Integer page,Integer size) throws Exception;
    public void save(Permission permission) throws Exception;
    public Permission findById(String id) throws Exception;
    public void deleteById(String id) throws Exception;
    public void deleteFromRole_Permission(String id) throws Exception;
    public List<Permission> findPermissionByRoleId(String id) throws Exception;

    public void update(Permission permission)throws Exception;
}
