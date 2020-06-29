package grape.controller;

import grape.service.IColtorsService;
import grape.service.IMetersService;
import grape.service.ISensorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/firm")
public class ProfileController {
    @Autowired
    private IMetersService metersService;
    @Autowired
    private IColtorsService coltorsService;
    @Autowired
    private ISensorsService sensorsService;
    @RequestMapping("/getPro")
    public ModelAndView firmList()throws Exception{
        ModelAndView mv = new ModelAndView();
        int collectors = coltorsService.sum();
        int sensors = sensorsService.sum();
        int meters = metersService.sum();
        mv.addObject("collectors",collectors);
        mv.addObject("sensors",sensors);
        mv.addObject("meters",meters);
        mv.setViewName("profile");
        return mv;
    }
    @RequestMapping("/getIndex.do")
    public ModelAndView getHome(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main");
        return mv;
    }
}
