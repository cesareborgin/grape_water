package grape.service;

import grape.domain.Role;
import grape.domain.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    public UserInfo findByUsername(String username) throws Exception;
    public List<UserInfo> findAll(Integer page,Integer size) throws Exception;
    public void save(UserInfo userInfo) throws Exception;
    public UserInfo findById(String id) throws Exception;
    public void addRoleToUser(String userId,String[] roleIds);
    public List<Role> findOtherRoles(String userId) throws Exception;
    public void deleteById(String id);
    public UserInfo findUser(String username)throws Exception;

    public void updatePassword(String newPassword,String username)throws Exception;

    public List<UserInfo> search(String usernameStr)throws Exception;

    public void resetPassword(String newPassword,String userId)throws Exception;

    public void updateUser(UserInfo userInfo)throws Exception;

    public void deleteUserRole(String userId)throws Exception;

    public int exitUserRole(String userId)throws Exception;
}
