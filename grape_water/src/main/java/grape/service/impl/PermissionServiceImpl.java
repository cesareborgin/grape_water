package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IPermissionDao;
import grape.domain.Permission;
import grape.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class PermissionServiceImpl implements IPermissionService {
    @Autowired
    private IPermissionDao permissionDao;
    public List<Permission> findAll(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return permissionDao.findAll();
    }

    public void save(Permission permission) throws Exception {
        permissionDao.save(permission);
    }

    public Permission findById(String id) throws Exception {
        return permissionDao.findById(id);
    }

    public void deleteById(String id) throws Exception {
        permissionDao.deleteFromRole_Permission(id);
        permissionDao.deleteById(id);
    }

    public void deleteFromRole_Permission(String id) throws Exception {
        permissionDao.deleteFromRole_Permission(id);
    }

    public List<Permission> findPermissionByRoleId(String id) throws Exception {
        return permissionDao.findPermissionByRoleId(id);
    }

    public void update(Permission permission) throws Exception {
        permissionDao.update(permission);
    }
}
