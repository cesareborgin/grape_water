package grape.dao;

import grape.domain.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface IPermissionDao {
    //查询与role关联的所有的权限
    @Select("select * from permission where id in (select permissionId from role_permission where roleId=#{id} )")
    public List<Permission> findPermissionByRoleId(String id) throws Exception;

    @Select("select * from permission ord")
    public List<Permission> findAll() throws Exception;

    @Insert("insert into permission(id,permissionName,url) values(#{id},#{permissionName},#{url})")
    public void save(Permission permission) throws Exception;

    @Select("select * from permission where id=#{id}")
    public Permission findById(String id) throws Exception;

    @Delete("delete from permission where id=#{id}")
    public void deleteById(String id) throws Exception ;

    @Delete("delete from role_permission where permissionId=#{id}")
    public void deleteFromRole_Permission(String id) throws Exception;

    @Update("update permission set permissionName=#{permissionName},url=#{url} where id=#{id}")
    public void update(Permission permission)throws Exception;
}
