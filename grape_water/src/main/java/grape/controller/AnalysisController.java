package grape.controller;

import grape.domain.Area;
import grape.service.IAreaService;
import grape.service.IStatisticService;
import grape.utils.DateUtils;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/analysis")
//显示数据
public class AnalysisController {

    @Autowired
    private IStatisticService statisticService;
    @Autowired
    private IAreaService areaService;

    @RequestMapping(value = "/dataBar.do",method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String,Object>> getData(@RequestParam(name = "date1",required = true) String date1,@RequestParam(name = "date2",required = true)String date2,@RequestParam(name = "localStr",required = true) String localStr)throws Exception{
        Date getDate1 = DateUtils.string2Date(date1,"yyyy-MM-dd HH:mm");
        Date getDate2 = DateUtils.string2Date(date2,"yyyy-MM-dd HH:mm");
        return statisticService.getData(getDate1,getDate2,localStr);
    }

    @RequestMapping("/tolist.do")
    public ModelAndView tolist()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Area> areas = areaService.getAll();
        mv.addObject("areaList",areas);
        mv.addObject("areasJson", JSONArray.fromObject(areas));
        mv.setViewName("analysis-dyna");
        return mv;
    }

    @RequestMapping(value = "/dataPie.do",method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String,Object>> getPie(@RequestParam(name = "date1",required = true) String date1,@RequestParam(name = "date2",required = true)String date2,@RequestParam(name = "localStr",required = true) String localStr)throws Exception{
        Date getDate1 = DateUtils.string2Date(date1,"yyyy-MM-dd HH:mm");
        Date getDate2 = DateUtils.string2Date(date2,"yyyy-MM-dd HH:mm");
        return statisticService.getPie(getDate1,getDate2,localStr);
    }


    @RequestMapping("/toPie.do")
    public ModelAndView toPie()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Area> areas = areaService.getAll();
        mv.addObject("areaList",areas);
        mv.addObject("areasJson", JSONArray.fromObject(areas));
        mv.setViewName("analysis-sector");
        return mv;
    }

}
