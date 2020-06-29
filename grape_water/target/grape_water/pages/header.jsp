<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/19
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!-- 页面头部 -->
<header class="main-header">
    <!-- Logo -->
    <a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>循环水</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>循环水</b>能效后台管理</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas"
           role="button"> <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">

            <ul class="nav navbar-nav">
                <!-- Notifications: style can be found in dropdown.less -->
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/system/refreshSystem.do">
                        <i class="fa fa-spinner"></i>
                    </a>
                </li>
                <!-- Notifications: style can be found in dropdown.less -->
                <li class="dropdown notifications-menu">
                    <a href="${pageContext.request.contextPath}/monitoring/list.do">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">${cautionSum}</span>
                    </a>
                </li>

                <li class="dropdown user user-menu"><a href="#"
                                                       class="dropdown-toggle" data-toggle="dropdown"> <img
                        src="${pageContext.request.contextPath}/img/power.png"
                        class="user-image" alt="User Image"> <span class="hidden-xs">
							<security:authentication property="principal.username"></security:authentication>
					</span>

                </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header"><img src="${pageContext.request.contextPath}/img/power.png" class="img-circle" alt="User Image">
                            <p>
                                循环水能效管理系统
                                <small ><div id="times" style="width: 250px;height: 25px;color: #EE7621;margin: auto"></div></small>
                            </p>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="${pageContext.request.contextPath}/system/userInfo.do" class="btn btn-default btn-flat">账号信息</a>
                            </div>
                            <div class="pull-right">
                                <a href="${pageContext.request.contextPath}/logout.do" class="btn btn-default btn-flat">注销</a>
                            </div>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
</header>
<script type="text/javascript">
    function getCurDate()
    {
        var d = new Date();
        var week;
        switch (d.getDay()){
            case 1: week="星期一"; break;
            case 2: week="星期二"; break;
            case 3: week="星期三"; break;
            case 4: week="星期四"; break;
            case 5: week="星期五"; break;
            case 6: week="星期六"; break;
            default: week="星期天";
        }
        var years = d.getFullYear();
        var month = add_zero(d.getMonth()+1);
        var days = add_zero(d.getDate());
        var hours = add_zero(d.getHours());
        var minutes = add_zero(d.getMinutes());
        var seconds=add_zero(d.getSeconds());
        var ndate = years+"年"+month+"月"+days+"日 "+hours+":"+minutes+":"+seconds+" "+week;
        times.innerHTML= ndate;
    }

    function add_zero(temp)
    {
        if(temp<10) return "0"+temp;
        else return temp;
    }

    setInterval("getCurDate()",100);

</script>
<!-- 页面头部 /-->
