package grape.domain;

public class Area {
    private Integer id;
    private String enLocal;//区域名称
    private String enCode;//

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEnLocal() {
        return enLocal;
    }

    public void setEnLocal(String enLocal) {
        this.enLocal = enLocal;
    }

    public String getEnCode() {
        return enCode;
    }

    public void setEnCode(String enCode) {
        this.enCode = enCode;
    }
}
