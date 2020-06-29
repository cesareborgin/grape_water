package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Area;
import grape.domain.Department;
import grape.domain.Energy;
import grape.service.IAreaService;
import grape.service.IDepartmentService;
import grape.service.IEnergyService;
import grape.utils.DateUtils;
import grape.utils.ExcelUtil;
import net.sf.json.JSONArray;
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
@RequestMapping("/energy")
public class EnergyController {
    private final static String XLS = "xls";
    private final static String XLSX = "xlsx";
    //折碳、能耗等价标准各个地方不同
    private static final Double paySta = 0.61 ;//电价
    private static final Double coalSta = 0.41;//折煤碳标准，0.1229千克标煤百/千瓦时、1.229吨标煤/万度，所以1度=0.1229千克煤kg
    private static final Double co2Sta = 0.99;//折CO2单位排放kg
    //excel默认宽度；
    private static int width = 300 * 20;
    //默认字体
    private static String excelfont = "宋体";
    @Autowired
    private IEnergyService energyService;
    @Autowired
    private IAreaService areaService;
    @Autowired
    private IDepartmentService departmentService;
    @RequestMapping("/findAll.do")
    public ModelAndView getAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "12") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Energy> list = energyService.findList(page,size);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("list",list);
        mv.addObject("pageInfo",pageInfo);
        List<Area> areas = areaService.getAll();
        mv.addObject("areaList",areas);
        mv.addObject("areasJson",JSONArray.fromObject(areas));
        List<Department> departments = departmentService.findALl();
        mv.addObject("departList",departments);
        mv.setViewName("analysis-list");
        return mv;
    }

    @RequestMapping("/delete.do")
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true) String ids){
        Map<String,String> map = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        try {
            for(int i=0;i<idsStr.length;i++){
                energyService.deleteById(Integer.parseInt(idsStr[i]));
            }
            map.put("type","success");
        }catch (Exception e){
            e.printStackTrace();
            map.put("type","error");
        }
        return map;
    }
    @RequestMapping("/getAreas.do")
    public ModelAndView getlist()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Area> areas = areaService.getAll();
        mv.addObject("areaList",areas);
        mv.addObject("areasJson",JSONArray.fromObject(areas));
        mv.setViewName("analysis-list");
        return mv;
    }

    //新增能耗信息
    @RequestMapping(value = "/addEnergy.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> addEnergy(Energy energy)throws Exception{
        Map<String,String> ret = new HashMap<String, String>();
        if(energyService.add(energy)>0){
            ret.put("type","success");
            ret.put("msg","新建成功！");
        }else {
            ret.put("type","error");
            ret.put("msg","内部出错，新增失败！");
        }
        return ret;
    }

    //删除单条记录
    @RequestMapping(value = "/deleteById.do",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,String> deleteById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        Map<String,String> ret = new HashMap<String, String>();
        if(id==null){
            ret.put("type","error");
            ret.put("msg","您选择的ID(主键)为空！");
        }else if(energyService.deleteById(id)>0){
            ret.put("type","success");
            ret.put("msg","删除成功!");
        }else {
            ret.put("type","error");
            ret.put("msg","删除失败！");
        }
        return ret;
    }

    @RequestMapping(value = "/findById.do",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Energy> findById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        Map<String,Energy> ret = new HashMap<String,Energy>();
        Energy energy = energyService.findById(id);
        ret.put("success",energy);
        return ret;
    }

    @RequestMapping(value = "/edit.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> edit(Energy energy)throws Exception{
        Map<String,String> ret = new HashMap<String, String>();
        if(StringUtils.isEmpty(energy.getEnergyLocal())){
            ret.put("type","error");
            ret.put("msg","区域名称是空值");
        }
        if(StringUtils.isEmpty(energy.getEnergyCode())){
            ret.put("type","error");
            ret.put("msg","区域代码是空值");
        }
        int result = energyService.update(energy);
        if(result<0){
            ret.put("type","success");
            ret.put("msg","能耗修改失败！");
        }else {
            ret.put("type","success");
            ret.put("msg","能耗修改成功！");
        }
        return ret;
    }

    @RequestMapping(value = "/getlist.do",method = RequestMethod.POST)
    public ModelAndView findlist(@RequestParam(name = "beginTime",required = true) String date1, @RequestParam(name = "endTime",required = true) String date2)throws Exception{
        ModelAndView mv = new ModelAndView();
        Date beginTime = DateUtils.string2Date(date1,"yyyy-MM-dd HH:mm");
        Date endTime = DateUtils.string2Date(date2,"yyyy-MM-dd HH:mm");
        List<Energy> list = energyService.getlist(beginTime,endTime);
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("timelist",list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("analysis-list");
        return mv;
    }

    @RequestMapping(value = "/outExcel.do",method =RequestMethod.GET)
    public void outExcel(HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<Energy> list = energyService.findAll();
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("系统耗能详情");
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
        titleRow.createCell(0).setCellValue("表单ID");
        titleRow.createCell(1).setCellValue("时间");
        titleRow.createCell(2).setCellValue("区域名称");
        titleRow.createCell(3).setCellValue("区域码");
        titleRow.createCell(4).setCellValue("耗电总量(kw.h)");
        titleRow.createCell(5).setCellValue("费用(元)");
        titleRow.createCell(6).setCellValue("折标准煤（kg）");
        titleRow.createCell(7).setCellValue("折CO2排放量(kg）");
        for (int i=1;i<8;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        //将数据存入表格中
        for(Energy energy:list){
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum()+1);
            dataRow.createCell(0).setCellValue(energy.getId());
            dataRow.createCell(1).setCellValue(energy.getEnergyTimeStr());
            dataRow.createCell(2).setCellValue(energy.getEnergyLocal());
            dataRow.createCell(3).setCellValue(energy.getEnergyCode());
            dataRow.createCell(4).setCellValue(energy.getEnergyElec());
            dataRow.createCell(5).setCellValue(energy.getEnergyPay());
            dataRow.createCell(6).setCellValue(energy.getEnergyCoal());
            dataRow.createCell(7).setCellValue(energy.getEnergyCO2());
            for(int i=1;i<8;i++){
                dataRow.setRowStyle(style);
            }
        }
        //输出文件
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "能耗表";
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
        font.setFontHeightInPoints((short) 13);
        style.setFont(font);
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
        titleRow.createCell(0).setCellValue("监测时间");
        titleRow.createCell(1).setCellValue("区域名称");
        titleRow.createCell(2).setCellValue("区域代码");
        titleRow.createCell(3).setCellValue("耗电值（kw.h）");
        for(int i=0;i<4;i++){
            titleRow.setRowStyle(style);
            sheet.setColumnWidth(i,width);
        }
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "能耗详情表模板";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String fileName = new String(filename.getBytes(), "iso8859-1") + df.format(new Date()) + ".xls";
        response.setHeader("Content-disposition", "attachment; filename="+fileName);;
        response.setContentType("application/msexcel");
        workbook.write(outputStream);
        outputStream.close();
    }

    //导入文件
    @RequestMapping(value = "/importExcel.do",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> inputExcel(@RequestParam(name = "inputFile",required = true) MultipartFile inputFile)throws Exception{
        Map<String,String> ret = new HashMap<String, String>();
        Workbook workbook = null;
        String fileName = inputFile.getOriginalFilename();
        if(fileName.endsWith(XLS)){
            workbook = new HSSFWorkbook(inputFile.getInputStream());
        }else if(fileName.endsWith(XLSX)){
            workbook = new XSSFWorkbook(inputFile.getInputStream());
        }else {
            ret.put("type","error");
            ret.put("msg","选择正确的文件格式！");
        }
        Sheet sheet = workbook.getSheet("Sheet1");
        int rows = sheet.getLastRowNum();
        if(rows==0){
            ret.put("type","error");
            ret.put("msg","请填写数据！");
        }
        for(int i=1;i<=rows+1;i++){
            Row row = sheet.getRow(i);
            if(row!=null){
                Energy energy = new Energy();
                String energyTimeStr = ExcelUtil.getCellValue(row.getCell(0));
                if(!StringUtils.isEmpty(energyTimeStr)){
                    Date energyTime = DateUtils.string2Date(energyTimeStr,"yyyy-MM-dd HH:mm");
                    energy.setEnergyTime(energyTime);
                }
                String energyLocal = ExcelUtil.getCellValue(row.getCell(1));
                energy.setEnergyLocal(energyLocal);
                String energyCode = ExcelUtil.getCellValue(row.getCell(2));
                energy.setEnergyCode(energyCode);
                String energyElecStr = ExcelUtil.getCellValue(row.getCell(3));
                if(!StringUtils.isEmpty(energyElecStr)){
                    Double energyElec = Double.parseDouble(energyElecStr);
                    energy.setEnergyElec(energyElec);
                    Double energyPay = energyElec*paySta;
                    energy.setEnergyPay(energyPay);
                    Double energyCoal = energyElec*coalSta;
                    energy.setEnergyCoal(energyCoal);
                    Double energyCO2 = energyElec*co2Sta;
                    energy.setEnergyCO2(energyCO2);
                }
                energyService.add(energy);
            }
            ret.put("type","success");
            ret.put("msg","导入成功");
        }
        return ret;
    }
}
