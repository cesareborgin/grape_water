package grape.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Senter {
    private Integer id;//序号
    private String sensorsName;//传感器名称
    private String sensorsType;//传感器型号
    private String installtionAddr;//安装地址
    private String precision;//精度
    private Integer baudRate;//波特率
    private String prl;//防护等级
}
