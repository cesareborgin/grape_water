package grape.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/calendar")
@Controller
public class CalendarController {

    @RequestMapping("/list.do")
    public ModelAndView calendar()throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("calendar");
        return mv;
    }
}
