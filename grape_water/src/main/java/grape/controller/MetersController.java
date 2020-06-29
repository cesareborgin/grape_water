package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Area;
import grape.domain.Meters;
import grape.service.IAreaService;
import grape.service.IMetersService;
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
@RequestMapping("/meters")
public class MetersController {
    //excel默认宽度；
    private static int width = 300 * 20;
    //默认字体
    private static String excelfont = "宋体";
    private final static String XLS = "xls";
    private final static String XLSX = "xlsx";
    @Autowired
    private IMetersService metersService;
    @Autowired
    private IAreaService areaService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Meters> metersList = metersService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(metersList);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.addObject("metersList",metersList);
        modelAndView.setViewName("meters-list");
        return modelAndView;
    }

    @RequestMapping("/toAdd.do")
    public ModelAndView toAdd()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Area> areas = areaService.getAll();
        mv.addObject("areas",areas);
        mv.setViewName("meters-add");
        return mv;
    }

    @RequestMapping("/getLocation.do")
    @ResponseBody
    public Map<String,Object> getCode(@RequestParam(name = "location",required = true) String location)throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        List<Area> areas = areaService.search(location);
        map.put("areas",areas);
        return map;
    }
    @RequestMapping("/save.do")
    public String add(Meters meters)throws Exception{
        metersService.add(meters);
        return "redirect:findAll.do";
    }
    @RequestMapping("/deleteById.do")
    public String deleteById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        metersService.deleteById(id);
        return "redirect:findAll.do";
    }
    @RequestMapping(value = "/findByCode.do",method = RequestMethod.POST)
    public ModelAndView findByCode(@RequestParam(name = "codeStr",required = true) String codeStr,@RequestParam(name="page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "10") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
       List<Meters> codeList = metersService.findByName(codeStr,page,size);
        PageInfo pageInfo = new PageInfo(codeList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("codeList",codeList);
        mv.setViewName("meters-list");
        return mv;
    }

    @RequestMapping("/editGo.do")
    public ModelAndView editGo(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        Meters meters = metersService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("meters",meters);
        mv.setViewName("meters-edit");
        return mv;
    }

    @RequestMapping(value = "/edit.do",method = RequestMethod.POST)
    public String edit(Meters meters)throws Exception{
        metersService.update(meters);
        return "redirect:findAll.do";
    }
    @RequestMapping("/delete.do")
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true) String ids){
        Map<String,String> map = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        try {
            for(int i=0;i<idsStr.length;i++){
                metersService.deleteById(Integer.parseInt(idsStr[i]));
            }
            map.put("type","success");
        }catch (Exception e){
            e.printStackTrace();
            map.put("type","error");
        }
        return map;
    }

    //导出Excel
    @RequestMapping(value = "/exportExcel.do",method = RequestMethod.GET)
    public void outExcel(HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<Meters> list = metersService.getAll();
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("计量器台账");
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
        titleRow.createCell(2).setCellValue("生产产家");
        titleRow.createCell(3).setCellValue("计量器名称");
        titleRow.createCell(4).setCellValue("计量器型号");
        titleRow.createCell(5).setCellValue("测量精度");
        titleRow.createCell(6).setCellValue("口径（mm）");
        titleRow.createCell(7).setCellValue("防爆等级");
        titleRow.createCell(8).setCellValue("计量器规格");
        titleRow.createCell(9).setCellValue("通讯方式");
        titleRow.createCell(10).setCellValue("安装位置");
        titleRow.createCell(11).setCellValue("安装位置编号");
        titleRow.createCell(12).setCellValue("设备状态");
        for(int i=1;i<13;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        //将数据放入表格中
        for(Meters meters:list){
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum()+1);
            for(int i=1;i<13;i++){
                dataRow.setRowStyle(style);
            }
            dataRow.createCell(0).setCellValue(meters.getId());
            dataRow.createCell(1).setCellValue(meters.getModelCode());
            dataRow.createCell(2).setCellValue(meters.getProtector());
            dataRow.createCell(3).setCellValue(meters.getMeterName());
            dataRow.createCell(4).setCellValue(meters.getMeterType());
            dataRow.createCell(5).setCellValue(meters.getMeasureAccuracy());
            dataRow.createCell(6).setCellValue(meters.getCaliber());
            dataRow.createCell(7).setCellValue(meters.getProtector());
            dataRow.createCell(8).setCellValue(meters.getSpecification());
            dataRow.createCell(9).setCellValue(meters.getCoumMethod());
            dataRow.createCell(10).setCellValue(meters.getLocation());
            dataRow.createCell(11).setCellValue(meters.getLocationCode());
            dataRow.createCell(12).setCellValue(meters.getStatusStr());
        }
        //输出文件
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "计量器台账";
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
        titleRow.createCell(1).setCellValue("生产产家");
        titleRow.createCell(2).setCellValue("计量器名称");
        titleRow.createCell(3).setCellValue("计量器型号");
        titleRow.createCell(4).setCellValue("测量精度");
        titleRow.createCell(5).setCellValue("口径（mm）");
        titleRow.createCell(6).setCellValue("防爆等级");
        titleRow.createCell(7).setCellValue("计量器规格");
        titleRow.createCell(8).setCellValue("通讯方式");
        titleRow.createCell(9).setCellValue("安装位置");
        titleRow.createCell(10).setCellValue("安装位置编号");
        titleRow.createCell(11).setCellValue("设备状态");
        for(int i=0;i<12;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "计量器台账信息模板";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String fileName = new String(filename.getBytes(), "iso8859-1") + df.format(new Date()) + ".xls";
        response.setHeader("Content-disposition", "attachment; filename="+fileName);;
        response.setContentType("application/msexcel");
        workbook.write(outputStream);
        outputStream.close();
    }
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
                Meters meters = new Meters();
                String modelCode = ExcelUtil.getCellValue(row.getCell(0));
                meters.setModelCode(modelCode);
                String productName = ExcelUtil.getCellValue(row.getCell(1));
                meters.setProductName(productName);
                String meterName = ExcelUtil.getCellValue(row.getCell(2));
                meters.setMeterName(meterName);
                String meterType = ExcelUtil.getCellValue(row.getCell(3));
                meters.setMeterName(meterType);
                String measureAccuracy = ExcelUtil.getCellValue(row.getCell(4));
                meters.setMeasureAccuracy(measureAccuracy);
                String caliberStr= ExcelUtil.getCellValue(row.getCell(5));
                if(!StringUtils.isEmpty(caliberStr)){
                    Double caliber = Double.parseDouble(caliberStr);
                    meters.setCaliber(caliber);
                }
                String protector = ExcelUtil.getCellValue(row.getCell(6));
                meters.setProtector(protector);
                String specification = ExcelUtil.getCellValue(row.getCell(7));
                meters.setSpecification(specification);
                String coumMethod = ExcelUtil.getCellValue(row.getCell(8));
                meters.setCoumMethod(coumMethod);
                String location = ExcelUtil.getCellValue(row.getCell(9));
                meters.setLocation(location);
                String locationCode = ExcelUtil.getCellValue(row.getCell(10));
                meters.setLocationCode(locationCode);
                String statusStr = ExcelUtil.getCellValue(row.getCell(11));
                if(!StringUtils.isEmpty(statusStr)){
                    Integer status=null;
                    if(statusStr.equals("连接正常")){
                        status = 1;
                    }else if(statusStr.equals("离线")){
                        status = 0;
                    }else if(statusStr.equals("下架")){
                        status = 3;
                    }else if(statusStr.equals("设备异常")){
                        status = 2;
                    }
                    meters.setStatus(status);
                }
                metersService.add(meters);
            }
        }
        return "redirect:findAll.do";
    }
}
