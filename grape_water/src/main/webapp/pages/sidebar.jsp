<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/19
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!-- 导航侧栏 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<%=request.getContextPath()%>/img/power.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><security:authentication property="principal.username"></security:authentication></p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> <span>首页</span></a></li>

            <!-- 菜单 -->



            <li class="treeview">
                <a href="#">
                    <i class="glyphicon glyphicon-user"></i> <span>用户信息</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="user-register">
                        <a href="${pageContext.request.contextPath}/firm/getPro.do">
                            <i class="fa  fa-firefox"></i> 系统简介
                        </a>
                    </li>
                    <li id="user-list">
                        <a href="${pageContext.request.contextPath}/user/findAll.do">
                            <i class="fa  fa-cube"></i> 用户列表
                        </a>
                    </li>

                </ul>
            </li>



            <li class="treeview">
                <a href="#">
                    <i class="glyphicon glyphicon-cog"></i> <span>权限管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="charts-chartjs">
                        <a href="${pageContext.request.contextPath}/role/findAll.do">
                            <i class="fa fa-th-large"></i> 角色管理
                        </a>
                    </li>

                    <li id="charts-morris">
                        <a href="${pageContext.request.contextPath}/permission/findAll.do">
                            <i class="fa fa-th-large"></i> 资源权限
                        </a>
                    </li>
                    <li id="charts-AOP">
                        <a href="${pageContext.request.contextPath}/sysLog/findAll.do">
                            <i class="fa fa-th-large"></i> AOP日志
                        </a>
                    </li>

                </ul>
            </li>



            <li class="treeview">
                <a href="#">
                    <i class="fa fa-laptop"></i> <span>管理中心</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="elements-general">
                        <a href="${pageContext.request.contextPath}/sensors/findAll.do">
                            <i class="fa fa-bullseye"></i> 传感器台账
                        </a>
                    </li>

                    <li id="elements-icons">
                        <a href="${pageContext.request.contextPath}/pumps/findAll.do">
                            <i class="glyphicon glyphicon-cd"></i> 水泵台账
                        </a>
                    </li>
                    <li id="flowmeter">
                        <a href="${pageContext.request.contextPath}/meters/findAll.do">
                            <i class="glyphicon glyphicon-scale"></i> 计量器台账
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="#"><i class="fa fa-book"></i> 数字字典
                            <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="${pageContext.request.contextPath}/alarmType/list.do"><i class="fa fa-send"></i> 越限级别</a></li>
                            <li><a href="${pageContext.request.contextPath}/entity/list.do"><i class="fa fa-send"></i> 实体列表</a></li>
                            <li><a href="${pageContext.request.contextPath}/parameter/list.do"><i class="fa fa-send"></i> 参数列表</a></li>
                        </ul>
                    </li>


                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-edit"></i> <span>数据报表</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="form-generalA">
                        <a href="${pageContext.request.contextPath}/reports/formsA.do">
                            <i class="fa fa-bar-chart"></i> 水泵报表
                        </a>
                    </li>
                    <li id="form-generalB">
                        <a href="${pageContext.request.contextPath}/motors/findAll.do">
                            <i class="fa fa-area-chart"></i> 电机报表
                        </a>
                    </li>
                    <li id="form-generalC">
                        <a href="${pageContext.request.contextPath}/energy/findAll.do">
                            <i class="fa fa-pie-chart"></i> 耗能详情
                        </a>
                    </li>

                </ul>
            </li>


            <li class="treeview">
                <a href="#">
                    <i class="fa fa-cogs"></i> <span>采集系统</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="system-setting">
                        <a href="${pageContext.request.contextPath}/coltors/findAll.do">
                            <i class="fa fa-th-large"></i> 采集配置管理
                        </a>
                    </li>

                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="glyphicon glyphicon-equalizer"></i> <span>动态数据统计</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="chart-year">
                        <a href="${pageContext.request.contextPath}/analysis/tolist.do">
                            <i class="fa  fa-bar-chart"></i> 柱形统计
                        </a>
                    </li>
                    <li id="chart-month">
                        <a href="${pageContext.request.contextPath}/analysis/toPie.do">
                            <i class="fa  fa-send"></i> 饼图统计
                        </a>
                    </li>

                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="glyphicon glyphicon-education"></i> <span>区域模型</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="area-model">
                        <a href="${pageContext.request.contextPath}/area/getlist.do">
                            <i class="fa fa-tags"></i> 名称管理
                        </a>
                    </li>
                    <li id="department">
                        <a href="${pageContext.request.contextPath}/department/getAll.do">
                            <i class="fa fa-group"></i> 部门管理
                        </a>
                    </li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-globe"></i> <span>系统图绘制</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="net-model">
                        <a href="${pageContext.request.contextPath}/netFile/list.do">
                            <i class="fa fa-camera-retro"></i> 循环水网络图
                        </a>
                    </li>
                    <li id="net-power">
                        <a href="${pageContext.request.contextPath}/netFile/netPhoto.do">
                            <i class="glyphicon glyphicon-film"></i> 电力计量网络图
                        </a>
                    </li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-paw"></i> <span>生产安排</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li id="plan">
                        <a href="${pageContext.request.contextPath}/calendar/list.do">
                            <i class="fa fa-paper-plane-o"></i> 工作表安排
                        </a>
                    </li>
                </ul>
            </li>


        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->
<!-- -->
