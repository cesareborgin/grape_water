package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Parameters;
import grape.service.IParameterService;
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
@RequestMapping("/parameter")
public class ParameterController {
    @Autowired
    private IParameterService parameterService;

    @RequestMapping("/list.do")
    public ModelAndView list(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Parameters> list = parameterService.list(page, size);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("parameters",list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("parameter-list");
        return mv;
    }

    @RequestMapping(value = "/add.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> insert(Parameters parameters)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        int res = parameterService.insert(parameters);
        if(res>0){
            map.put("type","success");
        }else {
            map.put("type","error");
            map.put("msg","添加失败！");
        }
        return map;
    }
    @RequestMapping(value = "/edit.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> update(@RequestParam(name = "id",required = true) Integer id,@RequestParam(name = "parameterId",required = true) String parameterId,@RequestParam(name = "parameterName") String parameterName,@RequestParam(name = "unit",required = true)String unit)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        int res = parameterService.update(parameterId,parameterName,unit,id);
        if(res>0){
            map.put("type","success");
        }else {
            map.put("type","error");
            map.put("msg","修改失败！");
        }
        return map;
    }

    @RequestMapping("/delete.do")
    public String delete(Integer id)throws Exception{
        int count = parameterService.exitParams(id);
        if(count>0){
            parameterService.deleteParams(id);
            parameterService.delete(id);
        }else {
            parameterService.delete(id);
        }
        return "redirect:list.do";
    }

    @RequestMapping(value = "/search.do",method = RequestMethod.POST)
    public ModelAndView search(@RequestParam(name = "nameStr",required = true) String nameStr)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Parameters> parameters = parameterService.search(nameStr);
        mv.addObject("search",parameters);
        mv.setViewName("parameter-list");
        return mv;
    }

    public String addParams(Integer entityId,Integer[] parameterIds)throws Exception {
        return "redirect:list.do";
    }

}
