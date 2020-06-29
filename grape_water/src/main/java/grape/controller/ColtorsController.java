package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Area;
import grape.domain.Coltors;
import grape.domain.Energy;
import grape.domain.Entity;
import grape.service.IAreaService;
import grape.service.IColtorsService;
import grape.service.IEntityService;
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

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static grape.utils.ExcelUtil.getCellValue;

@Controller
@RequestMapping("/coltors")
public class ColtorsController {
    @Autowired
    private IColtorsService coltorsService;
    @Autowired
    private IAreaService areaService;
    @Autowired
    private IEntityService entityService;
    private final static String XLS = "xls";
    private final static String XLSX = "xlsx";
    //excel默认宽度；
    private static int width = 300 * 20;
    //默认字体
    private static String excelfont = "宋体";
    //查询所有
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1" ) Integer page, @RequestParam(name = "size", required = true, defaultValue = "12") Integer size) throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Coltors> coltorsList = coltorsService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(coltorsList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("coltorsList",coltorsList);
        mv.setViewName("coltors-list");
        return mv;
    }

    //进入添加页
    @RequestMapping("/toAdd.do")
    public ModelAndView addTo()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Area> areas = areaService.getAll();
        List<Entity> entities = entityService.getEntityII();
        mv.addObject("areas",areas);
        mv.addObject("entities",entities);
        mv.setViewName("coltors-add");
        return mv;
    }
    //根据采集器名称模糊查询
    @RequestMapping(value = "/searchList.do",method = RequestMethod.POST)
    public ModelAndView findByColtorName(@RequestParam(name = "page",required = true,defaultValue = "1" ) Integer page, @RequestParam(name = "size", required = true, defaultValue = "12") Integer size,@RequestParam(name = "searchName",required = true) String searchName)throws Exception{
        ModelAndView mv= new ModelAndView();
        List<Coltors> coltors = coltorsService.findByColorName(searchName,page,size);
        PageInfo pageInfo = new PageInfo(coltors);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("coltorsfind",coltors);
        mv.setViewName("coltors-list");
        return mv;
    }
    //新建采集器
    @RequestMapping(value = "/save.do")
    public String addColtors(Coltors coltors) throws Exception{
        coltorsService.save(coltors);
        return "redirect:findAll.do";
    }
    //删除一条采集器信息
    @RequestMapping("/delete.do")
    public String deleteColtors(@RequestParam(name = "id",required = true)Integer id) throws Exception{
        coltorsService.deleteById(id);
        return "redirect:findAll.do";
    }
    @RequestMapping("/deleteMore.do")
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true) String ids){
        Map<String,String> map = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        try {
            for(int i=0;i<idsStr.length;i++){
                coltorsService.deleteById(Integer.parseInt(idsStr[i]));
            }
            map.put("type","success");
        }catch (Exception e){
            e.printStackTrace();
            map.put("type","error");
        }
        return map;
    }
    //修改采集器
    @RequestMapping("/editGo.do")
    public ModelAndView editGo(@RequestParam(name = "id",required = true)Integer id)throws Exception{
        Coltors coltors = coltorsService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("coltor",coltors);
        mv.setViewName("coltors-edit");
        return mv;
    }
    @RequestMapping("/edit.do")
    public String editColtors(Coltors coltors)throws Exception{
        coltorsService.update(coltors);
        return "redirect:findAll.do";
    }
    //导出全部采集器
    @RequestMapping(value = "/exportExcel.do",method = RequestMethod.GET)
    public void exportExcel(HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<Coltors> list = coltorsService.getAll();
        //System.out.println(list);
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("采集器信息表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        HSSFCellStyle style = wb.createCellStyle();
        HSSFFont font = wb.createFont();
        font.setBold(true);
        font.setFontName(excelfont);
        font.setFontHeightInPoints((short) 13);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        for(int i=1;i<11;i++){
            titleRow.setRowStyle(style);
            sheet.setColumnWidth(i,width);
        }
        titleRow.createCell(0).setCellValue("序号");
        titleRow.createCell(1).setCellValue("采集器名称");
        titleRow.createCell(2).setCellValue("采集器型号");
        titleRow.createCell(3).setCellValue("系统编号");
        titleRow.createCell(4).setCellValue("编码");
        titleRow.createCell(5).setCellValue("安装位置名称");
        titleRow.createCell(6).setCellValue("安装位置编号");
        titleRow.createCell(7).setCellValue("监测对象名称");
        titleRow.createCell(8).setCellValue("串口号");
        titleRow.createCell(9).setCellValue("表地址 ");
        titleRow.createCell(10).setCellValue("连接状态");
        //遍历将数据放到excel
        for(Coltors coltors:list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(coltors.getId());
            dataRow.createCell(1).setCellValue(coltors.getColtorName());
            dataRow.createCell(2).setCellValue(coltors.getColtorType());
            dataRow.createCell(3).setCellValue(coltors.getSysNumber());
            dataRow.createCell(4).setCellValue(coltors.getCode());
            dataRow.createCell(5).setCellValue(coltors.getInstalltionName());
            dataRow.createCell(6).setCellValue(coltors.getInstalltionCode());
            dataRow.createCell(7).setCellValue(coltors.getTestobjName());
            dataRow.createCell(8).setCellValue(coltors.getSerialPort());
            dataRow.createCell(9).setCellValue(coltors.getTableAdrr());
            dataRow.createCell(10).setCellValue(coltors.getStatusStr());
            for(int i=0;i<11;i++){
                dataRow.setRowStyle(style);
            }
        }
            // 设置下载时客户端Excel的名称   （上面注释的改进版本，上面的中文不支持）
        //第六步,输出Excel文件
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        long filename = System.currentTimeMillis();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String fileName = df.format(new Date());// new Date()为获取当前系统时间
        response.setHeader("Content-disposition", "attachment; filename="+fileName+".xls");
        response.setContentType("application/msexcel");
        wb.write(outputStream);
        outputStream.close();
        }

    //导入文件
    @RequestMapping(value = "/importExcel.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> inputExcel(@RequestParam(name = "inputFile",required = true) MultipartFile inputFile){
        Integer status = null;
        Map<String,String> ret = new HashMap<String, String>();
        try {
            Workbook workbook = null;
            String fileName = inputFile.getOriginalFilename();
            if(fileName.endsWith(XLS)){
                workbook = new HSSFWorkbook(inputFile.getInputStream());
            }else if(fileName.endsWith(XLSX)){
                workbook = new XSSFWorkbook(inputFile.getInputStream());
            }else {
                ret.put("type","format");
                ret.put("msg","选择正确的文件格式！");
            }
            Sheet sheet = workbook.getSheet("Sheet1");
            int rows = sheet.getLastRowNum();
            if(rows==0){
                ret.put("type","nodata");
                ret.put("msg","请填写数据！");
            }
            for(int i=1;i<=rows+1;i++){
                Row row = sheet.getRow(i);
                if(row!=null){
                    // **读取cell**
                    Coltors coltors = new Coltors();
                    //采集器名称
                    String coltorName = ExcelUtil.getCellValue(row.getCell(0));
                    String coltorType = ExcelUtil.getCellValue(row.getCell(1));
                    String sysNumber = ExcelUtil.getCellValue(row.getCell(2));
                    String code = ExcelUtil.getCellValue(row.getCell(3));
                    String installtionName = ExcelUtil.getCellValue(row.getCell(4));
                    String installtionCode = ExcelUtil.getCellValue(row.getCell(5));
                    String testobjName = ExcelUtil.getCellValue(row.getCell(6));
                    String serialPort = ExcelUtil.getCellValue(row.getCell(7));
                    String tableAdrr = ExcelUtil.getCellValue(row.getCell(8));
                    String statusStr = ExcelUtil.getCellValue(row.getCell(9));
                    if (!StringUtils.isEmpty(statusStr)) {
                        if("离线".equals(statusStr)){
                            status = 0;
                        }if("连接正常".equals(statusStr)){
                            status = 1;
                        }if("连接异常".equals(statusStr)){
                            status = 2;
                        }
                        coltors.setStatus(status);
                    }
                    coltors.setColtorName(coltorName);
                    coltors.setColtorType(coltorType);
                    coltors.setSysNumber(sysNumber);
                    coltors.setCode(code);
                    coltors.setInstalltionName(installtionName);
                    coltors.setInstalltionCode(installtionCode);
                    coltors.setTestobjName(testobjName);
                    coltors.setSerialPort(serialPort);
                    coltors.setTableAdrr(tableAdrr);
                    coltorsService.save(coltors);
                }

            }
            ret.put("type","success");
            ret.put("msg","导入成功");
        }catch (Exception e){
            e.printStackTrace();
            ret.put("type","error");
            ret.put("msg","导入异常");
        }
        return ret;
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
        font.setFontHeightInPoints((short) 13);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        titleRow.createCell(0).setCellValue("采集器名称");
        titleRow.createCell(1).setCellValue("采集器型号");
        titleRow.createCell(2).setCellValue("系统编号");
        titleRow.createCell(3).setCellValue("编码");
        titleRow.createCell(4).setCellValue("安装位置名称");
        titleRow.createCell(5).setCellValue("安装位置编号");
        titleRow.createCell(6).setCellValue("监测对象名称");
        titleRow.createCell(7).setCellValue("串口号");
        titleRow.createCell(8).setCellValue("表地址 ");
        titleRow.createCell(9).setCellValue("连接状态");
        for(int i=0;i<10;i++){
            titleRow.setRowStyle(style);
            sheet.setColumnWidth(i,width);
        }
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "采集配置表模板";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String fileName = new String(filename.getBytes(), "iso8859-1") + df.format(new Date()) + ".xls";
        response.setHeader("Content-disposition", "attachment; filename="+fileName);;
        response.setContentType("application/msexcel");
        workbook.write(outputStream);
        outputStream.close();
    }

}
