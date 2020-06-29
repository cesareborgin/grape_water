package grape.domain;

public class Coltors {
    private Integer id;
    private String coltorName;
    private String coltorType;
    private String sysNumber;
    private String code;
    private String installtionName;
    private String installtionCode;
    private String testobjName;
    private String serialPort;
    private String tableAdrr;
    private Integer status;
    private String statusStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getColtorName() {
        return coltorName;
    }

    public void setColtorName(String coltorName) {
        this.coltorName = coltorName;
    }

    public String getColtorType() {
        return coltorType;
    }

    public void setColtorType(String coltorType) {
        this.coltorType = coltorType;
    }

    public String getSysNumber() {
        return sysNumber;
    }

    public void setSysNumber(String sysNumber) {
        this.sysNumber = sysNumber;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getInstalltionName() {
        return installtionName;
    }

    public void setInstalltionName(String installtionName) {
        this.installtionName = installtionName;
    }

    public String getInstalltionCode() {
        return installtionCode;
    }

    public void setInstalltionCode(String installtionCode) {
        this.installtionCode = installtionCode;
    }

    public String getTestobjName() {
        return testobjName;
    }

    public void setTestobjName(String testobjName) {
        this.testobjName = testobjName;
    }

    public String getSerialPort() {
        return serialPort;
    }

    public void setSerialPort(String serialPort) {
        this.serialPort = serialPort;
    }

    public String getTableAdrr() {
        return tableAdrr;
    }

    public void setTableAdrr(String tableAdrr) {
        this.tableAdrr = tableAdrr;
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
        if (status==1){
            statusStr = "连接正常";
        }
        if (status==2){
            statusStr = "连接异常";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }
}
