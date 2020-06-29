package grape.domain;

import grape.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Repumps {
    private Integer id;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date monitorfirstDate;//初次监测时间段
    private String date1Str;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date monitorsecondDate;//监测时间段
    private String date2Str;
    private String monitorsTime;
    private String modelCode;//泵系统编号
    private Double inletPressure;//入口压力
    private Double outletPressure;//出口压力
    private Double temperature;//进出口温差
    private Double headDelivery;//扬程
    private Double rateFlow;//实际流量
    private Double operateEfficiency;//运行效率
    private Double transferEfficiency;//传输效率
    private Double suctionHeight;//吸水高度
    private Double drainageHeight;//排水高度
    private Double craftPressure;//工艺所需的压力
    private Double backwaterPressure;//系统回水末端压力
    private Double potentialDifference;//表位差

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getMonitorfirstDate() {
        return monitorfirstDate;
    }

    public void setMonitorfirstDate(Date monitorfirstDate) {
        this.monitorfirstDate = monitorfirstDate;
    }

    public Date getMonitorsecondDate() {
        return monitorsecondDate;
    }

    public void setMonitorsecondDate(Date monitorsecondDate) {
        this.monitorsecondDate = monitorsecondDate;
    }

    public String getMonitorsTime() {
        if(monitorfirstDate!=null||monitorsecondDate!=null){
            String sf = DateUtils.date2String(monitorfirstDate,"yyyy-MM-dd HH:mm");
            String sd = DateUtils.date2String(monitorsecondDate,"yyyy-MM-dd HH:mm");
            monitorsTime = sf+"-"+sd;
        }
        return monitorsTime;
    }

    public void setMonitorsTime(String monitorsTime) {
        this.monitorsTime = monitorsTime;
    }

    public String getModelCode() {
        return modelCode;
    }

    public void setModelCode(String modelCode) {
        this.modelCode = modelCode;
    }

    public Double getInletPressure() {
        return inletPressure;
    }

    public void setInletPressure(Double inletPressure) {
        this.inletPressure = inletPressure;
    }

    public Double getOutletPressure() {
        return outletPressure;
    }

    public void setOutletPressure(Double outletPressure) {
        this.outletPressure = outletPressure;
    }

    public Double getTemperature() {
        return temperature;
    }

    public void setTemperature(Double temperature) {
        this.temperature = temperature;
    }

    public Double getHeadDelivery() {
        return headDelivery;
    }

    public void setHeadDelivery(Double headDelivery) {
        this.headDelivery = headDelivery;
    }

    public Double getRateFlow() {
        return rateFlow;
    }

    public void setRateFlow(Double rateFlow) {
        this.rateFlow = rateFlow;
    }

    public Double getOperateEfficiency() {
        return operateEfficiency;
    }

    public void setOperateEfficiency(Double operateEfficiency) {
        this.operateEfficiency = operateEfficiency;
    }

    public Double getTransferEfficiency() {
        return transferEfficiency;
    }

    public void setTransferEfficiency(Double transferEfficiency) {
        this.transferEfficiency = transferEfficiency;
    }

    public Double getSuctionHeight() {
        return suctionHeight;
    }

    public void setSuctionHeight(Double suctionHeight) {
        this.suctionHeight = suctionHeight;
    }

    public Double getDrainageHeight() {
        return drainageHeight;
    }

    public void setDrainageHeight(Double drainageHeight) {
        this.drainageHeight = drainageHeight;
    }

    public Double getCraftPressure() {
        return craftPressure;
    }

    public void setCraftPressure(Double craftPressure) {
        this.craftPressure = craftPressure;
    }

    public Double getBackwaterPressure() {
        return backwaterPressure;
    }

    public void setBackwaterPressure(Double backwaterPressure) {
        this.backwaterPressure = backwaterPressure;
    }

    public Double getPotentialDifference() {
        return potentialDifference;
    }

    public void setPotentialDifference(Double potentialDifference) {
        this.potentialDifference = potentialDifference;
    }

    public String getDate1Str() {
        if(monitorfirstDate!=null){
            date1Str = DateUtils.date2String(monitorfirstDate,"yyyy-MM-dd HH:mm");
        }
        return date1Str;
    }

    public void setDate1Str(String date1Str) {
        this.date1Str = date1Str;
    }

    public String getDate2Str() {
        if (monitorsecondDate!=null){
            date2Str =  DateUtils.date2String(monitorsecondDate,"yyyy-MM-dd HH:mm");
        }
        return date2Str;
    }

    public void setDate2Str(String date2Str) {
        this.date2Str = date2Str;
    }
}
