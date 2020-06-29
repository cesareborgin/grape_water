package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IColtorsDao;
import grape.domain.Coltors;
import grape.service.IColtorsService;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("coltorsService")
@Transactional
public class ColtorsServiceImpl implements IColtorsService {
    @Autowired
    private IColtorsDao coltorsDao;
    public List<Coltors> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return coltorsDao.findAll();
    }

    public void save(Coltors coltors) throws Exception {
        coltorsDao.save(coltors);
    }

    public List<Coltors> findByColorName(String searchName,Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return coltorsDao.searchList(searchName);
    }

    public void deleteById(Integer id) throws Exception {
        coltorsDao.deleteById(id);
    }

    public Coltors findById(Integer id) throws Exception {
        return coltorsDao.findById(id);
    }

    public int update(Coltors coltors) throws Exception {
        return coltorsDao.update(coltors);
    }

    public List<Coltors> getAll() throws Exception{
        return coltorsDao.findAll();
    }

    public Integer getStatusA() throws Exception {
        return coltorsDao.getStatusA();
    }

    public Integer getStatusB() throws Exception {
        return coltorsDao.getStatusB();
    }

    public Integer getStatusC() throws Exception {
        return coltorsDao.getStatusC();
    }

    public Integer getStatusD() throws Exception {
        return coltorsDao.getStatusD();
    }

    public int sum() throws Exception {
        return coltorsDao.sum();
    }

}
