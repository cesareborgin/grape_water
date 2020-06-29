package grape.dao;

import grape.domain.Role;
import grape.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IUserDao {
    @Select("select * from users where username=#{username}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "username", column = "username"),
            @Result(property = "email", column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "grape.dao.IRoleDao.findRoleByUserId"))
    })
    public UserInfo findByUsername(String username)throws Exception;

    @Select("select * from users")
    public List<UserInfo> findAll() throws Exception;

    @Insert("insert into users(id,email,username,password,phoneNum,status) values(#{id},#{email},#{username},#{password},#{phoneNum},#{status})")
    public void save(UserInfo userInfo) throws Exception;

    @Select("select * from users where id=#{id}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password", column = "password"),
            @Result(property = "phoneNum", column = "phoneNum"),
            @Result(property = "status", column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "grape.dao.IRoleDao.findRoleByUserId"))

    })
    public UserInfo findById(String id) throws Exception;

    @Select("select * from role where id not in (select roleId from users_role where userId=#{userId})")
    public List<Role> findOtherRoles(String userId);

    @Insert("insert into users_role(userId,roleId) values(#{userId},#{roleId})")
    public void addRoleToUser(@Param("userId") String userId,@Param("roleId") String roleId);

    @Delete("delete from users where id=#{id}")
    public void deleteById(String id);

    @Select("select count(*) from users")
    public int getTotal();

    //密码重置
    @Update("update users set password=#{password} where username=#{username}")
    public void updatePassword(@Param("password") String newPassword,@Param("username") String username)throws Exception;

    @Select("select * from users where username LIKE CONCAT(CONCAT('%',#{username},'%')) ORDER BY id")
    public List<UserInfo> search(@Param("username") String usernameStr)throws Exception;

    //密码重置
    @Update("update users set password=#{password} where id=#{id}")
    public void resetPassword(@Param("password") String newPassword,@Param("id") String userId)throws Exception;

    @Update("update users set username=#{username},email=#{email},phoneNum=#{phoneNum},status=#{status} where id=#{id}")
    public void updateUser(UserInfo userInfo)throws Exception;

    @Delete("delete from users_role where userId=#{userId}")
    public void deleteUserRole(@Param("userId") String userId)throws Exception;

    @Select("select count(userId) from users_role where userId=#{userId}")
    public int exitUserRole(@Param("userId") String userId)throws Exception;

}
