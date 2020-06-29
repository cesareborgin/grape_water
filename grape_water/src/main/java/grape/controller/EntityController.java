package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Entity;
import grape.domain.Parameters;
import grape.service.IEntityService;
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
@RequestMapping("/entity")
public class EntityController {
    @Autowired
    private IEntityService entityService;
    @RequestMapping("/list.do")
    public ModelAndView list(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "11") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Entity> list = entityService.list(page, size);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("entities",list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("entity-list");
        return mv;
    }

    @RequestMapping(value = "/add.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> insert(Entity entity){
        Map<String,String> map = new HashMap<String, String>();
        try {
            entityService.add(entity);
            map.put("type","success");
        } catch (Exception e) {
            map.put("type","error");
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/findByIdAndParams.do")
    public ModelAndView findOtherParams(@RequestParam(name = "id",required = true) Integer entityId)throws Exception{
        ModelAndView mv = new ModelAndView();
        Entity entity = entityService.findById(entityId);
        List<Parameters> parameters = entityService.findOtherParams(entityId);
        mv.addObject("entity",entity);
        mv.addObject("parameters",parameters);
        mv.setViewName("entity-parameter-add");
        return mv;
    }

    @RequestMapping("/addParams.do")
    public String addParams(@RequestParam(name = "entityId",required = true) Integer entityId,@RequestParam(name = "ids",required = true) Integer[] parameterIds)throws Exception{
        entityService.addParamsToEntity(entityId, parameterIds);
        return "redirect:list.do";
    }

    @RequestMapping(value = "/search.do",method = RequestMethod.POST)
    public ModelAndView search(@RequestParam(name = "nameStr",required = true) String entityStr)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Entity> entities = entityService.search(entityStr);
        mv.addObject("search",entities);
        mv.setViewName("entity-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer id)throws Exception{
        ModelAndView mv = new ModelAndView();
        Entity entity = entityService.findById(id);
        mv.addObject("entity",entity);
        mv.setViewName("entity-show");
        return mv;
    }

    @RequestMapping("/deleteEntity.do")
    public String deleteEntity(@RequestParam(name = "id",required = true)Integer entityId)throws Exception{
        entityService.deleteEntity(entityId);
        return "redirect:list.do";
    }

    @RequestMapping(value = "/edit.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> update(Entity entity)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        int res = entityService.update(entity);
        if(res>0){
            map.put("type","success");
        }else {
            map.put("type","error");
            map.put("msg","修改失败");
        }
        return map;
    }

}
