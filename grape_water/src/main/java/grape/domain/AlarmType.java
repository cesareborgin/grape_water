package grape.domain;

public class AlarmType {
    private String id;
    private Integer uid;//分类0-1
    private Integer alarmId;
    private String alarmStr;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getAlarmId() {
        return alarmId;
    }

    public void setAlarmId(Integer alarmId) {
        this.alarmId = alarmId;
    }

    public String getAlarmStr() {
        return alarmStr;
    }

    public void setAlarmStr(String alarmStr) {
        this.alarmStr = alarmStr;
    }
}
