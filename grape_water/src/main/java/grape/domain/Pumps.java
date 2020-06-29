package grape.domain;


//水泵台账
public class Pumps {
    private Integer id;
    private String inernalName;//内部名称
    private String modelType;//型号
    private Double MTOP;//配套电机功率
    private Double ROF;//流量
    private Double electricity;//电流
    private Double voltage;//电压
    private Integer efficiency;//效率
    private Double shaft;//轴功率
    private Integer DGAT;//排出口径
    private Integer SGAT;//吸入口径
    private Integer REV;//转速
    private Integer HODL;//扬程
    private String LOFT;//防护等级

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInernalName() {
        return inernalName;
    }

    public void setInernalName(String inernalName) {
        this.inernalName = inernalName;
    }

    public String getModelType() {
        return modelType;
    }

    public void setModelType(String modelType) {
        this.modelType = modelType;
    }

    public Double getMTOP() {
        return MTOP;
    }

    public void setMTOP(Double MTOP) {
        this.MTOP = MTOP;
    }

    public Double getROF() {
        return ROF;
    }

    public void setROF(Double ROF) {
        this.ROF = ROF;
    }

    public Double getElectricity() {
        return electricity;
    }

    public void setElectricity(Double electricity) {
        this.electricity = electricity;
    }

    public Double getVoltage() {
        return voltage;
    }

    public void setVoltage(Double voltage) {
        this.voltage = voltage;
    }

    public Integer getEfficiency() {
        return efficiency;
    }

    public void setEfficiency(Integer efficiency) {
        this.efficiency = efficiency;
    }

    public Double getShaft() {
        return shaft;
    }

    public void setShaft(Double shaft) {
        this.shaft = shaft;
    }

    public Integer getDGAT() {
        return DGAT;
    }

    public void setDGAT(Integer DGAT) {
        this.DGAT = DGAT;
    }

    public Integer getSGAT() {
        return SGAT;
    }

    public void setSGAT(Integer SGAT) {
        this.SGAT = SGAT;
    }

    public Integer getREV() {
        return REV;
    }

    public void setREV(Integer REV) {
        this.REV = REV;
    }

    public Integer getHODL() {
        return HODL;
    }

    public void setHODL(Integer HODL) {
        this.HODL = HODL;
    }

    public String getLOFT() {
        return LOFT;
    }

    public void setLOFT(String LOFT) {
        this.LOFT = LOFT;
    }
}
