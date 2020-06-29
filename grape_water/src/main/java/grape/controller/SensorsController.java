package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Area;
import grape.domain.Sensors;
import grape.domain.Senter;
import grape.service.IAreaService;
import grape.service.ISensorsService;
import grape.utils.DateUtils;
import grape.utils.ExcelUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sensors")
public class SensorsController {
    //excel默认宽度；
    private static int width = 200 * 20;
    //默认字体
    private static String excelfont = "微软雅黑";
    private final static String XLS = "xls";
    private final static String XLSX = "xlsx";
    @Autowired
    private ISensorsService sensorsService;
    @Autowired
    private IAreaService areaService;
    //查询所有传感器
    @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1" ) Integer page, @RequestParam(name = "size", required = true, defaultValue = "15")Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Sensors> sensorsList = sensorsService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(sensorsList);
        mv.addObject("sensorsList",sensorsList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("sensors-list");
        return mv;
    }

    //修改信息
    @RequestMapping(value = "/update.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> update(@RequestParam(name = "sensorsName",required = true) String sensorsName,
                                      @RequestParam(name = "sensorsType",required = true) String sensorsType,
                                      @RequestParam(name = "installtionAddr",required = true) String installtionAddr,
                                      @RequestParam(name = "id",required = true) Integer id)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        int result = sensorsService.update(sensorsName, sensorsType, installtionAddr, id);
        if(result<1){
            map.put("type","error");
        }else {
            map.put("type","success");
        }
        return map;
    }

    @RequestMapping("/toAdd.do")
    public ModelAndView toAdd()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Area> areas = areaService.getAll();
        mv.addObject("areas",areas);
        mv.setViewName("sensors-add");
        return mv;
    }
    //删除传感器信息
    @RequestMapping("/delete.do")
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true) String ids){
        Map<String,String> map = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        try {
            for(int i=0;i<idsStr.length;i++){
                sensorsService.deleteById(Integer.parseInt(idsStr[i]));
            }
            map.put("type","success");
        }catch (Exception e){
            e.printStackTrace();
            map.put("type","error");
        }
        return map;
    }

    //新增传感器
    @RequestMapping(value = "/save.do",method = RequestMethod.POST)
    public String addSensors(Sensors sensors) throws Exception{
        Date date1 = sensors.getLastTime();
        Date date2 = sensors.getNextTime();

        sensorsService.save(sensors);
        return "redirect:findAll.do";
    }
    //根据采集器名称模糊查询
    @RequestMapping(value = "/searchList.do",method = RequestMethod.POST)
    public ModelAndView findBySensorName(@RequestParam(name = "page",required = true,defaultValue = "1" ) Integer page, @RequestParam(name = "size", required = true, defaultValue = "15") Integer size,@RequestParam(name = "searchName",required = true) String searchName)throws Exception{
        ModelAndView mv= new ModelAndView();
        List<Sensors> sensors = sensorsService.findByEquipmentName(searchName,page,size);
        PageInfo pageInfo = new PageInfo(sensors);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("searchList",sensors);
        mv.setViewName("sensors-list");
        return mv;
    }
    @RequestMapping("/editGo.do")
    public ModelAndView findAById(@RequestParam(name = "id",required = true) Integer sensorsId)throws Exception{
        ModelAndView mv = new ModelAndView();
        Sensors sensors = sensorsService.findById(sensorsId);
        mv.addObject("sensors",sensors);
        mv.setViewName("sensors-show");
        return mv;
    }
    //导出
    @RequestMapping(value = "/exportExcel.do",method = RequestMethod.GET)
    public void exportExcel(HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<Sensors> list = sensorsService.getAll();
        //System.out.println(list);
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("传感器信息表");
        HSSFCellStyle style = wb.createCellStyle();
        HSSFFont font = wb.createFont();
        font.setBold(true);
        font.setFontName(excelfont);
        font.setFontHeightInPoints((short) 11);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);

        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        for(int i=1;i<12;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        titleRow.createCell(0).setCellValue("序号");
        titleRow.createCell(1).setCellValue("设备名称");
        titleRow.createCell(2).setCellValue("设备型号");
        titleRow.createCell(3).setCellValue("安装地址");
        titleRow.createCell(4).setCellValue("精度");
        titleRow.createCell(5).setCellValue("波特率(HZ)");
        titleRow.createCell(6).setCellValue("上次检定时间");
        titleRow.createCell(7).setCellValue("下次检定时间");
        titleRow.createCell(8).setCellValue("压力等级");
        titleRow.createCell(9).setCellValue("温度等级 ");
        titleRow.createCell(10).setCellValue("防护等级 ");
        titleRow.createCell(11).setCellValue("连接状态");
        //遍历将数据放到excel
        for(Sensors sensors:list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            for(int i=1;i<12;i++){
                dataRow.setRowStyle(style);
            }
            dataRow.createCell(0).setCellValue(sensors.getId());
            dataRow.createCell(1).setCellValue(sensors.getSensorsName());
            dataRow.createCell(2).setCellValue(sensors.getSensorsType());
            dataRow.createCell(3).setCellValue(sensors.getInstalltionAddr());
            dataRow.createCell(4).setCellValue(sensors.getPrecision());
            dataRow.createCell(5).setCellValue(sensors.getBaudRate());
            dataRow.createCell(6).setCellValue(sensors.getLastTimeStr());
            dataRow.createCell(7).setCellValue(sensors.getNextTimeStr());
            dataRow.createCell(8).setCellValue(sensors.getPressureGradeStr());
            dataRow.createCell(9).setCellValue(sensors.getTempGradeStr());
            dataRow.createCell(10).setCellValue(sensors.getPrl());
            dataRow.createCell(11).setCellValue(sensors.getStatusStr());
        }
        // 设置下载时客户端Excel的名称   （上面注释的改进版本，上面的中文不支持）
        //第六步,输出Excel文件
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        long filename = System.currentTimeMillis();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
        String fileName = df.format(new Date());// new Date()为获取当前系统时间
        response.setHeader("Content-disposition", "attachment; filename="+fileName+".xls");
        response.setContentType("application/msexcel");
        wb.write(outputStream);
        outputStream.close();
    }
    //下载导入表的模板
    @RequestMapping(value = "/downloadModal.do",method = RequestMethod.GET)
    public void getModal(HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("Sheet1");
        HSSFCellStyle style = workbook.createCellStyle();
        HSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontName(excelfont);
        font.setFontHeightInPoints((short) 11);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("设备名称");
        titleRow.createCell(1).setCellValue("设备型号");
        titleRow.createCell(2).setCellValue("安装区域");
        titleRow.createCell(3).setCellValue("精度");
        titleRow.createCell(4).setCellValue("波特率(HZ)");
        titleRow.createCell(5).setCellValue("初次检定日期");
        titleRow.createCell(6).setCellValue("二次检定日期");
        titleRow.createCell(7).setCellValue("压力等级");
        titleRow.createCell(8).setCellValue("温度等级");
        titleRow.createCell(9).setCellValue("防护等级");
        titleRow.createCell(10).setCellValue("设备连接状态");
        for(int i=0;i<11;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "传感器台账模板";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String fileName = new String(filename.getBytes(), "iso8859-1") + df.format(new Date()) + ".xls";
        response.setHeader("Content-disposition", "attachment; filename="+fileName);;
        response.setContentType("application/msexcel");
        workbook.write(outputStream);
        outputStream.close();
    }
    //导入表格
    @RequestMapping(value = "/importExcel.do",method = RequestMethod.POST)
    public String inputExcel(@RequestParam(name = "inputFile",required = true) MultipartFile inputFile)throws Exception{
        Workbook workbook = null;
        String fileName = inputFile.getOriginalFilename();
        if(fileName.endsWith(XLS)){
            workbook = new HSSFWorkbook(inputFile.getInputStream());
        }else if(fileName.endsWith(XLSX)){
            workbook = new XSSFWorkbook(inputFile.getInputStream());
        }else {
            throw new Exception("文件格式不支持！");
        }
        Sheet sheet = workbook.getSheet("Sheet1");
        int rows = sheet.getLastRowNum();
        if(rows==0){
            throw new Exception("请填写数据！");
        }
        for(int i=1;i<=rows+1;i++){
            Row row = sheet.getRow(i);
            if(row!=null){
                Sensors sensors = new Sensors();

                String sensorsName = ExcelUtil.getCellValue(row.getCell(0));
                sensors.setSensorsName(sensorsName);
                String sensorsType = ExcelUtil.getCellValue(row.getCell(1));
                sensors.setSensorsType(sensorsType);
                String location = ExcelUtil.getCellValue(row.getCell(2));
                sensors.setInstalltionAddr(location);
                String precision = ExcelUtil.getCellValue(row.getCell(3));
                sensors.setPrecision(precision);
                String baudRateStr = ExcelUtil.getCellValue(row.getCell(4));
                if(!StringUtils.isEmpty(baudRateStr)){
                    Integer baudRate = Integer.parseInt(baudRateStr);
                    sensors.setBaudRate(baudRate);
                }
                String timeStr1 = ExcelUtil.getCellValue(row.getCell(5));
                if(!StringUtils.isEmpty(timeStr1)){
                    Date testTime1 = DateUtils.string2Date(timeStr1,"yyyy-MM-dd");
                    sensors.setLastTime(testTime1);
                }
                String timeStr2 = ExcelUtil.getCellValue(row.getCell(6));
                if(!StringUtils.isEmpty(timeStr2)){
                    Date testTime2 = DateUtils.string2Date(timeStr2,"yyyy-MM-dd");
                    sensors.setNextTime(testTime2);
                }
                String pressureStr = ExcelUtil.getCellValue(row.getCell(7));
                if(!StringUtils.isEmpty(pressureStr)){
                    Integer pressure = Integer.parseInt(pressureStr);
                    sensors.setPressureGrade(pressure);
                }
                String tempStr = ExcelUtil.getCellValue(row.getCell(8));
                if(!StringUtils.isEmpty(tempStr)){
                    Integer temp = Integer.parseInt(tempStr);
                    sensors.setTempGrade(temp);
                }
                String protect = ExcelUtil.getCellValue(row.getCell(9));
                sensors.setPrl(protect);
                String statusStr = ExcelUtil.getCellValue(row.getCell(10));
                if(!StringUtils.isEmpty(statusStr)){
                    Integer status = Integer.parseInt(statusStr);
                    sensors.setStatus(status);
                }
                sensorsService.save(sensors);
            }
        }
        return "redirect:findAll.do";
    }
}
