package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IUserDao;
import grape.domain.Role;
import grape.domain.UserInfo;
import grape.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    public UserInfo findByUsername(String username) throws Exception{
        return userDao.findByUsername(username);
    }

    public List<UserInfo> findAll(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return userDao.findAll();
    }

    public void save(UserInfo userInfo) throws Exception {
        //获取表单数据，再对密码加密
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.save(userInfo);
    }

    public UserInfo findById(String id) throws Exception {
        return userDao.findById(id);
    }

    public void addRoleToUser(String userId, String[] roleIds) {
        for(String roleId:roleIds){
            userDao.addRoleToUser(userId,roleId);
        }
    }

    public List<Role> findOtherRoles(String userId) throws Exception {
        return userDao.findOtherRoles(userId);
    }

    public void deleteById(String id) {
        userDao.deleteById(id);
    }

    public UserInfo findUser(String username) throws Exception {
        return userDao.findByUsername(username);
    }

    public int getTotal() throws Exception {
        return userDao.getTotal();
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //User user = new User(userInfo.getUsername(),userInfo.getPassword());
        User user = new User(userInfo.getUsername(), userInfo.getPassword(), userInfo.getStatus() == 0 ? false : true, true, true, true, getAuthority(userInfo.getRoles()));
        return user;
    }
    //作用就是返回一个List集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {

        List<SimpleGrantedAuthority> list = new ArrayList<SimpleGrantedAuthority>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }
        return list;
    }

    //修改密码
    public void updatePassword(String newPassword, String username) throws Exception {
        userDao.updatePassword(newPassword,username);
    }

    public List<UserInfo> search(String usernameStr) throws Exception {
        return userDao.search(usernameStr);
    }

    public void resetPassword(String newPassword,String userId) throws Exception {
         userDao.resetPassword(newPassword,userId);
    }

    public void updateUser(UserInfo userInfo) throws Exception {
        userDao.updateUser(userInfo);
    }

    public void deleteUserRole(String userId) throws Exception {
        userDao.deleteUserRole(userId);
    }

    public int exitUserRole(String userId) throws Exception {
        return userDao.exitUserRole(userId);
    }
}
