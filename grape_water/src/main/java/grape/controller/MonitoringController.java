package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Caution;
import grape.service.ICautionService;
import grape.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/monitoring")
public class MonitoringController {

    @Autowired
    private ICautionService cautionService;
    private Date date1 = new Date();
    private Date date2 = new Date();
    private Date date3 = new Date();
    @RequestMapping("/list.do")
    public ModelAndView warningList(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Caution> list = cautionService.list(page, size);
        String date1Str = DateUtils.date2String(date1,"yyyy");
        String date2Str = DateUtils.date2String(date2,"yyyy-MM");
        String date3Str = DateUtils.date2String(date3,"yyyy-MM-dd");
        int yearM = cautionService.countSumM(date1Str);
        int yearY = cautionService.countSumY(date1Str);
        int monthM = cautionService.countSumM(date2Str);
        int monthY = cautionService.countSumY(date2Str);
        int dayM = cautionService.countSumM(date3Str);
        int dayY = cautionService.countSumY(date3Str);
        mv.addObject("yearM",yearM);
        mv.addObject("yearY",yearY);
        mv.addObject("monthM",monthM);
        mv.addObject("monthY",monthY);
        mv.addObject("dayM",dayM);
        mv.addObject("dayY",dayY);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("cautionList",list);
        mv.setViewName("warning-list");
        return mv;
    }

    @RequestMapping("/delete.do")
    public String delete(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        cautionService.delete(id);
        return "redirect:list.do";
    }
    @RequestMapping(value = "/findById.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        Map<String,Object> map = new HashMap<String, Object>();
        Caution caution = cautionService.findById(id);
        map.put("entity",caution);
        return map;
    }
    @RequestMapping(value = "/update.do",method = RequestMethod.POST)
    public String update(Caution caution)throws Exception{
        cautionService.update(caution);
        return "redirect:list.do";
    }
    @RequestMapping(value = "/search.do",method = RequestMethod.POST)
    public ModelAndView search(@RequestParam(name = "date1",required = true) String dateStr1,@RequestParam(name = "date2",required = true) String dateStr2,@RequestParam(name = "objNameStr") String objNameStr)throws Exception{
        ModelAndView mv = new ModelAndView();
        Date date1 = DateUtils.string2Date(dateStr1,"yyyy-MM-dd");
        Date date2 = DateUtils.string2Date(dateStr2,"yyyy-MM-dd");
        List<Caution> list = cautionService.search(date1,date2,objNameStr);
        mv.addObject("cautions",list);
        mv.setViewName("warning-list");
        return mv;
    }

    public static void main(String[] args)throws Exception {
        Date date1 = new Date();
        Date date2 = new Date();
        Date date3 = new Date();
        String date1Str = DateUtils.date2String(date1,"yyyy");
        String date2Str = DateUtils.date2String(date2,"yyyy-MM");
        String date3Str = DateUtils.date2String(date3,"yyyy-MM-dd");
        System.out.println(date1Str);
        System.out.println(date2Str);
        System.out.println(date3Str);
        String s = "a,b,x,d,f,e,fgahgioja352";
        String ss = " 05/30/2020";
        Date ss1 = DateUtils.string2Date(ss,"yyyy-mm-dd");
        System.out.println(ss1);
// 根据,(逗号)进行分割
        String[] split = s.split(",");
        for (int i = 0; i < split.length; i++) {
            System.out.println(split[i]);
        }
    }
}
