<%--
  Created by IntelliJ IDEA.
  coltors: CesareBorgia
  Date: 2020/4/25
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>采集器配置管理</title>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,coltors-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
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
        <!--页面头部-->
        <jsp:include page="header.jsp"></jsp:include>
        <!--页面头部/-->
        <!-- 导航侧栏 -->
        <jsp:include page="sidebar.jsp"></jsp:include>
        <!-- 导航侧栏 -->
        <div class="content-wrapper">
            <!-- 内容头部 -->
            <section class="content-header">
                <h1>采集系统 <small>采集配置管理</small></h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/coltors/findAll.do">配置管理</a></li>
                    <li class="active">全部采集器</li>
                </ol>
            </section>
            <!-- 内容头部 /-->
            <section class="content">
                <div class="box box-primary">
                    <div class="box-header with-border"><i class="fa fa-cube"></i><h3 class="box-title">列表</h3> </div>
                <!--数据表格-->
                <div class="box-body">
                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!-- 查询、添加、批量删除、导出、刷新 -->
                        <div class="row-fluid">

                            <div class="pull-right">
                                <form>
                                    <button type="button" class="btn btn-primary btn-sm" id="btn-add" onclick="location.href='${pageContext.request.contextPath}/coltors/toAdd.do'">
                                        <i class="fa fa-plus"></i>  添加
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm" id="btn-delAll">
                                        <i class="fa fa-bank"></i>  删除
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm" id="btn-export" onclick="location.href='${pageContext.request.contextPath}/coltors/exportExcel.do'">
                                        <i class="fa fa-cloud-download"></i>  导出
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm" id="btn-re" data-toggle="modal" data-target="#importExcel">
                                        <i class="fa  fa-cloud-upload"></i>  导入
                                    </button>
                                    <button type="button" class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/coltors/findAll.do'">
                                        <i class="fa fa-spinner"></i>  刷新
                                    </button>
                                </form>
                            </div>
                            <!-- 导入文件框-->
                            <div id="importExcel" class="modal fade" role="dialog" name="importExcel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title"><b>文件导入</b></h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="box-body">
                                                <button type="button" class="btn btn-primary" id="btn-model" onclick="location.href='${pageContext.request.contextPath}/coltors/downloadModal.do'">
                                                    <i class="fa fa-cloud-download"></i>下载模板
                                                </button>
                                                <h2></h2>
                                                <form role="form"  enctype="multipart/form-data" method="post" id="import">
                                                    <div class="form-group">
                                                        <label for="InputFile">文件写入：</label>
                                                        <h3></h3>
                                                        <input style="color: #00CD00" type="file" id="inputFile" name="inputFile">
                                                    </div>
                                                    <!-- /.box-body -->
                                                </form>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="box-footer pull-left">
                                                <button type="button" class="btn btn-primary" id="btn-in">&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                            </div>
                            <!--导入文件框-->

                            <div class="row">
                                <form id="queryForm" action="${pageContext.request.contextPath}/coltors/searchList.do" method="post">
                                    <div class="col-xs-2">
                                        <input type="text" id="searchName" name="searchName" class="form-control input-sm" placeholder="搜索" value=""/>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-sm" id="btn-query" >
                                        <i class="fa fa-search"></i> 查询
                                    </button>
                                </form>
                            </div>
                        </div>
                        <!--工具栏/-->
                        <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="del-modal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">确认删除</h4>
                                    </div>
                                    <div class="modal-body">
                                        <h3 style="color: #00CD00"><strong>是否确定删除数据？</strong></h3>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary" id="btn-sure">确定</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                        <!--导入窗口-->


                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
                                <th class="sorting text-center" style="font-size: 90%">序号</th>
                                <th class="sorting text-center" style="font-size: 90%">名称</th>
                                <th class="sorting text-center" style="font-size: 90%">型号</th>
                                <th class="sorting text-center" style="font-size: 90%">系统编号</th>
                                <th class="sorting text-center" style="font-size: 90%">设备编码</th>
                                <th class="sorting text-center" style="font-size: 90%">安装位置名称</th>
                                <th class="sorting text-center" style="font-size: 90%">安装位置编号</th>
                                <th class="sorting text-center" style="font-size: 90%">检测对象名称</th>
                                <th class="sorting text-center" style="font-size: 90%">串口号</th>
                                <th class="sorting text-center" style="font-size: 90%">表地址</th>
                                <th class="sorting text-center" style="font-size: 90%">连接状态</th>
                                <th class="text-center"  style="font-size: 90%">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${coltorsList}" var="coltors">
                                <tr>
                                    <td><input name="mds" type="checkbox" value="${coltors.id }"></td>
                                    <td  style="font-size: 90%">${coltors.id }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.coltorName }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.coltorType }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.sysNumber }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.code }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.installtionName }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.installtionCode }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.testobjName }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.serialPort }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.tableAdrr }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.statusStr }</td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/coltors/editGo.do?id=${coltors.id}" class="btn bg-olive btn-xs">修改</a>
                                        <a href="${pageContext.request.contextPath}/coltors/delete.do?id=${coltors.id}" class="btn bg-olive btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:forEach items="${coltorsfind}" var="coltors">
                                <tr>
                                    <td><input name="mid" type="checkbox" value="${coltors.id }"></td>
                                    <td  style="font-size: 90%">${coltors.id }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.coltorName }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.coltorType }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.sysNumber }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.code }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.installtionName }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.installtionCode }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.testobjName }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.serialPort }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.tableAdrr }</td>
                                    <td class="text-center" style="font-size: 90%">${coltors.statusStr }</td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/coltors/editGo.do?id=${coltors.id}" class="btn bg-olive btn-xs">修改</a>
                                        <a href="${pageContext.request.contextPath}/coltors/delete.do?id=${coltors.id}" class="btn bg-olive btn-xs">删除</a>
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
                            <li><a href="${pageContext.request.contextPath}/coltors/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                            <li><a href="${pageContext.request.contextPath}/coltors/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/coltors/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>
                            <li><a href="${pageContext.request.contextPath}/coltors/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li><a href="${pageContext.request.contextPath}/coltors/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                        </ul>
                    </div>
                 </div>
                </div>
            </section>
        </div>
        <!-- 底部导航 -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0.0
            </div>
            <strong>Copyright &copy; 2020 <a href="#">明月创作</a>.</strong> All rights reserved.
        </footer>
        <!-- 底部导航 /-->
    </div>
    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
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

        // 设置激活菜单
        function setSidebarActive(tagUri) {
            var liObj = $("#" + tagUri);
            if (liObj.length > 0) {
                liObj.parent().parent().addClass("active");
                liObj.addClass("active");
            }
        }
        function changePageSize() {
            //获取下拉框的值
            var pageSize = $("#changePageSize").val();

            //向服务器发送请求，改变没页显示条数
            location.href = "${pageContext.request.contextPath}/coltors/findAll.do?page=1&size="
                + pageSize;
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
    $("#btn-delAll").click(function () {
        $("#del-modal").modal('show');
    });
    $("#btn-sure").click(function () {
        var idArr = [];
        $("#dataList td input[name='mds']:checked").each(function () {
            idArr.push($(this).val());
        });
        if(idArr.length<1){
            spop({template:'请选择您要删除的数据！',style:'warning',position:'top-center',autoclose:2000});
        }else {
            var ids = idArr.join(",");
            $.ajax({
                type:"post",
                dataType:"json",
                data:{"ids":ids},
                url:"${pageContext.request.contextPath}/coltors/deleteMore.do",
                success:function (response) {
                    if(response.type=="success"){
                        window.location.href="${pageContext.request.contextPath}/coltors/findAll.do";
                    }else if(response.type=="error"){
                        $("#del-modal").modal('hide');
                        spop({template:'删除失败',style:'error',position:'top-center',autoclose:2000});
                    }
                },
                error:function () {
                    spop({template:'其他错误，请检查数据！',style:'warning',position:'top-center',autoclose:2000});
                }
            })
        }
    });
    $("#btn-in").click(function () {
        var inputFile = $("#inputFile").val();
        var formData = new FormData($("#import")[0]);
        formData.append("inputFile",inputFile);
        $.ajax({
            url:"${pageContext.request.contextPath}/coltors/importExcel.do",
            data:formData,
            type:"POST",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success:function (data) {
                if(data.type=="success"){
                    spop({template:'导入成功',style:'success',position:'top-center',autoclose:2000});
                    $("#importExcel").modal('hide');
                }else if(data.type=="error"){
                    spop({template:data.msg,style:'warning',position:'top-center',autoclose:2000});
                }else if(data.type=="nodata"){
                    spop({template:data.msg,style:'warning',position:'top-center',autoclose:2000});
                }
                else if(data.type=="format"){
                    spop({template:data.msg,style:'warning',position:'top-center',autoclose:2000});
                }
            }
        });
    });
</script>

</body>
</html>
