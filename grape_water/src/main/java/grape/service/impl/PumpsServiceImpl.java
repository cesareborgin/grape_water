package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IPumpsDao;

import grape.domain.Pumps;
import grape.service.IPumpsService;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Service
@Transactional
public class PumpsServiceImpl implements IPumpsService {
    private final static String XLS = "xls";
    private final static String XLSX = "xlsx";
    @Autowired
    private IPumpsDao pumpsDao;
    public void save(Pumps pumps) throws Exception {
        pumpsDao.save(pumps);
    }

    public List<Pumps> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return pumpsDao.findAll();
    }

    public List<Pumps> findByName(String searchName, Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return pumpsDao.searchList(searchName);
    }

    public void update(Pumps pumps) throws Exception {
        pumpsDao.update(pumps);
    }

    public void deleteById(Integer id) throws Exception {
        pumpsDao.deleteById(id);
    }

    public Pumps findById(Integer id) throws Exception {
        return pumpsDao.findById(id);
    }

    public List<Pumps> getAll() throws Exception {
        return pumpsDao.findAll();
    }
    public Integer importExcel(MultipartFile InputFile) throws Exception {
        //获取文件名称
        Workbook workbook = null;
        String fileName = InputFile.getOriginalFilename();
        if(fileName.endsWith(XLS)){
            //2003
            workbook = new HSSFWorkbook(InputFile.getInputStream());
        }else if(fileName.endsWith(XLSX)){
            workbook = new XSSFWorkbook(InputFile.getInputStream());
        }else {
            throw new Exception("文件不是Excel文件");
        }
        Sheet sheet = workbook.getSheet("Sheet1");
        // 指的行数，一共有多少行+
        int rows = sheet.getLastRowNum();
        if(rows==0){
            throw new Exception("请填写数据");
        }
        for(int i=1;i<=rows+1;i++){
            // 读取左上端单元格
            Row row = sheet.getRow(i);
            //行不能为空
            if(row!=null){
                Pumps pumps = new Pumps();
                //内部名称
                String inernalName = getCellValue(row.getCell(0));
                pumps.setInernalName(inernalName);
                //设备型号
                String modelType = getCellValue(row.getCell(1));
                pumps.setModelType(modelType);
                //配套电机功率
                String mtopStr = getCellValue(row.getCell(2));
                if(!StringUtils.isEmpty(mtopStr)){
                    Double mtop = Double.valueOf(mtopStr.toString());
                    pumps.setMTOP(mtop);
                }
                //流量
                String rofStr = getCellValue(row.getCell(3));
                if(!StringUtils.isEmpty(rofStr)){
                    Double rof = Double.valueOf(rofStr.toString());
                    pumps.setROF(rof);
                }
                //额定电流
                String eletricityStr = getCellValue(row.getCell(4));
                if(!StringUtils.isEmpty(eletricityStr)){
                    Double eletricity = Double.valueOf(eletricityStr.toString());
                    pumps.setElectricity(eletricity);
                }
                //额定电压
                String voltageStr = getCellValue(row.getCell(5));
                if(!StringUtils.isEmpty(voltageStr)){
                    Double voltage = Double.valueOf(voltageStr.toString());
                    pumps.setVoltage(voltage);
                }
                //额定效率
                String efficiencyStr = getCellValue(row.getCell(6));
                if(!StringUtils.isEmpty(efficiencyStr)){
                    Integer efficiency = Integer.parseInt(efficiencyStr);
                    pumps.setEfficiency(efficiency);
                }
                //额定轴功率
                String shaftStr = getCellValue(row.getCell(7));
                if(!StringUtils.isEmpty(shaftStr)){
                    Double shaft = Double.valueOf(shaftStr.toString());
                    pumps.setShaft(shaft);
                }
                String dgatStr = getCellValue(row.getCell(8));
                if(!StringUtils.isEmpty(dgatStr)){
                    Integer dgat = Integer.parseInt(dgatStr);
                    pumps.setDGAT(dgat);
                }
                //排出口径
                String sgatStr = getCellValue(row.getCell(9));
                if(!StringUtils.isEmpty(sgatStr)){
                    Integer sgat = Integer.parseInt(sgatStr);
                    pumps.setSGAT(sgat);
                }
                //转速
                String revStr = getCellValue(row.getCell(10));
                if(!StringUtils.isEmpty(revStr)){
                    Integer rev = Integer.parseInt(revStr);
                    pumps.setREV(rev);
                }
                //额定扬程
                String hodlStr = getCellValue(row.getCell(11));
                if(!StringUtils.isEmpty(hodlStr)){
                    Integer hodl = Integer.parseInt(hodlStr);
                    pumps.setHODL(hodl);
                }
                //防护等级
                String loft = getCellValue(row.getCell(12));
                pumps.setLOFT(loft);

                pumpsDao.save(pumps);
            }
        }
        return rows-1;
    }
    public  String getCellValue(Cell cell) {
        String value = "";
        if (cell != null) {
            // 以下是判断数据的类型
            switch (cell.getCellType()) {
                case HSSFCell.CELL_TYPE_NUMERIC: // 数字
                    value = cell.getNumericCellValue() + "";
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                        Date date = cell.getDateCellValue();
                        if (date != null) {
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                            value = sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue())).toString();
                        } else {
                            value = "";
                        }
                    } else {
                        value = new DecimalFormat("#.##").format(cell.getNumericCellValue());
                    }
                    break;
                case HSSFCell.CELL_TYPE_STRING: // 字符串
                    value = cell.getStringCellValue();
                    break;
                case HSSFCell.CELL_TYPE_BOOLEAN: // Boolean
                    value = cell.getBooleanCellValue() + "";
                    break;
                case HSSFCell.CELL_TYPE_FORMULA: // 公式
                    value = cell.getCellFormula() + "";
                    break;
                case HSSFCell.CELL_TYPE_BLANK: // 空值
                    value = "";
                    break;
                case HSSFCell.CELL_TYPE_ERROR: // 故障
                    value = "非法字符";
                    break;
                default:
                    value = "未知类型";
                    break;
            }
        }
        return value.trim();
    }

}
