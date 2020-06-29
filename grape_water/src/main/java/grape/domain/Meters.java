package grape.domain;

import java.util.Date;

//计量器
public class Meters {
    private Integer id;
    private String modelCode;//系统编号
    private String productName;//产家
    private String meterName;//名称
    private String meterType;//型号
    private String measureAccuracy;//测量精度
    private Double caliber;//口径
    private String protector;//防爆等级
    private String specification;//规格
    private String coumMethod;//通讯方式
    private String location;//安装位置
    private String locationCode;//安装位置编号
    private Integer status;//连接状态
    private String statusStr;

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

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getMeterName() {
        return meterName;
    }

    public void setMeterName(String meterName) {
        this.meterName = meterName;
    }

    public String getMeterType() {
        return meterType;
    }

    public void setMeterType(String meterType) {
        this.meterType = meterType;
    }

    public String getMeasureAccuracy() {
        return measureAccuracy;
    }

    public void setMeasureAccuracy(String measureAccuracy) {
        this.measureAccuracy = measureAccuracy;
    }

    public Double getCaliber() {
        return caliber;
    }

    public void setCaliber(Double caliber) {
        this.caliber = caliber;
    }

    public String getProtector() {
        return protector;
    }

    public void setProtector(String protector) {
        this.protector = protector;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getCoumMethod() {
        return coumMethod;
    }

    public void setCoumMethod(String coumMethod) {
        this.coumMethod = coumMethod;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocationCode() {
        return locationCode;
    }

    public void setLocationCode(String locationCode) {
        this.locationCode = locationCode;
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
        }else if(status==1){
            statusStr = "运行正常";
        }else if(status==2){
            statusStr = "设备异常";
        }else {
            statusStr = "下架";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }
}
