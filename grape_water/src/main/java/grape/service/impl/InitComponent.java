package grape.service.impl;

import grape.service.ICautionService;
import grape.service.IColtorsService;
import grape.service.IMetersService;
import grape.service.ISensorsService;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

@Component
public class InitComponent implements ServletContextListener,ApplicationContextAware {
    private static ApplicationContext applicationContext;
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        IColtorsService coltorsService = (IColtorsService)applicationContext.getBean("coltorsService");
        ISensorsService sensorsService = (ISensorsService)applicationContext.getBean("sensorsService");
        IMetersService metersService = (IMetersService)applicationContext.getBean("metersService");
        ICautionService cautionService = (ICautionService)applicationContext.getBean("cautionService");
        try {
            Integer status1 = coltorsService.getStatusA();
            Integer status2 = coltorsService.getStatusB();
            Integer status3 = coltorsService.getStatusC();
            Integer status4 = coltorsService.getStatusD();
            application.setAttribute("statusA",status1);
            application.setAttribute("statusB",status2);
            application.setAttribute("statusC",status3);
            application.setAttribute("statusD",status4);
            Integer statusA = sensorsService.getStatusA();
            Integer statusB = sensorsService.getStatusB();
            Integer statusC = sensorsService.getStatusC();
            Integer statusD = sensorsService.getStatusD();
            application.setAttribute("status1",statusA);
            application.setAttribute("status2",statusB);
            application.setAttribute("status3",statusC);
            application.setAttribute("status4",statusD);
            Integer statusI = metersService.getStatusI();
            Integer statusII = metersService.getStatusII();
            Integer statusIII = metersService.getStatusIII();
            Integer statusIV = metersService.getStatusIV();
            application.setAttribute("statusI",statusI);
            application.setAttribute("statusII",statusII);
            application.setAttribute("statusIII",statusIII);
            application.setAttribute("statusIV",statusIV);

            int cautionSum = cautionService.countSum();
            application.setAttribute("cautionSum",cautionSum);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {

    }

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext=applicationContext;
    }
}
