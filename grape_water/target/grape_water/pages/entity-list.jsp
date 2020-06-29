<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/6/1
  Time: 21:34
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




    <title>实体管理</title>



    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
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
                数字字典 <small>实体管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/entity/list.do">数字字典</a></li>
                <li class="active">实体列表</li>
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
                            <form id="queryForm" action="${pageContext.request.contextPath}/entity/search.do" method="post">
                                <div class="col-xs-2">
                                    <input type="text" id="nameStr" name="nameStr" class="form-control input-sm" placeholder="输入关键字" value=""/>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm" id="btn-query" >
                                    <i class="fa fa-search"></i> 查询
                                </button>
                                <button type="button" class="btn btn-primary btn-sm" title="新建" id="btn-add">
                                    <i class="fa fa-folder-open"></i> 新建
                                </button>
                                <button type="button" class="btn btn-primary btn-sm " title="刷新" id="refresh">
                                    <i class="fa fa-refresh"></i> 刷新
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
                                <th class="sorting_desc" style="font-size: 90%">实体ID</th>
                                <th class="sorting_asc"  style="font-size: 90%">负责人</th>
                                <th class="sorting_asc"  style="font-size: 90%">实体名称</th>
                                <th class="sorting_asc"  style="font-size: 90%">实体类别</th>
                                <th class="sorting_asc"  style="font-size: 90%">类别描述</th>
                                <th class="text-center"  style="font-size: 80%">操作</th>
                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach items="${entities}" var="entity">

                                <tr>
                                    <td><input name="mids" type="checkbox" id="mids" value=${entity.id}></td>
                                    <td>${entity.id }</td>
                                    <td>${entity.entityId }</td>
                                    <td>${entity.customerName }</td>
                                    <td>${entity.entityName }</td>
                                    <td>${entity.entityType }</td>
                                    <td>${entity.entityTypeStr }</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" id="editck1">修改</button>
                                        <a href="${pageContext.request.contextPath}/entity/findById.do?id=${entity.id}" class="btn bg-olive btn-xs">详情</a>
                                        <a href="${pageContext.request.contextPath}/entity/deleteEntity.do?id=${entity.id}" class="btn bg-olive btn-xs">删除</a>
                                        <a href="${pageContext.request.contextPath}/entity/findByIdAndParams.do?id=${entity.id}" class="btn bg-olive btn-xs">参数关联</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach items="${search}" var="entity">

                                <tr>
                                    <td><input name="mids" type="checkbox" id="idsM" value=${entity.id}></td>
                                    <td>${entity.id }</td>
                                    <td>${entity.entityId }</td>
                                    <td>${entity.customerName }</td>
                                    <td>${entity.entityName }</td>
                                    <td>${entity.entityType }</td>
                                    <td>${entity.entityTypeStr }</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" id="editck2">修改</button>
                                        <a href="${pageContext.request.contextPath}/entity/findById.do?id=${entity.id}" class="btn bg-olive btn-xs">详情</a>
                                        <a href="${pageContext.request.contextPath}/entity/deleteEntity.do?id=${entity.id}" class="btn bg-olive btn-xs">删除</a>
                                        <a href="${pageContext.request.contextPath}/entity/findByIdAndParams.do?id=${entity.id}" class="btn bg-olive btn-xs">参数关联</a>
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
                                <a href="${pageContext.request.contextPath}/entity/list.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/entity/list.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/entity/list.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>
                            <li><a href="${pageContext.request.contextPath}/entity/list.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/entity/list.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
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
                                <h4 class="modal-title">新建实体类型</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" id="add-form" method="post">
                                    <div class="form-group">
                                        <label for="entityId" class="col-sm-3 control-label">实体ID:</label>
                                        <div class="col-sm-9">
                                            <input name="entityId" type="text" class="form-control" id="entityId" placeholder="实体ID"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="customerName" class="col-sm-3 control-label">负责人:</label>
                                        <div class="col-sm-9">
                                            <input name="customerName" type="text" class="form-control" id="customerName" placeholder="客户名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="entityName" class="col-sm-3 control-label">实体名称:</label>
                                        <div class="col-sm-9">
                                            <input name="entityName" type="text" class="form-control" id="entityName" placeholder="实体名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="customerName" class="col-sm-3 control-label">实体类别:</label>
                                        <div class="col-sm-9">
                                            <input name="entityType" type="text" class="form-control" id="entityType" placeholder="实体类别"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="entityTypeStr" class="col-sm-3 control-label">类别描述:</label>
                                        <div class="col-sm-9">
                                            <input name="entityTypeStr" type="text" class="form-control" id="entityTypeStr" placeholder="类别描述"/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="button" id="reset" class="btn btn-default" >清空</button>
                                        <button type="button" id="addItem" class="btn btn-primary" onclick="add()">确认保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!--删除弹框-->
                <div class="modal inmodal fade" id="del" tabindex="-1"
                     role="dialog" aria-hidden="true">
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
                                    <strong>注意！</strong> 是否确定删除数据？
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="delyes_btn" class="btn btn-primary"
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
                                <h4 class="modal-title">编辑区域模型</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" id="edit-form" method="post">
                                    <div class="form-group">
                                        <label for="entityId" class="col-sm-3 control-label">实体ID:</label>
                                        <div class="col-sm-9">
                                            <input name="id" type="text" class="form-control" id="id" placeholder="实体ID"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="entityId" class="col-sm-3 control-label">实体ID:</label>
                                        <div class="col-sm-9">
                                            <input name="entityId" type="text" class="form-control" id="entityId1" placeholder="实体ID"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="customerName" class="col-sm-3 control-label">负责人:</label>
                                        <div class="col-sm-9">
                                            <input name="customerName" type="text" class="form-control" id="customerName1" placeholder="客户名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="entityName" class="col-sm-3 control-label">实体名称:</label>
                                        <div class="col-sm-9">
                                            <input name="entityName" type="text" class="form-control" id="entityName1" placeholder="实体名称"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="customerName" class="col-sm-3 control-label">实体类别:</label>
                                        <div class="col-sm-9">
                                            <input name="entityType" type="text" class="form-control" id="entityType1" placeholder="实体类别"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="entityTypeStr" class="col-sm-3 control-label">类别描述:</label>
                                        <div class="col-sm-9">
                                            <input name="entityTypeStr" type="text" class="form-control" id="entityTypeStr1" placeholder="类别描述"/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="button" id="save" class="btn btn-primary" onclick="add()">确认保存</button>
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
<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
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
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>

<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
<script>
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
        window.location.href="${pageContext.request.contextPath}/entity/list.do";
    });
    $("#btn-add").click(function () {
        $("#add-modal").modal('show');
    });
    $("#reset").click(function () {
        $("#entityId").val("");
        $("#customerName").val("");
        $("#entityName").val("");
        $("#entityType").val("");
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
                entityId:{
                    validators:{
                        notEmpty:{
                            message:'实体ID不能为空'
                        }
                    }
                },
                customerName:{
                    validators:{
                        notEmpty:{
                            message:'客户名称不能为空'
                        }
                    }
                },
                entityName:{
                    validators:{
                        notEmpty:{
                            message:'实体名称不能为空'
                        }
                    }
                },
                entityType:{
                    validators:{
                        notEmpty:{
                            message:'实体类别不能为空'
                        }
                    }
                },
                entityTypeStr:{
                    validators:{
                        notEmpty:{
                            message:'类型描述不能为空'
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
            spop({template:'填写有误',style:'warning',position:'top-center'});
        }else {
            var data = $("#add-form").serialize();
            $.ajax({
                url:"${pageContext.request.contextPath}/entity/add.do",
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

    //实现批量删除
    $("#btn-del").click(function () {
        if($("#dataList td input[name='mids']:checked")[0]==null){
            toastr.warning('请选择要删除的数据！','提示');
        }
        $("#del").modal('show');
    });
    $("#delyes_btn").click(function () {
        var strIds =[];
        $("#dataList td input[name='mids']:checked").each(function () {
            strIds.push($(this).val());
        });

        var ids = strIds.join(",");
        $.ajax({
            type:"post",
            data:{ids:ids},
            dataType:"json",
            url:"${pageContext.request.contextPath}/entity/delete.do",
            success:function (result) {
                if(result.type=="success"){
                    window.location.href="${pageContext.request.contextPath}/entity/list.do";
                }else if(result.type=="error"){
                    spop({template:'删除失败',style:'error',position:'top-center',autoclose:2000});
                }
            },
            error:function () {
                spop({template:'后台出错',style:'warning',position:'top-center',autoclose:2000});
            }
        });
    });
</script>
<script type="text/javascript">
    $("#dataList tbody").on("click","#editck1",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var entityId  = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var customerName = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var entityName = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        var entityType = $("table#dataList").find("tr").eq(row).find("td").eq(5).text();
        var entityTypeStr = $("table#dataList").find("tr").eq(row).find("td").eq(6).text();
        $("#id").val(id);
        $("#entityId1").val(entityId);
        $("#customerName1").val(customerName);
        $("#entityName1").val(entityName);
        $("#entityType1").val(entityType);
        $("#entityTypeStr1").val(entityTypeStr);
        $("#editModal").modal('show');
    });
    $("#dataList tbody").on("click","#editck2",function () {
        var row = $("table#dataList tr").index($(this).closest("tr"));
        var id = $("table#dataList").find("tr").eq(row).find("td").eq(1).text();
        var entityId  = $("table#dataList").find("tr").eq(row).find("td").eq(2).text();
        var customerName = $("table#dataList").find("tr").eq(row).find("td").eq(3).text();
        var entityName = $("table#dataList").find("tr").eq(row).find("td").eq(4).text();
        var entityType = $("table#dataList").find("tr").eq(row).find("td").eq(5).text();
        var entityTypeStr = $("table#dataList").find("tr").eq(row).find("td").eq(6).text();
        $("#id").val(id);
        $("#entityId1").val(entityId);
        $("#customerName1").val(customerName);
        $("#entityName1").val(entityName);
        $("#entityType1").val(entityType);
        $("#entityTypeStr1").val(entityTypeStr);
        $("#editModal").modal('show');
    });
    $("#save").click(function () {
        $('#edit-form').bootstrapValidator('validate');
        var flag = $("#edit-form").data('bootstrapValidator').isValid();
        if(!flag){
            toastr.error("填写有误，请重新填写！",{timeOut:1000});
        }else {
            var data = $("#edit-form").serialize();
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/entity/edit.do",
                data:data,
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

