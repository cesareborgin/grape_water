package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IRoleDao;
import grape.domain.Permission;
import grape.domain.Role;
import grape.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private IRoleDao roleDao;
    public List<Role> findAll(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return roleDao.findAll();
    }

    public void save(Role role) throws Exception {
        roleDao.save(role);
    }

    public Role findById(String roleId) throws Exception {
        return roleDao.findById(roleId);
    }

    public List<Permission> findOtherPermissions(String roleId) throws Exception {
        return roleDao.findOtherPermissions(roleId);
    }

    public void addPermissionToRole(String roleId, String[] permissionIds) throws Exception {
        for(String permissionId:permissionIds){
            roleDao.addPermissionToRole(roleId,permissionId);
        }
    }

    public void deleteRoleById(String roleId) throws Exception {
        //从user_role表中删除
        roleDao.deleteFromUser_RoleByRoleId(roleId);
        //从role_permission表中删除
        roleDao.deleteFromRole_PermissionByRoleId(roleId);
        //从role表中删除
        roleDao.deleteRoleById(roleId);
    }

    public void deleteFromUser_RoleByRoleId(String roleId) throws Exception {
        roleDao.deleteFromUser_RoleByRoleId(roleId);
    }

    public void deleteFromRole_PermissionByRoleId(String roleId) throws Exception {
        roleDao.deleteFromRole_PermissionByRoleId(roleId);
    }
}
