package grape.service;

import grape.domain.Permission;
import grape.domain.Role;

import java.util.List;

public interface IRoleService {
    public List<Role> findAll(Integer page,Integer size) throws Exception;
    public void save(Role role) throws Exception;
    public Role findById(String roleId) throws Exception;
    public List<Permission> findOtherPermissions(String roleId) throws Exception;
    public void addPermissionToRole(String roleId,String[] permissionIds) throws Exception;
    public void deleteRoleById(String roleId) throws Exception;
    public void deleteFromUser_RoleByRoleId(String roleId) throws Exception;
    public void deleteFromRole_PermissionByRoleId(String roleId) throws Exception;
}
