package grape.domain;

import grape.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Energy {

    private Integer id;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date energyTime;//监测时间
    private String energyTimeStr;//时间
    private String energyLocal;//区域名称
    private String energyCode;//区域代码
    private Double energyElec;//耗电能
    private Double energyPay;//费用
    private Double energyCoal;//折标标准煤
    private Double energyCO2;//折CO2排量

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getEnergyTime() {
        return energyTime;
    }

    public void setEnergyTime(Date energyTime) {
        this.energyTime = energyTime;
    }

    public String getEnergyTimeStr() {
        if(energyTime!=null){
            energyTimeStr = DateUtils.date2String(energyTime,"yyyy-MM-dd HH:mm");
        }
        return energyTimeStr;
    }

    public void setEnergyTimeStr(String energyTimeSTr) {
        this.energyTimeStr = energyTimeSTr;
    }

    public String getEnergyLocal() {
        return energyLocal;
    }

    public void setEnergyLocal(String energyLocal) {
        this.energyLocal = energyLocal;
    }

    public Double getEnergyElec() {
        return energyElec;
    }

    public void setEnergyElec(Double energyElec) {
        this.energyElec = energyElec;
    }

    public Double getEnergyPay() {
        return energyPay;
    }

    public void setEnergyPay(Double energyPay) {
        this.energyPay = energyPay;
    }

    public Double getEnergyCoal() {
        return energyCoal;
    }

    public void setEnergyCoal(Double energyCoal) {
        this.energyCoal = energyCoal;
    }

    public Double getEnergyCO2() {
        return energyCO2;
    }

    public void setEnergyCO2(Double energyCO2) {
        this.energyCO2 = energyCO2;
    }

    public String getEnergyCode() {
        return energyCode;
    }

    public void setEnergyCode(String energyCode) {
        this.energyCode = energyCode;
    }

}
