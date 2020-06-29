package grape.domain;

import grape.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Caution {
    private Integer id;//序号
    private String objName;//检测对象
    private String targetType;//指标类型
    private Integer alarmLevel;//越限级别
    private String alarmStr;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;//首发时间
    private String startStr;
    private Double durationTime;//持续时间
    private Integer status;//状态分为已恢复和未恢复
    private String statusStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getObjName() {
        return objName;
    }

    public void setObjName(String objName) {
        this.objName = objName;
    }

    public String getTargetType() {
        return targetType;
    }

    public void setTargetType(String targetType) {
        this.targetType = targetType;
    }

    public Integer getAlarmLevel() {
        return alarmLevel;
    }

    public void setAlarmLevel(Integer alarmLevel) {
        this.alarmLevel = alarmLevel;
    }

    public String getAlarmStr() {
        if(alarmLevel==0){
            alarmStr = "告警（A级）";
        }else if(alarmLevel==1){
            alarmStr = "告警（B级）";
        }else if(alarmLevel==2){
            alarmStr = "告警（C级）";
        }else if(alarmLevel==3){
            alarmStr = "告警（D级）";
        }else if(alarmLevel==4){
            alarmStr = "预警（A级）";
        }else if(alarmLevel==5){
            alarmStr = "预警（B级）";
        }else if(alarmLevel==6){
            alarmStr = "预警（C级）";
        }else if(alarmLevel==7){
            alarmStr = "预警（D级）";
        }
        return alarmStr;
    }

    public void setAlarmStr(String alarmStr) {
        this.alarmStr = alarmStr;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getStartStr() {
        if(startTime!=null){
            startStr = DateUtils.date2String(startTime,"yyyy-MM-dd");
        }
        return startStr;
    }

    public void setStartStr(String startStr) {
        this.startStr = startStr;
    }

    public Double getDurationTime() {
        return durationTime;
    }

    public void setDurationTime(Double durationTime) {
        this.durationTime = durationTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStatusStr() {
        if(status==1){
            statusStr = "未恢复";
        }else if(status==2){
            statusStr = "已恢复";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }
}
