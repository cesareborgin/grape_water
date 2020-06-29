package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Role;
import grape.domain.UserInfo;
import grape.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    //重置密码要的字符
    public static final String resetStr = "66666666";
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private IUserService userService;
    //查询全部用户
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1" ) Integer page,@RequestParam(name = "size", required = true, defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userList = userService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(userList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("userList",userList);
        mv.setViewName("user-list");
        return mv;
    }
    //添加用户
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo) throws Exception{
        userService.save(userInfo);
        return "redirect:findAll.do";
    }
    //用户详情
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception{
        ModelAndView mv = new ModelAndView();
        UserInfo userInfo = userService.findById(id);
        mv.addObject("user",userInfo);
        mv.setViewName("user-show");
        return mv;
    }

    //给用户添加角色
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "userId",required = true) String userId, @RequestParam(name ="ids",required = true) String[] roleIds){
        userService.addRoleToUser(userId,roleIds);
        return "redirect:findAll.do";
    }

    @RequestMapping("/findUserByIdAndAllRole.do")
    //查询用户以及添加可以的角色
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id",required = true) String userId)throws Exception{
        ModelAndView mv = new ModelAndView();
        //根据id查询用户
        UserInfo userInfo = userService.findById(userId);
        //根据用户id查询可添加的角色
        List<Role> otherRoles = userService.findOtherRoles(userId);
        mv.addObject("user",userInfo);
        mv.addObject("roleList",otherRoles);
        mv.setViewName("user-role-add");
        return mv;
    }

    @RequestMapping(value = "/search.do",method = RequestMethod.POST)
    public ModelAndView search(@RequestParam(name = "usernameStr",required = true) String usernameStr)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<UserInfo> list = userService.search(usernameStr);
        mv.addObject("searchList",list);
        mv.setViewName("user-list");
        return mv;
    }

    @RequestMapping(value = "/resetPw.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> restPassword(@RequestParam(name = "id",required = true) String userId){
        Map<String,String> map = new HashMap<String, String>();
        String newPassword = bCryptPasswordEncoder.encode(resetStr);
        try {
            userService.resetPassword(newPassword,userId);
            map.put("type","success");
        } catch (Exception e) {
            map.put("type","error");
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping(value = "/update.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> update(UserInfo userInfo){
        Map<String,String> map = new HashMap<String, String>();
        try {
            userService.updateUser(userInfo);
            map.put("type","success");

        } catch (Exception e) {
            e.printStackTrace();
            map.put("type","error");
        }
        return map;
    }

    //删除用户
    @RequestMapping(value = "/delete.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true) String ids)throws Exception{
        Map<String,String> ret = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        for(int i=0;i<idsStr.length;i++){
            int res = userService.exitUserRole(idsStr[i]);
            if(res!=0){
                userService.deleteUserRole(String.valueOf(idsStr[i]));
                userService.deleteById(String.valueOf(idsStr[i]));
            }else {
                userService.deleteById(idsStr[i]);
            }
        }
        ret.put("type","success");
        return ret;
    }
}
