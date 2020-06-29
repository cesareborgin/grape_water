package grape.service;

import grape.domain.Department;

import java.util.List;

public interface IDepartmentService {
    public Integer add(Department department)throws Exception;

    public List<Department> getAll(Integer page,Integer size)throws Exception;

    public Integer delete(Integer id)throws Exception;

    public Integer update(Department department)throws Exception;

    public List<Department> search(String departNameStr)throws Exception;

    public List<Department> findALl()throws Exception;


}
