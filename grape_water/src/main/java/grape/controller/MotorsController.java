package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.AlarmType;
import grape.domain.Area;
import grape.domain.Caution;
import grape.domain.Motors;
import grape.service.IAlarmService;
import grape.service.IAreaService;
import grape.service.ICautionService;
import grape.service.IMotorsService;
import grape.utils.DateUtils;
import grape.utils.ExcelUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("/motors")
public class MotorsController {
    private final static String XLS = "xls";
    private final static String XLSX = "xlsx";
    //excel默认宽度；
    private static int width = 300 * 20;
    //默认字体
    private static String excelfont = "宋体";
    @Autowired
    private IMotorsService motorsService;
    @Autowired
    private IAlarmService alarmService;
    @Autowired
    private ICautionService cautionService;
    @Autowired
    private IAreaService areaService;
    @RequestMapping(value = "/findAll.do",method = RequestMethod.GET)
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Motors> motorsList = motorsService.findAll(page, size);
        List<AlarmType> alarmTypes = alarmService.getAll();
        PageInfo pageInfo = new PageInfo(motorsList);
        mv.addObject("motorsList",motorsList);
        mv.addObject("alarmTypes",alarmTypes);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("motorsReport-list");
        return mv;
    }
    @RequestMapping(value = "/save.do",method = RequestMethod.POST)
    public String save(Motors motors)throws Exception{
        motorsService.save(motors);
        return "redirect:findAll.do";
    }

    @RequestMapping(value = "/findByCode.do",method = RequestMethod.POST)
    public ModelAndView findByCode(@RequestParam(name = "codeStr",required = true) String codeStr,@RequestParam(name="page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Motors> codeList = motorsService.findByCode(codeStr, page, size);
        PageInfo pageInfo = new PageInfo(codeList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("codeList",codeList);
        mv.setViewName("motorsReport-list");
        return mv;
    }
    @RequestMapping("/deleteById.do")
    public String deleteById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        motorsService.deleteById(id);
        return "redirect:findAll.do";
    }
    @RequestMapping("/delete.do")
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true) String ids){
        Map<String,String> map = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        try {
            for(int i=0;i<idsStr.length;i++){
                motorsService.deleteById(Integer.parseInt(idsStr[i]));
            }
            map.put("type","success");
        }catch (Exception e){
            e.printStackTrace();
            map.put("type","error");
        }
        return map;
    }
    @RequestMapping("/editGo.do")
    public ModelAndView showById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        ModelAndView mv = new ModelAndView();
        Motors motors = motorsService.findById(id);
        mv.addObject("motors",motors);
        mv.setViewName("motorsReport-edit");
        return mv;
    }

    @RequestMapping("/addTo.do")
    public ModelAndView addTo()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Area> areas = areaService.getAll();
        mv.addObject("areas",areas);
        mv.setViewName("motorsReport-add");
        return mv;
    }
    @RequestMapping(value = "/edit.do",method = RequestMethod.POST)
    public String editMotors(Motors motors)throws Exception{
        motorsService.update(motors);
        return "redirect:findAll.do";
    }
    //导出全部信息
    @RequestMapping(value = "/exportExcel.do",method = RequestMethod.GET)
    public void outExcel(HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<Motors> list = motorsService.getAll();
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("电机运行记录表");
        HSSFRow titleRow = sheet.createRow(0);
        HSSFCellStyle style = workbook.createCellStyle();
        HSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontName(excelfont);
        font.setFontHeightInPoints((short) 14);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        titleRow.createCell(0).setCellValue("序号");
        titleRow.createCell(1).setCellValue("系统编号");
        titleRow.createCell(2).setCellValue("监测时间");
        titleRow.createCell(3).setCellValue("内部名称");
        titleRow.createCell(4).setCellValue("监测区域");
        titleRow.createCell(5).setCellValue("电机电压(V)");
        titleRow.createCell(6).setCellValue("电机电流(A)");
        titleRow.createCell(7).setCellValue("输入功率(KW)");
        titleRow.createCell(8).setCellValue("输出功率(KW)");
        titleRow.createCell(9).setCellValue("运行效率(%)");
        titleRow.createCell(10).setCellValue("耗能单元kW·h(t·hm)");
        titleRow.createCell(11).setCellValue("当日耗电(kw·h)");
        for(int i=1;i<12;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        //将数据放入表格中
        for(Motors motors:list){
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum()+1);
            dataRow.createCell(0).setCellValue(motors.getId());
            dataRow.createCell(1).setCellValue(motors.getModelCode());
            dataRow.createCell(2).setCellValue(motors.getTimeStr());
            dataRow.createCell(3).setCellValue(motors.getInName());
            dataRow.createCell(4).setCellValue(motors.getLocation());
            dataRow.createCell(5).setCellValue(motors.getVoltage());
            dataRow.createCell(6).setCellValue(motors.getElectricity());
            dataRow.createCell(7).setCellValue(motors.getInputPower());
            dataRow.createCell(8).setCellValue(motors.getOutputPower());
            dataRow.createCell(9).setCellValue(motors.getOperateEfficiency());
            dataRow.createCell(10).setCellValue(motors.getEnergyUnit());
            dataRow.createCell(11).setCellValue(motors.getEnergyUsed());
            for(int i=1;i<12;i++){
                dataRow.setRowStyle(style);
            }
        }
        //输出文件
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "电机运行报表";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String fileName = new String(filename.getBytes(), "iso8859-1") + df.format(new Date()) + ".xls";
        response.setHeader("Content-disposition", "attachment; filename="+fileName);;
        response.setContentType("application/msexcel");
        workbook.write(outputStream);
        outputStream.close();
    }

    //下载导入表的模板
    @RequestMapping(value = "/downloadModal.do",method = RequestMethod.GET)
    public void getModal(HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("Sheet1");
        HSSFRow titleRow = sheet.createRow(0);
        HSSFCellStyle style = workbook.createCellStyle();
        HSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontName(excelfont);
        font.setFontHeightInPoints((short) 14);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        titleRow.createCell(0).setCellValue("系统编号");
        titleRow.createCell(1).setCellValue("监测时间");
        titleRow.createCell(2).setCellValue("内部名称");
        titleRow.createCell(3).setCellValue("监测区域");
        titleRow.createCell(4).setCellValue("电机电压(V)");
        titleRow.createCell(5).setCellValue("电机电流(A)");
        titleRow.createCell(6).setCellValue("输入功率(KW)");
        titleRow.createCell(7).setCellValue("输出功率(KW)");
        titleRow.createCell(8).setCellValue("运行效率(%)");
        titleRow.createCell(9).setCellValue("耗能单元kW·h(t·hm)");
        titleRow.createCell(10).setCellValue("当日耗电(kw·h)");
        for(int i=0;i<11;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "电机运行报表模板";
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
                Motors motors = new Motors();
                String modelCode = ExcelUtil.getCellValue(row.getCell(0));
                motors.setModelCode(modelCode);
                String timeStr = ExcelUtil.getCellValue(row.getCell(1));
                if(!StringUtils.isEmpty(timeStr)){
                    Date testTime = DateUtils.string2Date(timeStr,"yyyy-MM-dd HH:mm");
                    motors.setTestTime(testTime);
                }
                String inName = ExcelUtil.getCellValue(row.getCell(2));
                motors.setInName(inName);
                String location = ExcelUtil.getCellValue(row.getCell(3));
                motors.setLocation(location);
                String voltageStr = ExcelUtil.getCellValue(row.getCell(4));
                if(!StringUtils.isEmpty(voltageStr)){
                    Double voltage = Double.parseDouble(voltageStr);
                    motors.setVoltage(voltage);
                }
                String electricityStr = ExcelUtil.getCellValue(row.getCell(5));
                if(!StringUtils.isEmpty(electricityStr)){
                    Double electricity = Double.parseDouble(electricityStr);
                    motors.setElectricity(electricity);
                }
                String inputPowerStr = ExcelUtil.getCellValue(row.getCell(6));
                if(!StringUtils.isEmpty(inputPowerStr)){
                    Double inputPower = Double.parseDouble(inputPowerStr);
                    motors.setInputPower(inputPower);
                }
                String outputPowerStr = ExcelUtil.getCellValue(row.getCell(7));
                if(!StringUtils.isEmpty(outputPowerStr)){
                    Double outputPower = Double.parseDouble(outputPowerStr);
                    motors.setOutputPower(outputPower);
                }
                String operateEfficiencyStr = ExcelUtil.getCellValue(row.getCell(8));
                if(!StringUtils.isEmpty(operateEfficiencyStr)){
                    Double operateEfficiency = Double.parseDouble(operateEfficiencyStr);
                    motors.setOperateEfficiency(operateEfficiency);
                }
                String energyUnitStr = ExcelUtil.getCellValue(row.getCell(9));
                if(!StringUtils.isEmpty(electricityStr)){
                    Double energyUnit = Double.parseDouble(energyUnitStr);
                    motors.setEnergyUnit(energyUnit);
                }
                String energyUsedStr = ExcelUtil.getCellValue(row.getCell(10));
                if(!StringUtils.isEmpty(energyUsedStr)){
                    Double energyUsed = Double.parseDouble(energyUsedStr);
                    motors.setEnergyUsed(energyUsed);
                }
                motorsService.save(motors);
            }
        }
        return "redirect:findAll.do";
    }
    @RequestMapping(value = "/addCaution.do",method = RequestMethod.POST)
    public String insert(Caution caution)throws Exception{
        cautionService.insert(caution);
        return "redirect:findAll.do";
    }
}
