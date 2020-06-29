<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/25
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>日志记录页</title>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
    <!--页面头部-->
    <jsp:include page="header.jsp"></jsp:include>
    <!--页面头部/-->
    <!-- 导航侧栏 -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>日志管理<small>全部日志</small></h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/sysLog/findAll.do">日志管理</a></li>
                <li class="active">全部日志</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <section class="content">
            <div class="box box-primary">
                <div class="box-header with-border"><i class="fa fa-book"></i><h3 class="box-title">列表</h3> </div>
            </div>
            <div class="box-body">

                <!-- 数据表格 -->
                <div class="table-box">

                    <!-- 查询、添加、批量删除、导出、刷新 -->
                    <div class="row-fluid">

                        <div class="row">
                            <form id="queryForm" action="${pageContext.request.contextPath}/sysLog/search.do" method="post">
                                <div class="col-xs-2">
                                    <input type="text" id="searchName" name="searchName" class="form-control input-sm" placeholder="搜索" value=""/>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm" id="btn-query">
                                    <i class="fa fa-search"></i> 查询
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-del">
                                    <i class="fa fa-remove"></i> 删除
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-re" onclick="window.location.reload();">
                                    <i class="fa fa-refresh"></i> 刷新
                                </button>
                            </form>
                        </div>
                    </div>
                    <!--工具栏/-->

                    <!--数据列表-->
                    <table id="dataList"
                           class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
                            <th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
                            <th class="sorting" style="font-size: 90%">日志id</th>
                            <th class="text-center sorting" style="font-size: 90%">访问时间</th>
                            <th class="text-center sorting" style="font-size: 90%">访问用户</th>
                            <th class="text-center sorting" style="font-size: 90%">访问IP</th>
                            <th class="text-center sorting" style="font-size: 90%">资源URL</th>
                            <th class="text-center sorting" style="font-size: 90%">执行时间</th>
                            <th class="text-center sorting" style="font-size: 90%">访问方法</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sysLogs}" var="syslog">
                            <tr>
                                <td><input name="mids" type="checkbox" value="${syslog.id}"></td>
                                <td class="" style="font-size: 90%">${syslog.id}</td>
                                <td class="text-center" style="font-size: 90%">${syslog.visitTimeStr }</td>
                                <td class="text-center" style="font-size: 90%">${syslog.username }</td>
                                <td class="text-center" style="font-size: 90%">${syslog.ip }</td>
                                <td class="" style="font-size: 90%">${syslog.url}</td>
                                <td class="text-center" style="font-size: 90%">${syslog.executionTime}毫秒</td>
                                <td class="" style="font-size: 90%">${syslog.method}</td>
                            </tr>
                        </c:forEach>
                        <c:forEach items="${list}" var="syslog">
                            <tr>
                                <td><input name="Mids" type="checkbox" value="${syslog.id}"></td>
                                <td class="" style="font-size: 90%">${syslog.id}</td>
                                <td class="text-center" style="font-size: 90%">${syslog.visitTimeStr }</td>
                                <td class="text-center" style="font-size: 90%">${syslog.username }</td>
                                <td class="text-center" style="font-size: 90%">${syslog.ip }</td>
                                <td class="" style="font-size: 90%">${syslog.url}</td>
                                <td class="text-center" style="font-size: 90%">${syslog.executionTime}毫秒</td>
                                <td class="" style="font-size: 90%">${syslog.method}</td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                    <!--数据列表/-->

                </div>
                <!-- 数据表格 /-->

            </div>
            <div class="box-footer">

                <div class="pull-left">
                    <div class="form-group form-inline">
                        总共<span>${pageInfo.pages }</span> 页，共<span>${pageInfo.total }</span> 条数据。 每页
                        <select class="form-control" id="changePageSize" onchange="changePageSize()">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                        </select> 条
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                        </c:forEach>
                        <li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                        <li><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- 正文区域 /-->
    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->
    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2020<a href="#">明月创作</a>.</strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->
</div>
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale : 'zh-CN'
        });
    });
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        location.href = "${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size="
            + pageSize;
    }

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document)
        .ready(
            function() {

                // 激活导航位置
                setSidebarActive("admin-datalist");

                // 列表按钮
                $("#dataList td input[type='checkbox']")
                    .iCheck(
                        {
                            checkboxClass : 'icheckbox_square-blue',
                            increaseArea : '20%'
                        });
                // 全选操作
                $("#selall")
                    .click(
                        function() {
                            var clicks = $(this).is(
                                ':checked');
                            if (!clicks) {
                                $(
                                    "#dataList td input[type='checkbox']")
                                    .iCheck(
                                        "uncheck");
                            } else {
                                $(
                                    "#dataList td input[type='checkbox']")
                                    .iCheck("check");
                            }
                            $(this).data("clicks",
                                !clicks);
                        });
            });
    //实现批量删除
    $("#btn-del").click(function () {
        if($("#dataList td input[name='mids']:checked")[0]==null){
            spop({template:'请选择你要删除的数据！',style:'warning',position:'top-center',autoclose:1500});
            return;
        }
        if(confirm("确定删除吗？")){
            var strIds =[];
            $("#dataList td input[name='mids']:checked").each(function () {
                strIds.push($(this).val());
            });

            var ids = strIds.join(",");
            $.ajax({
                type:"post",
                data:{ids:ids},
                dataType:"json",
                url:"${pageContext.request.contextPath}/sysLog/delete.do",
                success:function (result) {
                    if(result.type=="success"){
                        window.location.href="${pageContext.request.contextPath}/sysLog/findAll.do";
                    }else if(result.type=="warning"){
                        spop({template:'请你选择你要删除的数据',style:'warning',position:'top-center',autoclose:1500});
                    }else {
                        spop({template:'删除失败',style:'error',position:'top-center',autoclose:1500});
                    }
                },
                error:function () {
                    spop({template:'后台出错',style:'warning',position:'top-center',autoclose:1500});
                }
            });
        }
    })
</script>
</body>
</html>
