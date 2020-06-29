package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.AlarmType;
import grape.service.IAlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/alarmType")
public class AlarmTypeController {
    @Autowired
    private IAlarmService alarmService;
    @RequestMapping("/list.do")
    public ModelAndView list(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<AlarmType> list = alarmService.list(page, size);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("list",list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("alarmType");
        return mv;
    }

    @RequestMapping(value = "/insert.do",method = RequestMethod.POST)
    public String insert(AlarmType alarmType)throws Exception{
        alarmService.insert(alarmType);
        return "redirect:list.do";
    }
    @RequestMapping(value = "/deleteById.do")
    public String delete(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        alarmService.delete(id);
        return "redirect:list.do";
    }
    @RequestMapping(value = "/edit.do",method = RequestMethod.POST)
    public String update(AlarmType alarmType)throws Exception{
        alarmService.update(alarmType);
        return "redirect:list.do";
    }
}
