package grape.controller;


import grape.controller.enums.UploadFileTypeEnum;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import static grape.common.Constants.FILE_PRE_URL;

@Controller
@RequestMapping("/output")
public class UploadFileController {
    //上传图片
    @RequestMapping(value="/uploadFile.do",method=RequestMethod.POST)
    @ResponseBody
    public Map<String, String> uploadPhoto(@RequestParam(name = "myfile",required = true) MultipartFile photo,
                                           HttpServletRequest request,
                                           HttpServletResponse response
    ) throws IOException{
        Map<String, String> ret = new HashMap<String, String>();
        if(photo == null){
            //文件没有选择
            ret.put("type", "error");
            ret.put("msg", "请选择文件！");
            return ret;
        }
        if(photo.getSize() > 104857600){
            //文件没有选择
            ret.put("type", "error");
            ret.put("msg", "文件大小超过10M，请上传小于10M的图片！");
            return ret;
        }
        String suffix = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf(".") + 1,photo.getOriginalFilename().length());
        if(!"jpg,png,gif,jpeg".contains(suffix.toLowerCase())){
            ret.put("type", "error");
            ret.put("msg", "文件格式不正确，请上传jpg,png,gif,jpeg格式的图片！");
            return ret;
        }
        ServletContext sc = request.getSession().getServletContext();
        String type = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf(".") + 1, photo.getOriginalFilename().length());
        String fileName = null;
        UploadFileTypeEnum uploadFileTypeEnum = UploadFileTypeEnum.getFileEnumByType(type);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
        Random r = new Random();
        StringBuilder tempName = new StringBuilder();
        tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(".").append(type);
        fileName = tempName.toString();

        String dir = sc.getRealPath("/upload");
        FileUtils.writeByteArrayToFile(new File(dir, fileName), photo.getBytes());
        //返回文件的全路径
        StringBuilder fileUrl = new StringBuilder();
        fileUrl.append(FILE_PRE_URL).append("/upload/").append(fileName);

        File savePathFile = new File(dir);
        if(!savePathFile.exists()){
            savePathFile.mkdir();//如果不存在，则创建一个文件夹upload
        }
        //把文件转存到这个文件夹下
        photo.transferTo(new File(dir + fileName ));
        ret.put("type", "success");
        ret.put("msg", "图片上传成功！");
        ret.put("url", fileUrl.toString());
        return ret;
    }
}
