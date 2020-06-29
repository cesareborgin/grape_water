package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.AlarmType;
import grape.domain.Caution;
import grape.domain.Repumps;
import grape.service.IAlarmService;
import grape.service.ICautionService;
import grape.utils.DateUtils;
import grape.utils.ExcelUtil;
import grape.service.IRepumpsService;
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
@RequestMapping("/reports")
public class PumpsReController {
    private final static String XLS = "xls";
    private final static String XLSX = "xlsx";
    //excel默认宽度；
    private static int width = 300 * 20;
    //默认字体
    private static String excelfont = "宋体";
    @Autowired
    private IRepumpsService repumpsService;
    @Autowired
    private IAlarmService alarmService;
    @Autowired
    private ICautionService cautionService;
    @RequestMapping("/formsA.do")
    public ModelAndView formsA(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "12")Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Repumps> list = repumpsService.findAll(page, size);
        List<AlarmType> alarmTypes = alarmService.getAll();
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("list",list);
        mv.addObject("alarmTypes",alarmTypes);
        mv.setViewName("reportpumps-list");
        return mv;
    }

    @RequestMapping("/save.do")
    public String add(Repumps repumps)throws Exception{
        repumpsService.save(repumps);
        return "redirect:formsA.do";
    }

    @RequestMapping("/delete.do")
    public String deleteById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        repumpsService.deleteById(id);
        return "redirect:formsA.do";
    }
    @RequestMapping(value = "/findByCode.do",method = RequestMethod.POST)
    public ModelAndView findByCode(@RequestParam(name = "codeStr",required = true) String codeStr,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv= new ModelAndView();
        List<Repumps> codeList = repumpsService.searchCode(codeStr, page, size);
        PageInfo pageInfo = new PageInfo(codeList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("codeList",codeList);
        mv.setViewName("reportpumps-list");
        return mv;
    }
    //导出全部信息
    @RequestMapping(value = "/exportExcel.do",method = RequestMethod.GET)
    public void outExcel(HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<Repumps> list = repumpsService.getAll();
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("水泵运行报表记录");
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
        titleRow.createCell(1).setCellValue("监测时段");
        titleRow.createCell(2).setCellValue("系统编号");
        titleRow.createCell(3).setCellValue("泵入口压力(MPa)");
        titleRow.createCell(4).setCellValue("泵出口压力(MPa)");
        titleRow.createCell(5).setCellValue("泵进、出口温差(℃)");
        titleRow.createCell(6).setCellValue("泵实际扬程(m)");
        titleRow.createCell(7).setCellValue("泵实际流量(m³/h)");
        titleRow.createCell(8).setCellValue("泵运行效率(%)");
        titleRow.createCell(9).setCellValue("传送效率(%) ");
        titleRow.createCell(10).setCellValue("吸水高度(m)");
        titleRow.createCell(11).setCellValue("排水高度(m)");
        titleRow.createCell(12).setCellValue("工艺所需压力(MPa)");
        titleRow.createCell(13).setCellValue("系统回水末端压力(MPa)");
        titleRow.createCell(14).setCellValue("表位差(m)");
        sheet.setColumnWidth(1,400*20);
        for(int i=2;i<15;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        //便利数据放入Excel
        for(Repumps repumps :list){
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(repumps.getId());
            dataRow.createCell(1).setCellValue(repumps.getMonitorsTime());
            dataRow.createCell(2).setCellValue(repumps.getModelCode());
            dataRow.createCell(3).setCellValue(repumps.getInletPressure());
            dataRow.createCell(4).setCellValue(repumps.getOutletPressure());
            dataRow.createCell(5).setCellValue(repumps.getTemperature());
            dataRow.createCell(6).setCellValue(repumps.getHeadDelivery());
            dataRow.createCell(7).setCellValue(repumps.getRateFlow());
            dataRow.createCell(8).setCellValue(repumps.getOperateEfficiency());
            dataRow.createCell(9).setCellValue(repumps.getTransferEfficiency());
            dataRow.createCell(10).setCellValue(repumps.getSuctionHeight());
            dataRow.createCell(11).setCellValue(repumps.getDrainageHeight());
            dataRow.createCell(12).setCellValue(repumps.getCraftPressure());
            dataRow.createCell(13).setCellValue(repumps.getBackwaterPressure());
            dataRow.createCell(14).setCellValue(repumps.getPotentialDifference());
            for(int i=1;i<15;i++){
                dataRow.setRowStyle(style);
            }
        }
        //输出文件
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "水泵运行报表";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String fileName = new String(filename.getBytes(), "iso8859-1") + df.format(new Date()) + ".xls";
        response.setHeader("Content-disposition", "attachment; filename="+fileName);;
        response.setContentType("application/msexcel");
        workbook.write(outputStream);
        outputStream.close();
    }
    //导入Excel表格
    @RequestMapping(value = "/importExcel.do",method = RequestMethod.POST)
    public String importExcel(@RequestParam(name = "InputFile",required = true) MultipartFile InputFile)throws Exception{
        Workbook workbook = null;
        String fileName = InputFile.getOriginalFilename();
        if (fileName.endsWith(XLS)){
            workbook = new HSSFWorkbook(InputFile.getInputStream());
        }else if(fileName.endsWith(XLSX)){
            workbook = new XSSFWorkbook(InputFile.getInputStream());
        }else {
            throw new Exception("文件格式不合适！");
        }
        Sheet sheet = workbook.getSheet("Sheet1");
        int rows = sheet.getLastRowNum();
        if(rows==0){
            throw new Exception("请填写数据！");
        }
        for(int i=1;i<=rows+1;i++){
            // 读取左上端单元格
            Row row = sheet.getRow(i);
            //行不能为空
            if(row!=null){
                // **读取cell**
             Repumps repumps = new Repumps();
             String monitorfirstStr = ExcelUtil.getCellValue(row.getCell(0));
             if(!StringUtils.isEmpty(monitorfirstStr)){
                 Date monitorfirstTime = DateUtils.string2Date(monitorfirstStr,"yyyy-MM-dd HH:mm");
                 repumps.setMonitorfirstDate(monitorfirstTime);
             }
             String monitorsecondStr = ExcelUtil.getCellValue(row.getCell(1));
             if(!StringUtils.isEmpty(monitorsecondStr)){
                 Date monitorsecondTime = DateUtils.string2Date(monitorsecondStr,"yyyy-MM-dd HH:mm");
                 repumps.setMonitorsecondDate(monitorsecondTime);
             }
             String modalCode = ExcelUtil.getCellValue(row.getCell(2));
             repumps.setModelCode(modalCode);
             String inletPressureStr = ExcelUtil.getCellValue(row.getCell(3));
             if(!StringUtils.isEmpty(inletPressureStr)){
                 Double inletPressure = Double.parseDouble(inletPressureStr);
                 repumps.setInletPressure(inletPressure);
             }
             String outletPressureStr = ExcelUtil.getCellValue(row.getCell(4));
             if(!StringUtils.isEmpty(outletPressureStr)){
                 Double outletPressure = Double.parseDouble(outletPressureStr);
                 repumps.setOutletPressure(outletPressure);
             }
             String temperatureStr = ExcelUtil.getCellValue(row.getCell(5));
             if(!StringUtils.isEmpty(temperatureStr)){
                 Double temperature = Double.parseDouble(temperatureStr);
                 repumps.setTemperature(temperature);
             }
             String headDeliveryStr = ExcelUtil.getCellValue(row.getCell(6));
             if(!StringUtils.isEmpty(headDeliveryStr)){
                 Double headDelivery = Double.parseDouble(headDeliveryStr);
                 repumps.setHeadDelivery(headDelivery);
             }
             String rateFlowStr = ExcelUtil.getCellValue(row.getCell(7));
             if(!StringUtils.isEmpty(rateFlowStr)){
                 Double rateFlow = Double.parseDouble(rateFlowStr);
                 repumps.setRateFlow(rateFlow);
             }
             String operateEfficiencyStr = ExcelUtil.getCellValue(row.getCell(8));
             if(!StringUtils.isEmpty(operateEfficiencyStr)){
                 Double operateEfficiency = Double.parseDouble(operateEfficiencyStr);
                 repumps.setOperateEfficiency(operateEfficiency);
             }
             String transferEfficiencyStr = ExcelUtil.getCellValue(row.getCell(9));
             if(!StringUtils.isEmpty(transferEfficiencyStr)){
                 Double transferEfficiency = Double.parseDouble(transferEfficiencyStr);
                 repumps.setTransferEfficiency(transferEfficiency);
             }
             String suctionHeightStr = ExcelUtil.getCellValue(row.getCell(10));
             if(!StringUtils.isEmpty(suctionHeightStr)){
                 Double suctionHeight = Double.parseDouble(suctionHeightStr);
                 repumps.setSuctionHeight(suctionHeight);
             }
             String drainageHeightStr = ExcelUtil.getCellValue(row.getCell(11));
             if(!StringUtils.isEmpty(drainageHeightStr)){
                 Double drainageHeight = Double.parseDouble(drainageHeightStr);
                 repumps.setDrainageHeight(drainageHeight);
             }
             String craftPressureStr = ExcelUtil.getCellValue(row.getCell(12));
             if(!StringUtils.isEmpty(craftPressureStr)){
                 Double craftPressure = Double.parseDouble(craftPressureStr);
                 repumps.setCraftPressure(craftPressure);
             }
             String backwaterPressureStr = ExcelUtil.getCellValue(row.getCell(13));
             if(!StringUtils.isEmpty(backwaterPressureStr)){
                 Double backwaterPressure = Double.parseDouble(backwaterPressureStr);
                 repumps.setBackwaterPressure(backwaterPressure);
             }
             String potentialDifferenceStr = ExcelUtil.getCellValue(row.getCell(14));
             if(!StringUtils.isEmpty(potentialDifferenceStr)){
                 Double potentialDifference = Double.parseDouble(potentialDifferenceStr);
                 repumps.setPotentialDifference(potentialDifference);
             }
             repumpsService.save(repumps);
            }
        }
        return "redirect:formsA.do";
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
        style.setBorderTop(BorderStyle.THIN);
        titleRow.createCell(0).setCellValue("初次监测时间");
        titleRow.createCell(1).setCellValue("二次监测时间");
        titleRow.createCell(2).setCellValue("系统编号");
        titleRow.createCell(3).setCellValue("泵入口压力(MPa)");
        titleRow.createCell(4).setCellValue("泵出口压力(MPa)");
        titleRow.createCell(5).setCellValue("泵进、出口温差(℃)");
        titleRow.createCell(6).setCellValue("泵实际扬程(m)");
        titleRow.createCell(7).setCellValue("泵实际流量(m³/h)");
        titleRow.createCell(8).setCellValue("泵运行效率(%)");
        titleRow.createCell(9).setCellValue("传送效率(%) ");
        titleRow.createCell(10).setCellValue("吸水高度(m)");
        titleRow.createCell(11).setCellValue("排水高度(m)");
        titleRow.createCell(12).setCellValue("工艺所需压力(MPa)");
        titleRow.createCell(13).setCellValue("系统回水末端压力(MPa)");
        titleRow.createCell(14).setCellValue("表位差(m)");
        sheet.setColumnWidth(1,400*20);
        for(int i=2;i<15;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "水泵运行报表模板";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String fileName = new String(filename.getBytes(), "iso8859-1") + df.format(new Date()) + ".xls";
        response.setHeader("Content-disposition", "attachment; filename="+fileName);;
        response.setContentType("application/msexcel");
        workbook.write(outputStream);
        outputStream.close();
    }

    @RequestMapping(value = "/findById.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        Repumps repumps = repumpsService.fingById(id);
        map.put("entity",repumps);
        return map;
    }

    @RequestMapping(value = "/update.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> update(Repumps repumps){
        Map<String,String> map = new HashMap<String, String>();
        try {
            repumpsService.update(repumps);
            map.put("type","success");
        } catch (Exception e) {
            map.put("type","error");
            e.printStackTrace();
        }
        return map;
    }
    @RequestMapping(value = "/addCaution.do",method = RequestMethod.POST)
    public String insert(Caution caution)throws Exception{
        cautionService.insert(caution);
        return "redirect:formsA.do";
    }
}
