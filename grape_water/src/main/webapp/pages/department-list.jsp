<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/21
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>区域部门页</title>



    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.css">

</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 页面头部 /-->
    <!-- 导航侧栏 -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <!-- @@master = admin-layout.html-->
    <!-- @@block = content -->

    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                区域模型 <small>责任部门列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="#">区域模型</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/department/getAll.do">部门管理</a></li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <i class="fa fa-book"></i> <h3 class="box-title">列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-right">
                            <div class="form-group form-inline">
                                <button type="button" class="btn btn-primary " title="新建" id="btn-add">
                                    <i class="fa fa-folder-open"></i> 新建
                                </button>
                                <button type="button" class="btn btn-primary " title="删除" id="btn-del">
                                    <i class="fa fa-trash-o"></i> 删除
                                </button>
                                <button type="button" class="btn btn-primary " title="刷新" id="refresh">
                                    <i class="fa fa-refresh"></i> 刷新
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <form id="queryForm" action="${pageContext.request.contextPath}/department/search.do" method="post">
                                <div class="col-xs-2">
                                    <input type="text" id="departNameStr" name="departNameStr" class="form-control input-sm" placeholder="搜索" value=""/>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm" id="btn-query" >
                                    <i class="fa fa-search"></i> 查询
                                </button>
                            </form>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px;"><input id="selall" type="checkbox" class="icheckbox_square-blue" >
                                </th>
                                <th class="sorting_asc">ID</th>
                                <th class="sorting_desc">部门名称</th>
                                <th class="sorting_asc sorting_asc_disabled">部门编码</th>
                                <th class="sorting">部门责任人</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach items="${departList}" var="department">

                                <tr>
                                    <td><input name="mids" type="checkbox" id="mids" value=${department.id}></td>
                                    <td>${department.id }</td>
                                    <td>${department.departName }</td>
                                    <td>${department.energyCode }</td>
                                    <td>${department.managerName }</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" id="editck">编辑</button>
                                        <a href="${pageContext.request.contextPath}/department/deleteById.do?id=${department.id}" class="btn bg-olive btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach items="${list}" var="department">

                                <tr>
                                    <td><input name="mid" type="checkbox" id="Mid" value=${department.id}></td>
                                    <td>${department.id }</td>
                                    <td>${department.departName }</td>
                                    <td>${department.energyCode }</td>
                                    <td>${department.managerName }</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" id="editck2">编辑</button>
                                        <a href="${pageContext.request.contextPath}/department/deleteById.do?id=${department.id}" class="btn bg-olive btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                        <!--数据列表/-->

                        <!--工具栏-->
                        <!--工具栏/-->

                    </div>
                    <!-- 数据表格 /-->


                </div>
                <!-- /.box-body -->

                <!-- .box-footer-->
                <div class="box-footer">

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="${pageContext.request.contextPath}/department/getAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/department/getAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/department/getAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>
                            <li><a href="${pageContext.request.contextPath}/department/getAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/department/getAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /.box-footer-->
                <!--添加数据框-->
                <div class="modal fade" role="dialog" id="add-modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title">新建部门信息</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" id="add-form" method="post">
                                    <div class="form-group">
                                        <label for="departName" class="col-sm-3 control-label">部门名称:</label>
                                        <div class="col-sm-9">
                                            <input name="departName" type="text" class="form-control" id="departName" placeholder="部门名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="energyCode" class="col-sm-3 control-label">部门编号:</label>
                                        <div class="col-sm-9">
                                            <input name="energyCode" type="text" class="form-control" id="energyCode" placeholder="部门编号"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="managerName" class="col-sm-3 control-label">部门责任人:</label>
                                        <div class="col-sm-9">
                                            <input name="managerName" type="text" class="form-control" id="managerName" placeholder="部门责任人"/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="button" id="reset" class="btn btn-default" >清空</button>
                                        <button type="button" id="addItem" class="btn btn-primary" >确认保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!--删除弹框-->
                <div class="modal inmodal fade" id="del" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title">确认删除</h4>
                            </div>
                            <div class="modal-body">
                                <p>
                                    <strong>注意！</strong> 是否确定删除所选数据？
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="btn-delSure" class="btn btn-primary"
                                        data-dismiss="modal">确认</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--删除弹框-->

                <!--编辑框-->
                <div class="modal fade" role="dialog" id="editModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title">编辑部门信息</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" id="edit-form" method="post">
                                    <div class="form-group">
                                        <label for="id" class="col-sm-3 control-label">ID:</label>
                                        <div class="col-sm-9">
                                            <input name="id" type="text" class="form-control" id="id" placeholder="ID"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="departName" class="col-sm-3 control-label">部门名称:</label>
                                        <div class="col-sm-9">
                                            <input name="depar" type="text" class="form-control" id="depart" placeholder="部门名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="departCode" class="col-sm-3 control-label">部门编号:</label>
                                        <div class="col-sm-9">
                                            <input name="departCode" type="text" class="form-control" id="departCode" placeholder="部门编号"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="principal" class="col-sm-3 control-label">部门负责人:</label>
                                        <div class="col-sm-9">
                                            <input name="principal" type="text" class="form-control" id="principal" placeholder="部门负责人"/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="button" id="editItem" class="btn btn-primary" >确认保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
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
        <strong>Copyright &copy; 2020 <a
                href="#">明月制作</a>.
        </strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->

</div>


<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
<script>
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

    }
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("admin-datalist");
        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass : 'icheckbox_square-blue',
            increaseArea : '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
<script type="text/javascript">
    $("#btn-add").click(function () {
        $("#add-modal").modal('show');
    });
    $("#reset").click(function () {
        $("#departName").val("");
        $("#energyCode").val("");
        $("#managerName").val("");
    });
    $(function () {
        $("#add-form").bootstrapValidator({
            live:'enabled',
            message: 'This value is not valid',
            //提供输入验证图标提示
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields:{
               departName:{
                    validators:{
                        notEmpty:{
                            message:'部门名称不能为空'
                        }
                    }
                },
                energyCode:{
                    validators:{
                        notEmpty:{
                            message:'部门编号不能为空'
                        }
                    }
                },
                managerName:{
                    validators:{
                        notEmpty:{
                            message:'管理负责人不能为空'
                        }
                    }
                }
            }
        });
    });
    $("#addItem").click(function () {
        var departName = $("#departName").val();
        var energyCode = $("#energyCode").val();
        var managerName = $("#managerName").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/department/add.do",
            type:"post",
            dataType:"json",
            data:{"departName":departName,"energyCode":energyCode,"managerName":managerName},
            success:function (result) {
                if(result.type=="success"){
                    window.location.href="${pageContext.request.contextPath}/department/getAll.do";
                    return;
                }else {
                    spop({template:'数据添加失败！',style:'error',position:'top-center'});
                    return;
                }
            }
        })
    });

    $("#dataList tbody").on("click","#editck",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var departName  = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var energyCode = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var managerName = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        $("#id").val(id);
        $("#depart").val(departName);
        $("#departCode").val(energyCode);
        $("#principal").val(managerName);
        $("#editModal").modal('show');
    });
    $("#dataList tbody").on("click","#editck2",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var departName  = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var energyCode = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var managerName = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        $("#id").val(id);
        $("#depart").val(departName);
        $("#departCode").val(energyCode);
        $("#principal").val(managerName);
        $("#editModal").modal('show');
    });
    $("#editItem").click(function () {
        var id= $("#id").val();
        var departName = $("#depart").val();
        var energyCode = $("#departCode").val();
        var managerName = $("#principal").val();
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/department/edit.do",
            dataType:"JSON",
            data:{"id":id,"departName":departName,"energyCode":energyCode,"managerName":managerName},
            success:function (result) {
                if(result.type=="success"){
                    $("#editModal").modal('hide');
                    spop({template:'数据修改成功！',style:'success',position:'top-center'});
                    return;
                }else {
                    spop({template:'数据修改失败！',style:'error',position:'top-center'});
                    return;
                }
            },
            error:function () {
                spop({template:'后台出错',style:'warning',position:'top-center'});
            }
        })
    });
    $("#refresh").click(function () {
        window.location.href="${pageContext.request.contextPath}/department/getAll.do";
    });

    $("#btn-del").click(function () {
        $("#del").modal('show');
    });
    $("#btn-delSure").click(function () {
        if($("#dataList td input[name='mids']:checked")[0]==null){
            toastr.warning('请选择要删除的数据！','提示');
            return;
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
            url:"${pageContext.request.contextPath}/department/delete.do",
            success:function (data) {
                if(data.type=="success"){
                    spop({template:data.msg,style:'success',autoclose:2000,position:'top-center'});
                    return;
                }else if(result.type=="error"){
                    spop({template:'删除失败',style:'error',autoclose:2000,position:'top-center'});
                    return;
                }
            },
            error:function () {
                spop({template:'后台出错',style:'warning',autoclose:2000,position:'top-center'});
            }
        });
    });
</script>
</body>
</html>
