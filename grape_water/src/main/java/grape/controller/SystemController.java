package grape.controller;

import grape.domain.Role;
import grape.domain.UserInfo;
import grape.service.ICautionService;
import grape.service.IColtorsService;
import grape.service.ISensorsService;
import grape.service.IUserService;
import grape.utils.ResponseUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system")
public class SystemController {
    @Autowired
    private IColtorsService coltorsService;
    @Autowired
    private ISensorsService sensorsService;
    @Autowired
    private IUserService userService;
    @Autowired
    private ICautionService cautionService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @RequestMapping("/userInfo.do")
    public ModelAndView systemSetting()throws Exception{
        ModelAndView mv = new ModelAndView();
        //获取当前操作的用户
        SecurityContext context = SecurityContextHolder.getContext();//从上下文中获了当前登录的用户
        User user = (User) context.getAuthentication().getPrincipal();
        String username = user.getUsername();
        UserInfo userInfo = userService.findByUsername(username);
        mv.addObject("userInfo",userInfo);
        mv.setViewName("system-setting");
        return mv;
    }
    @RequestMapping("/refreshSystem")
    public ModelAndView refreshSystem(HttpServletResponse response, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView();
        ServletContext application = RequestContextUtils.findWebApplicationContext(request).getServletContext();
        Integer status1 = this.coltorsService.getStatusA();
        Integer status2 = this.coltorsService.getStatusB();
        Integer status3 = this.coltorsService.getStatusC();
        Integer status4 = this.coltorsService.getStatusD();
        application.setAttribute("statusA",status1);
        application.setAttribute("statusB",status2);
        application.setAttribute("statusC",status3);
        application.setAttribute("statusD",status4);
        Integer statusA = this.sensorsService.getStatusA();
        Integer statusB = this.sensorsService.getStatusB();
        Integer statusC = this.sensorsService.getStatusC();
        Integer statusD = this.sensorsService.getStatusD();
        application.setAttribute("status1",statusA);
        application.setAttribute("status2",statusB);
        application.setAttribute("status3",statusC);
        application.setAttribute("status4",statusD);
        int cautionSum = cautionService.countSum();
        application.setAttribute("cautionSum",cautionSum);
        mv.setViewName("main");
        return mv;
    }

    @RequestMapping(value = "/resetPassword.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> surePassword(@RequestParam(name = "original",required = true) String original,@RequestParam(name = "getPassword",required = true) String getPassword)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        SecurityContext context = SecurityContextHolder.getContext();//从上下文中获了当前登录的用户
        User user = (User) context.getAuthentication().getPrincipal();
        String username = user.getUsername();

        UserInfo userInfo = userService.findByUsername(username);

        String newPassword = bCryptPasswordEncoder.encode(getPassword);
        String originalPassword =String.valueOf(original);
        String passwordInfo = userInfo.getPassword();
        boolean flag = bCryptPasswordEncoder.matches(originalPassword,passwordInfo);
        if(flag){
            userService.updatePassword(newPassword,username);
            map.put("type","success");
            return map;
        }else {
            map.put("type","error");
        }
        return map;
    }
}
