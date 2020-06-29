package grape.domain;


import java.util.List;

public class Entity {
    private Integer id;
    private String entityId;
    private String customerName;//客户名称
    private String entityName;
    private Integer entityType;
    private String entityTypeStr;
    public List<Parameters> parameters;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEntityId() {
        return entityId;
    }

    public void setEntityId(String entityId) {
        this.entityId = entityId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public Integer getEntityType() {
        return entityType;
    }

    public void setEntityType(Integer entityType) {
        this.entityType = entityType;
    }

    public String getEntityTypeStr() {
        return entityTypeStr;
    }

    public void setEntityTypeStr(String entityTypeStr) {
        this.entityTypeStr = entityTypeStr;
    }

    public List<Parameters> getParameters() {
        return parameters;
    }

    public void setParameters(List<Parameters> parameters) {
        this.parameters = parameters;
    }
}
