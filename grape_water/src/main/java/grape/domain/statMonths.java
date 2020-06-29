package grape.domain;

import grape.utils.DateUtils;


import java.util.Date;

//年统计中间表（存储显示的耗能数据）
public class statMonths {
    private Date monthDate;
    private String monthDateStr;
    private Double consumPower;
    private Double charge;
    private Double standardCoal;
    private Double carbon;

    public Date getMonthDate() {
        return monthDate;
    }

    public void setMonthDate(Date monthDate) {
        this.monthDate = monthDate;
    }

    public String getMonthDateStr() {
        if(monthDate!=null){
            monthDateStr = DateUtils.date2String(monthDate,"yyyy-MM");
        }
        return monthDateStr;
    }

    public void setMonthDateStr(String monthDateStr) {
        this.monthDateStr = monthDateStr;
    }

    public Double getConsumPower() {
        return consumPower;
    }

    public void setConsumPower(Double consumPower) {
        this.consumPower = consumPower;
    }

    public Double getCharge() {
        return charge;
    }

    public void setCharge(Double charge) {
        this.charge = charge;
    }

    public Double getStandardCoal() {
        return standardCoal;
    }

    public void setStandardCoal(Double standardCoal) {
        this.standardCoal = standardCoal;
    }

    public Double getCarbon() {
        return carbon;
    }

    public void setCarbon(Double carbon) {
        this.carbon = carbon;
    }
}
