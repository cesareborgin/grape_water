package grape.service.impl;

import com.github.pagehelper.PageHelper;
import grape.dao.IDepartmentDao;
import grape.domain.Department;
import grape.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class DepartmentServiceImpl implements IDepartmentService {
    @Autowired
    private IDepartmentDao departmentDao;
    public Integer add(Department department) throws Exception {
        return departmentDao.add(department);
    }

    public List<Department> getAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return departmentDao.getAll();
    }

    public Integer delete(Integer id) throws Exception {
        return departmentDao.delete(id);
    }

    public Integer update(Department department) throws Exception {
        return departmentDao.edit(department);
    }

    public List<Department> search(String departNameStr) throws Exception {
        return departmentDao.search(departNameStr);
    }

    public List<Department> findALl() throws Exception {
        return departmentDao.getAll();
    }
}
