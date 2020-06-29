package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Area;
import grape.service.IAreaService;
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
@RequestMapping("/area")
public class AreaController {
    @Autowired
    private IAreaService areaService;

    @RequestMapping(value = "/add.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> add(Area area)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        int result = areaService.add(area);
        if(result>0){
            map.put("type","success");
            map.put("msg","添加成功!");
        }else {
            map.put("type","error");
            map.put("msg","内部出错");
        }
        return map;
    }

    @RequestMapping("/getlist.do")
    public ModelAndView getList(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Area> list = areaService.getList(page,size);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("areaList",list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("area-list");
        return mv;
    }

    @RequestMapping(value = "/delete.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true) String ids)throws Exception{
        Map<String,String> ret = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        if(idsStr.length == 0){
            ret.put("type", "error");
            ret.put("msg", "请选择要删除的数据！");
            return ret;
        }
        for(int i=0;i<idsStr.length;i++){
            areaService.del(Integer.parseInt(idsStr[i]));
        }
        ret.put("type","success");
        ret.put("msg","添加成功!");
       return ret;
    }

    @RequestMapping("/deleteById.do")
    public String deleteById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        int result = areaService.del(id);
        return "redirect:getlist.do";
    }

    @RequestMapping(value = "/edit.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> edit(Area area)throws Exception{
        Map<String,String> ret = new HashMap<String, String>();
        if(areaService.edit(area)<0){
            ret.put("type","success");
            ret.put("msg","修改失败！");
        }else {
            ret.put("type","success");
            ret.put("msg","修改成功！");
        }
        return ret;
    }

    @RequestMapping(value = "/search.do",method = RequestMethod.POST)
    public ModelAndView serach(@RequestParam(name = "nameStr") String nameStr)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Area> list = areaService.search(nameStr);
        mv.addObject("list",list);
        mv.setViewName("area-list");
        return mv;
    }

}
