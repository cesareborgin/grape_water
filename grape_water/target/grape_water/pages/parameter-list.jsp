<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/6/1
  Time: 21:12
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




    <title>参数类型</title>



    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- iCheck -->
    <!-- Morris chart -->
    <!-- jvectormap -->
    <!-- Date Picker -->
    <!-- Daterange picker -->
    <!-- Bootstrap time Picker -->
    <!--<link rel="stylesheet" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">-->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--数据表格-->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- Bootstrap Color Picker -->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--bootstrap-markdown-->
    <!-- Theme style -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
    <!-- Ion Slider -->
    <!-- ion slider Nice -->
    <!-- bootstrap slider -->
    <!-- bootstrap-datetimepicker -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">





    <!-- jQuery 2.2.3 -->
    <!-- jQuery UI 1.11.4 -->
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- Bootstrap 3.3.6 -->
    <!-- Morris.js charts -->
    <!-- Sparkline -->
    <!-- jvectormap -->
    <!-- jQuery Knob Chart -->
    <!-- daterangepicker -->
    <!-- datepicker -->
    <!-- Bootstrap WYSIHTML5 -->
    <!-- Slimscroll -->
    <!-- FastClick -->
    <!-- iCheck -->
    <!-- AdminLTE App -->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- bootstrap color picker -->
    <!-- bootstrap time picker -->
    <!--<script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>-->
    <!-- Bootstrap WYSIHTML5 -->
    <!--bootstrap-markdown-->
    <!-- CK Editor -->
    <!-- InputMask -->
    <!-- DataTables -->
    <!-- ChartJS 1.0.1 -->
    <!-- FLOT CHARTS -->
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
    <!-- jQuery Knob -->
    <!-- Sparkline -->
    <!-- Morris.js charts -->
    <!-- Ion Slider -->
    <!-- Bootstrap slider -->
    <!-- bootstrap-datetimepicker -->
    <!-- 页面meta /-->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
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
                区域模型 <small>名称管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/parameter/list.do">数字字典</a></li>
                <li class="active">参数管理</li>
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
                        <div class="row">
                            <form id="queryForm" action="${pageContext.request.contextPath}/parameter/search.do" method="post">
                                <div class="col-xs-2">
                                    <input type="text" id="nameStr" name="nameStr" class="form-control input-sm" placeholder="搜索" value=""/>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm" id="btn-query" >
                                    <i class="fa fa-search"></i> 查询
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" title="新建" id="btn-add">
                                    <i class="fa fa-folder-open"></i> 新建
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" title="刷新" id="refresh">
                                    <i class="fa  fa-spinner"></i> 刷新
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
                                <th class="sorting_asc"  style="font-size: 90%">序号</th>
                                <th class="text-center sorting_desc" style="font-size: 90%">参数编码</th>
                                <th class="text-center sorting_asc"  style="font-size: 90%">参数名称</th>
                                <th class="text-center sorting_asc"  style="font-size: 90%">参数类别</th>
                                <th class="text-center sorting_asc"  style="font-size: 90%">计量单位</th>
                                <th class="text-center sorting_asc"  style="font-size: 90%">精度</th>
                                <th class="text-center sorting_asc"  style="font-size: 90%">标签</th>
                                <th class="text-center"  style="font-size: 90%">操作</th>
                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach items="${parameters}" var="parameter">

                                <tr>
                                    <td><input name="mids" type="checkbox" id="mids" value=${parameter.id}></td>
                                    <td>${parameter.id }</td>
                                    <td class="text-center">${parameter.parameterId }</td>
                                    <td class="text-center">${parameter.parameterName }</td>
                                    <td class="text-center">${parameter.parameterType }</td>
                                    <td class="text-center">${parameter.unit }</td>
                                    <td class="text-center">${parameter.precision }</td>
                                    <td class="text-center">${parameter.tag }</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" id="editck1">修改</button>
                                        <a href="${pageContext.request.contextPath}/parameter/delete.do?id=${parameter.id}" class="btn bg-olive btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach items="${search}" var="parameter">

                                <tr>
                                    <td><input name="mids" type="checkbox" id="mid" value=${parameter.id}></td>
                                    <td>${parameter.id }</td>
                                    <td class="text-center">${parameter.parameterId }</td>
                                    <td class="text-center">${parameter.parameterName }</td>
                                    <td class="text-center">${parameter.parameterType }</td>
                                    <td class="text-center">${parameter.unit }</td>
                                    <td class="text-center">${parameter.precision }</td>
                                    <td class="text-center">${parameter.tag }</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" id="editck2">修改</button>
                                        <a href="${pageContext.request.contextPath}/parameter/delete.do?id=${parameter.id}" class="btn bg-olive btn-xs">删除</a>
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
                                <a href="${pageContext.request.contextPath}/parameter/list.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/parameter/list.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/parameter/list.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>
                            <li><a href="${pageContext.request.contextPath}/parameter/list.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/parameter/list.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
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
                                <h4 class="modal-title">新建参数类型</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" id="add-form" method="post">
                                    <div class="form-group">
                                        <label for="parameterId" class="col-sm-3 control-label">参数Code:</label>
                                        <div class="col-sm-9">
                                            <input name="parameterId" type="text" class="form-control" id="parameterId" placeholder="参数Code"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="parameterName" class="col-sm-3 control-label">参数名称:</label>
                                        <div class="col-sm-9">
                                            <input name="parameterName" type="text" class="form-control" id="parameterName" placeholder="参数名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="parameterType" class="col-sm-3 control-label">参数类别:</label>
                                        <div class="col-sm-9">
                                            <input name="parameterType" type="text" class="form-control" id="parameterType" placeholder="参数类别"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="unit" class="col-sm-3 control-label">国际单位:</label>
                                        <div class="col-sm-9">
                                            <input name="unit" type="text" class="form-control" id="unit" placeholder="国际单位"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="precision" class="col-sm-3 control-label">精度:</label>
                                        <div class="col-sm-9">
                                            <input name="precision" type="text" class="form-control" id="precision" placeholder="精度"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="tag" class="col-sm-3 control-label">标签:</label>
                                        <div class="col-sm-9">
                                            <input name="tag" type="text" class="form-control" id="tag" placeholder="标签"/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="button" id="addItem" class="btn btn-primary" onclick="add()">确认保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!--修改框-->
                <div class="modal fade" role="dialog" id="editModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                </button>
                                <h4 class="modal-title">修改</h4>
                            </div>
                            <div class="modal-body">
                                    <form class="form-horizontal" id="edit-form" method="post">
                                        <div class="form-group">
                                            <label for="id1" class="col-sm-3 control-label">id:</label>
                                            <div class="col-sm-9">
                                                <input name="id" type="text" class="form-control" id="id1" placeholder="id"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="parameterId" class="col-sm-3 control-label">参数Code:</label>
                                            <div class="col-sm-9">
                                                <input name="parameterId" type="text" class="form-control" id="parameterId1" placeholder="参数Code"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="parameterName" class="col-sm-3 control-label">参数名称:</label>
                                            <div class="col-sm-9">
                                                <input name="parameterName" type="text" class="form-control" id="parameterName1" placeholder="参数名称"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="parameterName" class="col-sm-3 control-label">计量单位:</label>
                                            <div class="col-sm-9">
                                                <input name="unit" type="text" class="form-control" id="unit1" placeholder="计量单位"/>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                            <button type="button" id="edit-btn" class="btn btn-primary" onclick="add()">确认保存</button>
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
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>>
<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
<script>
    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        location.href = "${pageContext.request.contextPath}/parameter/list.do?page=1&pageSize="
            + pageSize;
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
    $("#refresh").click(function () {
        window.location.reload();
    });
    $("#btn-add").click(function () {
        $("#add-modal").modal('show');
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
                parameterId:{
                    validators:{
                        notEmpty:{
                            message:'不能为空'
                        }
                    }
                },
                parameterName:{
                    validators:{
                        notEmpty:{
                            message:'不能为空'
                        }
                    }
                },
                parameterType:{
                    validators:{
                        notEmpty:{
                            message:'不能为空'
                        }
                    }
                },
                unit:{
                    validators:{
                        notEmpty:{
                            message:'不能为空'
                        }
                    }
                },
                precision:{
                    validators:{
                        notEmpty:{
                            message:'不能为空'
                        }
                    }
                },
                tag:{
                    validators:{
                        notEmpty:{
                            message:'不能为空'
                        }
                    }
                }
            }
        });
    });
    $("#addItem").click(function () {
        $("#add-form").bootstrapValidator('validate');
        var flag = $("#add-form").data('bootstrapValidator').isValid();
        if(!flag){
            toastr.error("填写有误，请重新填写！",{timeOut:1000});
        }else {
            var data = $("#add-form").serialize();
            $.ajax({
                url:"${pageContext.request.contextPath}/parameter/add.do",
                dataType:"json",
                type:"POST",
                data:data,
                success:function (result) {
                    if(result.type=="success"){
                        $("#add-modal").modal('hide');
                        spop({template:'添加成功',style:'success',position:'top-center',autoclose:2000});
                    }else if(result.type=="error"){
                        spop({template:result.msg,style:'error',position:'top-center',autoclose:2000});
                    }
                },
                error:function (errorMsg) {
                    spop({template:'请求数据加载失败！',style:'error',position:'top-center',autoclose:2000});
                }
            });
        }
    });

</script>
<script type="text/javascript">
    $("#dataList tbody").on("click","#editck1",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var parameterId  = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var parameterName = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var unit = $("table#dataList").find("tr").eq(row).find("td").eq(5).text();
        $("#id1").val(id);
        $("#parameterId1").val(parameterId);
        $("#parameterName1").val(parameterName);
        $("#unit1").val(unit);
        $("#editModal").modal('show');
    });
    $("#dataList tbody").on("click","#editck2",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var parameterId  = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var parameterName = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var unit = $("table#dataList").find("tr").eq(row).find("td").eq(5).text();
        $("#id1").val(id);
        $("#parameterId1").val(parameterId);
        $("#parameterName1").val(parameterName);
        $("#unit1").val(unit);
        $("#editModal").modal('show');
    });
    $("#edit-btn").click(function () {
        $('#edit-form').bootstrapValidator('validate');
        var flag = $("#edit-form").data('bootstrapValidator').isValid();
        if(!flag){
            toastr.error("填写有误，请重新填写！",{timeOut:1000});
        }else {
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/parameter/edit.do",
                data:{"id":$("#id1").val(),"parameterId":$("#parameterId1").val(),"parameterName":$("#parameterName1").val(),"unit":$("#unit1").val()},
                dataType:"json",
                success : function (data) {
                    if(data.type=="success"){
                        spop({template:'修改成功',style:'success',autoclose:2000,position:'top-center'});
                        $("#editModal").modal('hide');
                    }else {
                        spop({template:data.msg,style:'error',autoclose:2000,position:'top-center'});
                    }
                }
            });
        }
    })
</script>
</body>

</html>
