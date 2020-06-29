<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/23
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>用户列表</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.min.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
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
            <h1>用户列表<small>全部用户</small></h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/user/findAll.do">用户列表</a></li>
                <li class="active">全部用户</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <section class="content">
            <div class="box box-primary">
                <div class="box-header with-border"><i class="fa fa-cube"></i><h3 class="box-title">列表</h3> </div>
            <div class="box-body">

                <!-- 数据表格 -->
                <div class="table-box" >

                    <!-- 查询、添加、批量删除、导出、刷新 -->
                    <div class="row-fluid">
                        <div class="pull-right">
                            <form>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-add" onclick="location.href='${pageContext.request.contextPath}/pages/user-add.jsp'">
                                    <i class="fa fa-plus"></i> 添加
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-delAll">
                                    <i class="fa fa-remove"></i> 删除
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" id="btn-re">
                                    <i class="fa fa-refresh"></i> 刷新
                                </button>
                            </form>

                        </div>

                        <div class="row">
                            <form id="queryForm" action="${pageContext.request.contextPath}/user/search.do" method="post">
                                <div class="col-xs-2">
                                    <input type="text" id="usernameStr" name="usernameStr" class="form-control input-sm" placeholder="搜索" value=""/>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm" id="btn-query">
                                    <i class="fa fa-search"></i> 查询
                                </button>
                            </form>
                        </div>
                    </div>
                    <!--工具栏/-->

                    <!--数据列表-->
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
                            <th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
                            <th class="sorting_asc">用户ID</th>
                            <th class="sorting_desc">用户名</th>
                            <th class="sorting_asc sorting_asc_disabled">邮箱</th>
                            <th class="sorting_desc sorting_desc_disabled">联系电话</th>
                            <th class="sorting">状态</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td><input name="mids" type="checkbox" id="mids" value="${user.id }"></td>
                                <td>${user.id }</td>
                                <td>${user.username }</td>
                                <td>${user.email }</td>
                                <td>${user.phoneNum }</td>
                                <td>${user.statusStr }</td>
                                <td class="text-center">
                                    <button class="btn bg-olive btn-xs" id="btn-up1">修改</button>
                                    <a href="${pageContext.request.contextPath}/user/findById.do?id=${user.id}" class="btn bg-olive btn-xs">详情</a>
                                    <a href="${pageContext.request.contextPath}/user/findUserByIdAndAllRole.do?id=${user.id}" class="btn bg-olive btn-xs">添加角色</a>
                                    <button class="btn bg-olive btn-xs" id="btn-ps" onclick="resetPassword(${user.id})">密码重置</button>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:forEach items="${searchList}" var="user">
                            <tr>
                                <td><input name="Mids" type="checkbox" value="${user.id }"></td>
                                <td>${user.id }</td>
                                <td>${user.username }</td>
                                <td>${user.email }</td>
                                <td>${user.phoneNum }</td>
                                <td>${user.statusStr }</td>
                                <td class="text-center">
                                    <button class="btn bg-olive btn-xs" id="btn-up2">修改</button>
                                    <a href="${pageContext.request.contextPath}/user/findById.do?id=${user.id}" class="btn bg-olive btn-xs">详情</a>
                                    <a href="${pageContext.request.contextPath}/user/findUserByIdAndAllRole.do?id=${user.id}" class="btn bg-olive btn-xs">添加角色</a>
                                    <button class="btn bg-olive btn-xs" id="btn-ps2" onclick="resetPassword(${user.id})">密码重置</button>
                                </td>
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
                        总共<span>${pageInfo.pages }</span> 页，共<span>${pageInfo.total }</span> 条数据。 每页<span>${pageInfo.size }</span> 条
                    </div>
                </div>
                <div class="box-tools pull-right">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                            <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                        </c:forEach>
                        <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                    </ul>
                </div>
            </div>
            </div>
            <!-- 密码重置模态框（Modal） -->
            <div class="modal fade" id="savePs" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title">确认重置？</h4>
                        </div>
                        <div class="modal-body">
                            <p>
                                <strong>注意！</strong> 密码会重置为八个6？
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                            <button type="button" id="btn-save" class="btn btn-primary"
                                    data-dismiss="modal">确认</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal -->
            </div>
            <!-- /.密码重置 -->
            <!-- 编辑模态框（Modal） -->
            <div class="modal fade" role="dialog" id="editModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title">编辑用户信息</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" name="editEnergy" id="editUser" method="post">
                                <div class="form-group">
                                    <label for="id" class="col-sm-3 control-label">用户ID:</label>
                                    <div class="col-sm-9">
                                        <input name="id" type="text" class="form-control" id="id" placeholder="用户ID" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="username" class="col-sm-3 control-label">登录账户:</label>
                                    <div class="col-sm-9">
                                        <input name="username" type="text" class="form-control" id="username" placeholder="登录账户" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-sm-3 control-label">邮箱:</label>
                                    <div class="col-sm-9">
                                        <input name="email" type="text" class="form-control" id="email" placeholder="邮箱" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phoneNum" class="col-sm-3 control-label">联系电话:</label>
                                    <div class="col-sm-9">
                                        <input name="phoneNum" type="text" class="form-control" id="phoneNum" placeholder="联系电话" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="status" class="col-sm-3 control-label">用户状态:</label>
                                    <div class="col-sm-9">
                                        <select class="form-control select2" style="width: 100%" name="status" id="status">
                                            <option value="1">开启</option>
                                            <option value="0">屏蔽</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                    <button type="button" id="edit" class="btn btn-primary" onclick="update()">确认保存</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--修改框-->

            <!--修改-->
        </section>

    </div>
        <!-- 正文区域 /-->
    <!-- @@close -->
    <!-- 内容区域 /-->
    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2020 <a href="#">明月创作</a>.</strong> All rights reserved.
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
<script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script>
    toastr.options = {
        // 是否显示进度条，（设置关闭的超时时间进度条）
        positionClass: "toast-top-center",              // 设置提示款显示的位置
        timeOut: "2000"                                        //  自动关闭超时时间

    };
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
</script>
<script type="text/javascript">
    $("#btn-re").click(function () {
        window.location.href="${pageContext.request.contextPath}/user/findAll.do";
    });
    function resetPassword(id) {
        $("#savePs").modal('show');
        var userId = id;
        $("#btn-save").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/resetPw.do",
                dataType:"json",
                type:"post",
                data:{"id":userId},
                success:function (response) {
                    if(response.type="success"){
                        toastr.success('重置成功！', '提示', {timeOut : 2000});
                        $("#savePs").modal('hide');
                    }else {
                        toastr.danger('重置失败！', '提示', {timeOut: 2000});
                        $("#savePs").modal('hide');
                    }
                }
            })
        });
    }
    $("#dataList tbody").on("click","#btn-up1",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var userId = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var username = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var email = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var phoneNum = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        $("#id").val(userId);
        $("#username").val(username);
        $("#email").val(email);
        $("#phoneNum").val(phoneNum);

        $("#editModal").modal('show');
    });
    $("#dataList tbody").on("click","#btn-up2",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var userId = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var username = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var email = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var phoneNum = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        $("#id").val(userId);
        $("#username").val(username);
        $("#email").val(email);
        $("#phoneNum").val(phoneNum);
        $("#editModal").modal('show');
        
    });
    $("#edit").click(function () {
        var data = $("#editUser").serialize();
        $.ajax({
            dataType:"json",
            url:"${pageContext.request.contextPath}/user/update.do",
            type:"post",
            data:data,
            success:function (result) {
                if(result.type=="success"){
                    toastr.success('修改成功！', '提示', {timeOut : 2000});
                    $("#editModal").modal('hide');
                }else {
                    toastr.danger('重置失败！', '提示', {timeOut: 2000});
                }
            }
        })
    });
    $("#btn-delAll").click(function () {
        if($("#dataList td input[name='mids']:checked")[0]==null){
            toastr.warning('请选择要删除的数据！','提示');
        }
        var strIds =[];
        $("#dataList td input[name='mids']:checked").each(function () {
            strIds.push($(this).val());
        });

        var ids = strIds.join(",");
        $.ajax({
            type:"post",
            data:{ids:ids},
            dataType:"json",
            url:"${pageContext.request.contextPath}/user/delete.do",
            success:function (result) {
                if(result.type=="success"){
                   window.location.href="${pageContext.request.contextPath}/user/findAll.do";
                }else {
                    toastr.error('删除失败！', '提示', {timeOut : 2000});
                }
            }
        });
    });
</script>
</body>
</html>
