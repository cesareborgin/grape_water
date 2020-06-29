<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/31
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>图片列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-fileinput/css/fileinput.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jqgrid-5.3.0/ui.jqgrid-bootstrap-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrapValidator.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/toastr.min.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
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
    <div class="content-wrapper">
        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                系统能向图 <small>图片列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/netFile/list.do">系统图</a></li>
                <li class="active">图片列表</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <!-- 正文区域 -->
        <section class="content">
            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <i class="fa fa-cube"></i>
                    <h3 class="box-title">列表</h3>
                </div>
               <div class="box-body">
                   <div class="table-box">
                       <!--工具栏-->
                           <div class="form-group form-inline" style="margin-left:auto;margin-top: 20px;margin-bottom: 20px">
                               <div class="form-group form-inline">
                                   <button type="button" class="btn btn-sm btn-primary" id = "btn-new" title="新建"><i class="fa fa-folder-open"></i> 新建</button>
                                   <button type="button" class="btn btn-sm btn-primary" title="刷新" onclick="window.location.reload();"><i class="fa fa-spinner"></i> 刷新</button>
                               </div>
                           </div>
                       <!--数据列表-->
                       <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                           <thead>
                           <tr>
                               <th style="padding-right: 0px;"><input
                                       id="selall" type="checkbox" class="icheckbox_square-blue">
                               </th>
                               <th style="font-size: 80%">序号</th>
                               <th style="font-size: 80%">监测对象</th>
                               <th style="font-size: 80%">参数名称</th>
                               <th style="font-size: 80%">图片地址</th>
                               <th style="font-size: 80%">备注</th>
                               <th style="font-size: 80%">添加时间</th>
                               <th class="text-center" style="font-size: 80%">操作</th>
                           </tr>
                           </thead>
                           <tbody>


                           <c:forEach items="${pictures}" var="picture">
                               <tr>
                                   <td><input name="ids" type="checkbox" value="${picture.id}"></td>
                                   <td>${picture.id}</td>
                                   <td>${picture.objName}</td>
                                   <td>${picture.parameters}</td>
                                   <td><img src="${picture.photo}" style="height: 50px;width: 100px"/></td>
                                   <td>${picture.remark}</td>
                                   <td>${picture.dateStr}</td>
                                   <td class="text-center">
                                       <button type="button" class="btn bg-olive btn-xs" onclick="edit(${picture.id})">修改</button>
                                       <a href="${pageContext.request.contextPath}/netFile/findById.do?id=${picture.id}" class="btn bg-olive btn-xs">详情</a>
                                       <a href="${pageContext.request.contextPath}/netFile/delete.do?id=${picture.id}" class="btn bg-olive btn-xs">删除</a>
                                   </td>
                               </tr>
                           </c:forEach>
                           </tbody>
                       </table>
                       <!--数据列表/-->
                   </div>
               </div>
                <!-- .box-footer-->
                <div class="box-footer">

                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共<span>${pageInfo.pages }</span> 页，共<span>${pageInfo.total }</span> 条数据。 每页<span>${pageInfo.size }</span> 条
                        </div>
                    </div>
                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li><a href="${pageContext.request.contextPath}/netFile/list.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                            <li><a href="${pageContext.request.contextPath}/netFile/list.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/netFile/list.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>
                            <li><a href="${pageContext.request.contextPath}/netFile/list.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li><a href="${pageContext.request.contextPath}/netFile/list.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /.box-footer-->
            </div>
            <!--添加数据框-->
            <div class="modal fade" role="dialog" id="add-modal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title">添加</h4>
                        </div>
                        <div class="modal-body">

                            <form class="form-horizontal" id="add-form" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <div class="alert alert-danger">错误信息展示栏。</div>
                                </div>
                                <div class="form-group">
                                    <label for="objName" class="col-sm-3 control-label">监测对象:</label>
                                    <div class="col-sm-9">
                                       <select class="form-control select2" style="width: 100%" name="objName" id="objName" onchange="getParams()">
                                           <option value="">选择对象</option>
                                           <c:forEach items="${entities}" var="entity">
                                               <option value="${entity.entityName}">${entity.entityName}</option>
                                           </c:forEach>
                                       </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="parameters" class="col-sm-3 control-label">参数:</label>
                                    <div class="col-sm-9">
                                        <select class="form-control select2" multiple="multiple" data-placeholder="可多选" style="width: 100%;" id="parameters" name="parameters">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="photo" class="col-sm-3 control-label">图片:</label>
                                    <div class="col-sm-9">
                                        <input type="file" name="myfile" class="col-sm-9 myfile" id="myfile" value=""/>
                                        <input type="hidden" name="photo" value="" id="photo">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="remark" class="col-sm-3 control-label">备注:</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" rows="3" placeholder="请输入..." name="remark"  id="remark"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                    <button type="button" id="add-btn" class="btn btn-primary">确认保存</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" role="dialog" id="edit-modal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>
                            <h4 class="modal-title">修改</h4>
                        </div>
                        <div class="modal-body">

                            <form class="form-horizontal" id="edit-form" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="id" class="col-sm-3 control-label">ID:</label>
                                    <div class="col-sm-9">
                                        <input value="" name="id" id="id" placeholder="ID"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="photo" class="col-sm-3 control-label">图片:</label>
                                    <div class="col-sm-9">
                                        <input type="file" id="myfile1" name="myfile" class="col-sm-9 myfile" value=""/>
                                        <input type="hidden" name="photo" value="" id="photo1">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                                    <button type="button" id="edit-btn" class="btn btn-primary">确认保存</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 正文区域 -->
    </div>
</div>
<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jqgrid-5.3.0/grid.locale-cn.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jqgrid-5.3.0/jquery.jqGrid.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ajaxupload/ajaxupload.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/src/prism.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/spop/dist/spop.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/toastr.min.js"></script>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale : 'zh-CN'
        });
    });

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
    $("#btn-new").click(function () {
        reset();
        $('.modal-title').html('图片添加');
        $("#add-modal").modal('show');
    });
    /**
     * 重置
     */
    function reset() {
        //隐藏错误提示框
        $('.alert-danger').css("display", "none");
        //清空数据
        $('#objName').val('');
        $('#photo').val('');
        $('#remark').val('');
        $("#img").attr("style", "display:none;");
    }
    $("#myfile").fileinput({
        uploadUrl:"${pageContext.request.contextPath}/output/uploadFile.do",//上传的地址
        uploadAsync:true, //默认异步上传
        showUpload: false, //是否显示上传按钮,跟随文本框的那个
        showRemove : false, //显示移除按钮,跟随文本框的那个
        showCaption: true,//是否显示标题,就是那个文本框
        showPreview : true, //是否显示预览,不写默认为true
        dropZoneEnabled: false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
        maxFileCount: 1, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        allowedFileTypes: ['image'],//配置允许文件上传的类型
        allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
        allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
        language : 'zh'
    });
    //异步上传返回结果处理
    $('#myfile').on('fileerror', function(event, data, msg) {
        console.log("fileerror");
        console.log(data);
    });
    //异步上传返回结果处理
    $("#myfile").on("fileuploaded", function (event, data, previewId, index) {
        console.log("fileuploaded");
        var photoURL = data.response.url;
        $("#photo").val(photoURL);
        spop({template:'上传成功',style:'success',autoclose:2000,position:'top-center'});

    });

    //同步上传错误处理
    $('#myfile').on('filebatchuploaderror', function(event, data, msg) {
        console.log("filebatchuploaderror");
        console.log(data);
    });

    //同步上传返回结果处理
    $("#myfile").on("filebatchuploadsuccess", function (event, data, previewId, index) {
        console.log("filebatchuploadsuccess");
        console.log(data);
        $("#photo").val(data.response.url);

    });

    //上传前
    $('#myfile').on('filepreupload', function(event, data, previewId, index) {
        console.log("filepreupload");
    });
function getParams() {
    var entityName= $("#objName").val();
    var oSel = document.getElementById("parameters");//获取供应商的下拉信息
    var oOp = oSel.children; //获取select列表的所有子元素。
    for(var i=0,len = oOp.length;i<len;i++)
    {//将供应商的下拉菜单的数据清除
        oSel.removeChild(oOp[i]);  //循环删除所有子元素
    }
    $.ajax({
        dataType:"json",
        data:{"entityName":entityName},
        url:"${pageContext.request.contextPath}/netFile/getParams.do",
        success:function (data) {
            var params =data.parameters;
            if(params.length!=0){
                for(var i=0;i<params.length;i++){
                    $("#parameters").append("<option value="+params[i].parameterName+">"+params[i].parameterName+"</option>");
                }
            }else {
                document.getElementById("parameters").innerHTML = "<option value = "+""+">"+null+"</option>" ;
            }
        }
    })
}
$("#add-btn").click(function () {
    var picture = $("#add-form").serialize();
    $.ajax({
        type:"post",
        dataType:"json",
        url:"${pageContext.request.contextPath}/netFile/add.do",
        data:picture,
        success:function (result) {
            if(result.type=="success"){
                spop({template:'添加成功',style:'success',autoclose:2000,position:'top-center'});
                $("#add-modal").modal('hide');
            }else {
                spop({template:result.msg,style:'warning',autoclose:2000,position:'top-center'});
            }
        }
    })
});
    $("#myfile1").fileinput({
        uploadUrl:"${pageContext.request.contextPath}/output/uploadFile.do",//上传的地址
        uploadAsync:true, //默认异步上传
        showUpload: false, //是否显示上传按钮,跟随文本框的那个
        showRemove : false, //显示移除按钮,跟随文本框的那个
        showCaption: true,//是否显示标题,就是那个文本框
        showPreview : true, //是否显示预览,不写默认为true
        dropZoneEnabled: false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
        maxFileCount: 1, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        allowedFileTypes: ['image'],//配置允许文件上传的类型
        allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
        allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
        language : 'zh'
    });
    //异步上传返回结果处理
    $('#myfile1').on('fileerror', function(event, data, msg) {
        console.log("fileerror");
        console.log(data);
    });
    //异步上传返回结果处理
    $("#myfile1").on("fileuploaded", function (event, data, previewId, index) {
        console.log("fileuploaded");
        var photoURL = data.response.url;
        $("#photo1").val(photoURL);
        spop({template:'修改的图片上传成功',style:'success',autoclose:2000,position:'top-center'});

    });

    //同步上传错误处理
    $('#myfile1').on('filebatchuploaderror', function(event, data, msg) {
        console.log("filebatchuploaderror");
        console.log(data);
    });

    //同步上传返回结果处理
    $(".myfile1").on("filebatchuploadsuccess", function (event, data, previewId, index) {
        console.log("filebatchuploadsuccess");
        console.log(data);
        $("#photo1").val(data.response.url);

    });

    //上传前
    $('.myfile').on('filepreupload', function(event, data, previewId, index) {
        console.log("filepreupload");
    });
    function edit(id) {
        var Sid = id;
        $("#id").val(Sid);
        $("#edit-modal").modal('show');
    }
    $("#edit-btn").click(function () {
        $.ajax({
            dataType:"json",
            type:"post",
            data:{"id":$("#id").val(),"photo":$("#photo1").val()},
            url:"${pageContext.request.contextPath}/netFile/update.do",
            success:function (data) {
                if(data.type=="success"){
                    spop({template:'修改的图片上传成功！',style:'success',autoclose:2000,position:'top-center'});
                    $("#edit-modal").modal('hide');
                }else {
                    spop({template:'修改的图片上传失败！',style:'error',autoclose:2000,position:'top-center'});
                }
            }
        })
    })
</script>
</body>
</html>
