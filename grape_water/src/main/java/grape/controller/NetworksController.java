package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Entity;
import grape.domain.Networks;
import grape.domain.Parameters;
import grape.service.IEntityService;
import grape.service.INetworksService;
import grape.service.IPictureService;
import grape.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/netFile")
public class NetworksController {
    @Autowired
    private IEntityService entityService;
    @Autowired
    private IPictureService pictureService;
    @Autowired
    private INetworksService networksService;
    @RequestMapping("/list.do")
    public ModelAndView fileList(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Entity> entities = entityService.findAll();
        mv.addObject("entities",entities);
        List<Networks> list = pictureService.list(page, size);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("pictures",list);
        mv.setViewName("Networks");
        return mv;
    }

    @RequestMapping("/getParams.do")
    @ResponseBody
    public Map<String,Object> getParams(@RequestParam(name = "entityName",required = true) String entityName)throws Exception{
        Entity entity = entityService.findByName(entityName);
        Map<String,Object> map = new HashMap<String,Object>();
        List<Parameters> parameters= entity.getParameters();
        map.put("parameters",parameters);
        return map;
    }

    @RequestMapping(value = "/add.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> insert(Networks networks)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        Date newDate = new Date();
        networks.setCreateTime(newDate);
        int res = pictureService.insert(networks);
        if(res>0){
            map.put("type","success");
        }else {
            map.put("type","error");
            map.put("msg","添加失败");
        }
        return map;
    }

    @RequestMapping("/delete.do")
    public String delete(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        networksService.delete(id);
        return "redirect:list.do";
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        ModelAndView mv = new ModelAndView();
        Networks networks = networksService.finById(id);
        mv.addObject("network",networks);
        mv.setViewName("networks-show");
        return mv;
    }
    @RequestMapping(value = "/update.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> update(@RequestParam(name = "id",required = true) Integer id,
                                     @RequestParam(name = "photo",required = true)String photo)throws Exception{
        Map<String,String> map = new HashMap<String, String>();

        int res = networksService.update2(photo, id);
        if(res>0){
            map.put("type","success");
        }else {
            map.put("type","error");
        }
        return map;
    }

    @RequestMapping("/netPhoto.do")
    public ModelAndView netMeters()throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("net-meter");
        return mv;
    }
}
