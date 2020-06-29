package grape.domain;

import grape.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Motors {
    private Integer id;//主键
    private String modelCode;//系统编号
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date testTime;
    private String timeStr;
    private String inName;//内部名称
    private String location;//安装地址
    private Double voltage;//电压
    private Double electricity;//电流
    private Double inputPower;//输入功率
    private Double outputPower;//输入功率
    private Double operateEfficiency;//运行效率
    private Double energyUnit;//系统耗能单位
    private Double energyUsed;//当天累计耗能情况

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModelCode() {
        return modelCode;
    }

    public void setModelCode(String modelCode) {
        this.modelCode = modelCode;
    }

    public Date getTestTime() {
        return testTime;
    }

    public void setTestTime(Date testTime) {
        this.testTime = testTime;
    }

    public String getTimeStr() {
        if(testTime!=null){
            timeStr = DateUtils.date2String(testTime,"yyyy-MM-dd HH:mm");
        }
        return timeStr;
    }

    public void setTimeStr(String timeStr) {
        this.timeStr = timeStr;
    }

    public String getInName() {
        return inName;
    }

    public void setInName(String inName) {
        this.inName = inName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Double getVoltage() {
        return voltage;
    }

    public void setVoltage(Double voltage) {
        this.voltage = voltage;
    }

    public Double getElectricity() {
        return electricity;
    }

    public void setElectricity(Double electricity) {
        this.electricity = electricity;
    }

    public Double getInputPower() {
        return inputPower;
    }

    public void setInputPower(Double inputPower) {
        this.inputPower = inputPower;
    }

    public Double getOutputPower() {
        return outputPower;
    }

    public void setOutputPower(Double outputPower) {
        this.outputPower = outputPower;
    }

    public Double getOperateEfficiency() {
        return operateEfficiency;
    }

    public void setOperateEfficiency(Double operateEfficiency) {
        this.operateEfficiency = operateEfficiency;
    }

    public Double getEnergyUnit() {
        return energyUnit;
    }

    public void setEnergyUnit(Double energyUnit) {
        this.energyUnit = energyUnit;
    }

    public Double getEnergyUsed() {
        return energyUsed;
    }

    public void setEnergyUsed(Double energyUsed) {
        this.energyUsed = energyUsed;
    }
}
