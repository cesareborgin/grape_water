package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Department;
import grape.service.IDepartmentService;
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
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;
    @RequestMapping("/getAll.do")
    public ModelAndView getAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Department> list = departmentService.getAll(page, size);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("departList",list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("department-list");
        return mv;
    }

    @RequestMapping(value = "/add.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> add(Department department)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        Integer result = departmentService.add(department);
        if(result<0){
            map.put("type","error");
        }else {
            map.put("type","success");
        }
        return map;
    }
    @RequestMapping(value = "/edit.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> edit(Department department)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        Integer result = departmentService.update(department);
        if(result<0){
            map.put("type","error");
        }else {
            map.put("type","success");
        }
        return map;
    }
    @RequestMapping(value = "/delete.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true) String ids)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        for(int i=0;i<idsStr.length;i++){
            departmentService.delete(Integer.parseInt(idsStr[i]));
        }
        map.put("type","success");
        map.put("msg","添加成功!");
        return map;
    }
    @RequestMapping("/deleteById.do")
    public String deleteById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        int result = departmentService.delete(id);
        return "redirect:getAll.do";
    }

    @RequestMapping(value = "/search.do",method = RequestMethod.POST)
    public ModelAndView search(@RequestParam(name = "departNameStr") String departNameStr)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Department> list = departmentService.search(departNameStr);
        mv.addObject("list",list);
        mv.setViewName("department-list");
        return mv;
    }
}
