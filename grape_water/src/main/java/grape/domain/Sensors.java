package grape.domain;

import grape.utils.DateUtils;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Sensors {
    private Integer id;//序号
    private String sensorsName;//传感器名称
    private String sensorsType;//传感器型号
    private String installtionAddr;//安装地址
    private String precision;//精度
    private Integer baudRate;//波特率

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date lastTime;//上次检定时间
    private String lastTimeStr;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date nextTime;//下次检定日期
    private String nextTimeStr;
    private Integer pressureGrade;//压力等级
    private String  pressureGradeStr;//压力等级描述
    private Integer tempGrade;//温度等级
    private String tempGradeStr;
    private String prl;//防护等级
    private Integer status;//连接状态
    private String statusStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public String getSensorsName() {
        return sensorsName;
    }

    public void setSensorsName(String sensorsName) {
        this.sensorsName = sensorsName;
    }

    public String getSensorsType() {
        return sensorsType;
    }

    public void setSensorsType(String sensorsType) {
        this.sensorsType = sensorsType;
    }

    public String getInstalltionAddr() {
        return installtionAddr;
    }

    public void setInstalltionAddr(String installtionAddr) {
        this.installtionAddr = installtionAddr;
    }


    public String getPrecision() {
        return precision;
    }

    public void setPrecision(String precision) {
        this.precision = precision;
    }

    public Integer getBaudRate() {
        return baudRate;
    }

    public void setBaudRate(Integer baudRate) {
        this.baudRate = baudRate;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }

    public String getLastTimeStr() {
        if(lastTime!=null){
            lastTimeStr = DateUtils.date2String(lastTime,"yyyy-MM-dd");
        }
        return lastTimeStr;
    }

    public void setLastTimeStr(String lastTimeStr) {
        this.lastTimeStr = lastTimeStr;
    }

    public Date getNextTime() {
        return nextTime;
    }

    public void setNextTime(Date nextTime) {
        this.nextTime = nextTime;
    }

    public String getNextTimeStr() {
        if(nextTime!=null){
            nextTimeStr = DateUtils.date2String(nextTime,"yyyy-MM-dd");
        }
        return nextTimeStr;
    }

    public void setNextTimeStr(String nextTimeStr) {
        this.nextTimeStr = nextTimeStr;
    }

    public Integer getPressureGrade() {
        return pressureGrade;
    }

    public void setPressureGrade(Integer pressureGrade) {
        this.pressureGrade = pressureGrade;
    }

    public String getPressureGradeStr() {
        if(pressureGrade==0){
            pressureGradeStr = "低压(L)";
        }
        if(pressureGrade==1){
            pressureGradeStr = "中压(M)";
        }
        if(pressureGrade==2){
            pressureGradeStr = "高压(H)";
        }
        if(pressureGrade==3){
            pressureGradeStr = "超高压(U)";
        }
        return pressureGradeStr;
    }

    public void setPressureGradeStr(String pressureGradeStr) {
        this.pressureGradeStr = pressureGradeStr;
    }

    public Integer getTempGrade() {
        return tempGrade;
    }

    public void setTempGrade(Integer tempGrade) {
        this.tempGrade = tempGrade;
    }

    public String getTempGradeStr() {
        if(tempGrade==0){
            tempGradeStr = "A级";
        }
        if(tempGrade==1){
            tempGradeStr = "B级";
        }
        if(tempGrade==2){
            tempGradeStr = "C级";
        }
        if(tempGrade==3){
            tempGradeStr = "D级";
        }
        if(tempGrade==4){
            tempGradeStr = "E级";
        }
        if(tempGrade==5){
            tempGradeStr = "F级";
        }
        return tempGradeStr;
    }

    public void setTempGradeStr(String tempGradeStr) {
        this.tempGradeStr = tempGradeStr;
    }

    public String getPrl() {
        return prl;
    }

    public void setPrl(String prl) {
        this.prl = prl;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
    public String getStatusStr() {
        if(status==0){
            statusStr = "离线";
        }
        if(status==1){
            statusStr = "运行正常";
        }
        if(status==2){
            statusStr = "设备异常";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    @Override
    public String toString() {
        return "Sensors{" +
                "id=" + id +
                ", sensorsName='" + sensorsName + '\'' +
                ", sensorsType='" + sensorsType + '\'' +
                ", installtionAddr='" + installtionAddr + '\'' +
                ", precision='" + precision + '\'' +
                ", baudRate=" + baudRate +
                ", lastTime=" + lastTime +
                ", lastTimeStr='" + lastTimeStr + '\'' +
                ", nextTime=" + nextTime +
                ", nextTimeStr='" + nextTimeStr + '\'' +
                ", pressureGrade=" + pressureGrade +
                ", pressureGradeStr='" + pressureGradeStr + '\'' +
                ", tempGrade=" + tempGrade +
                ", tempGradeStr='" + tempGradeStr + '\'' +
                ", prl='" + prl + '\'' +
                ", status=" + status +
                ", statusStr='" + statusStr + '\'' +
                '}';
    }
}


