package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.SysLog;
import grape.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sysLog")
public class SysLogController {
    @Autowired
    private ISysLogService sysLogService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1" ) Integer page, @RequestParam(name = "size", required = true, defaultValue = "10") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<SysLog> sysLogList = sysLogService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(sysLogList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("sysLogs",sysLogList);
        mv.setViewName("syslog-list");
        return mv;
    }
    @RequestMapping(value = "/search.do",method = RequestMethod.POST)
    public ModelAndView search(@RequestParam(name = "searchName") String username)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<SysLog> list = sysLogService.search(username);
        mv.addObject("list",list);
        mv.setViewName("syslog-list");
        return mv;
    }

    @RequestMapping(value = "/delete.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true)String ids){
        Map<String,String> ret = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        if(idsStr.length == 0){
            ret.put("type", "warning");
        }
        for(int i=0;i<idsStr.length;i++){
            try {
                sysLogService.delete(Integer.parseInt(idsStr[i]));
                ret.put("type","success");
            } catch (Exception e) {
                ret.put("type","error");
                e.printStackTrace();
            }
        }
        return ret;
    }
}
