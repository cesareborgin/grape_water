package grape.controller;

import com.github.pagehelper.PageInfo;
import grape.domain.Caution;
import grape.domain.Coltors;
import grape.domain.Pumps;
import grape.service.ICautionService;
import grape.service.IPumpsService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
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
@RequestMapping("/pumps")
public class PumpsController {
    //excel默认宽度；
    private static int width = 300 * 20;
    //默认字体
    private static String excelfont = "宋体";
    @Autowired
    private IPumpsService pumpsService;
    @Autowired
    private ICautionService cautionService;
    @RequestMapping("/findAll.do")
    public ModelAndView list(@RequestParam(name = "page",required = true,defaultValue = "1" ) Integer page, @RequestParam(name = "size", required = true, defaultValue = "12") Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Pumps> pumpsList = pumpsService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(pumpsList);
        mv.addObject("pumpsList",pumpsList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("pumps-list");
        return mv;
    }

    @RequestMapping("/pumps-add.do")
    public ModelAndView toAdd()throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pumps-add");
        return mv;
    }
    @RequestMapping("/save.do")
    public String save(Pumps pumps)throws Exception{
        pumpsService.save(pumps);
        return "redirect:findAll.do";
    }

    @RequestMapping("/editGo.do")
    public ModelAndView editGo(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        ModelAndView mv= new ModelAndView();
        Pumps pumps = pumpsService.findById(id);
        mv.addObject("pumps",pumps);
        mv.setViewName("pumps-edit");
        return mv;
    }

    //查询
    @RequestMapping(value = "/findByName.do",method = RequestMethod.POST)
    public ModelAndView findByName(@RequestParam(name = "searchName",required = true) String name,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size", required = true, defaultValue = "12")Integer size)throws Exception{
        ModelAndView mv = new ModelAndView();
        List<Pumps> pumpsList = pumpsService.findByName(name,page,size);
        PageInfo pageInfo = new PageInfo(pumpsList);
        mv.addObject("searchList",pumpsList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("pumps-list");
        return mv;
    }

    //单条记录删除
    @RequestMapping("/deleteById.do")
    public String deleteById(@RequestParam(name = "id",required = true) Integer id)throws Exception{
        pumpsService.deleteById(id);
        return "redirect:findAll.do";
    }
    @RequestMapping("/delete.do")
    @ResponseBody
    public Map<String,String> delete(@RequestParam(name = "ids",required = true) String ids){
        Map<String,String> map = new HashMap<String, String>();
        String[] idsStr = ids.split(",");
        try {
            for(int i=0;i<idsStr.length;i++){
                pumpsService.deleteById(Integer.parseInt(idsStr[i]));
            }
            map.put("type","success");
        }catch (Exception e){
            e.printStackTrace();
            map.put("type","error");
        }
        return map;
    }
    //修改
    @RequestMapping(value = "/edit.do",method = RequestMethod.POST)
    public String update(Pumps pumps)throws Exception{
        pumpsService.update(pumps);
        return "redirect:findAll.do";
    }
    //导出全部采集器
    @RequestMapping(value = "/exportExcel.do",method = RequestMethod.GET)
    public void exportExcel(HttpServletResponse response) throws Exception{
        response.setCharacterEncoding("UTF-8");
        List<Pumps> list = pumpsService.getAll();
        //System.out.println(list);
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("水泵台账信息表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        HSSFCellStyle style = wb.createCellStyle();
        HSSFFont font = wb.createFont();
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
        titleRow.createCell(1).setCellValue("设备内部名称");
        titleRow.createCell(2).setCellValue("设备型号");
        titleRow.createCell(3).setCellValue("配置的电机功率(kw)");
        titleRow.createCell(4).setCellValue("水泵流量(m³/h)");
        titleRow.createCell(5).setCellValue("配置的电机电流(A)");
        titleRow.createCell(6).setCellValue("配置的电机电压(V)");
        titleRow.createCell(7).setCellValue("泵额定效率(%)");
        titleRow.createCell(8).setCellValue("轴功率(kw)");
        titleRow.createCell(9).setCellValue("排出口径(mm)");
        titleRow.createCell(10).setCellValue("吸入口径(mm) ");
        titleRow.createCell(11).setCellValue("转速(r/min)");
        titleRow.createCell(12).setCellValue("扬程(m)");
        titleRow.createCell(13).setCellValue("防护等级");
        for(int i=1;i<14;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        //遍历将数据放到excel
        for(Pumps pumps:list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            for(int i=1;i<14;i++){
                dataRow.setRowStyle(style);
            }
            dataRow.createCell(0).setCellValue(pumps.getId());
            dataRow.createCell(1).setCellValue(pumps.getInernalName());
            dataRow.createCell(2).setCellValue(pumps.getModelType());
            dataRow.createCell(3).setCellValue(pumps.getMTOP());
            dataRow.createCell(4).setCellValue(pumps.getROF());
            dataRow.createCell(5).setCellValue(pumps.getElectricity());
            dataRow.createCell(6).setCellValue(pumps.getVoltage());
            dataRow.createCell(7).setCellValue(pumps.getEfficiency());
            dataRow.createCell(8).setCellValue(pumps.getShaft());
            dataRow.createCell(9).setCellValue(pumps.getDGAT());
            dataRow.createCell(10).setCellValue(pumps.getSGAT());
            dataRow.createCell(11).setCellValue(pumps.getREV());
            dataRow.createCell(12).setCellValue(pumps.getHODL());
            dataRow.createCell(13).setCellValue(pumps.getLOFT());
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
    //导入表格数据表
    @RequestMapping(value = "/importExcel.do",method = RequestMethod.POST)
    public String importExcel(@RequestParam(value = "InputFile",required = true) MultipartFile InputFile){
        try {
            Integer result = pumpsService.importExcel(InputFile);
        }catch (Exception e){
            System.out.println("内部错误，导入失败");
            return "redirect:findAll.do";
        }
        System.out.println("导入成功！");
        return "redirect:findAll.do";
    }

    //下载导入表的模板
    @RequestMapping(value = "/downloadModel.do",method = RequestMethod.GET)
    public void getModal(HttpServletResponse response)throws Exception{
        response.setCharacterEncoding("UTF-8");
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("Sheet1");
        HSSFRow titleRow = sheet.createRow(0);
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
        titleRow.createCell(0).setCellValue("设备内部名称");
        titleRow.createCell(1).setCellValue("设备型号");
        titleRow.createCell(2).setCellValue("配置电机功率(kw)");
        titleRow.createCell(3).setCellValue("泵额定流量(m³/h)");
        titleRow.createCell(4).setCellValue("配置电机电流(A)");
        titleRow.createCell(5).setCellValue("配置电机电压(V)");
        titleRow.createCell(6).setCellValue("泵额定效率(%)");
        titleRow.createCell(7).setCellValue("轴功率(kw)");
        titleRow.createCell(8).setCellValue("排出口径(mm)");
        titleRow.createCell(9).setCellValue("吸入口径(mm) ");
        titleRow.createCell(10).setCellValue("转速(r/min)");
        titleRow.createCell(11).setCellValue("扬程(m)");
        titleRow.createCell(12).setCellValue("防护等级");
        for(int i=0;i<13;i++){
            sheet.setColumnWidth(i,width);
            titleRow.setRowStyle(style);
        }
        OutputStream outputStream = response.getOutputStream();
        response.reset();
        String filename = "水泵台账表模板";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String fileName = new String(filename.getBytes(), "iso8859-1") + df.format(new Date()) + ".xls";
        response.setHeader("Content-disposition", "attachment; filename="+fileName);;
        response.setContentType("application/msexcel");
        workbook.write(outputStream);
        outputStream.close();
    }
}
