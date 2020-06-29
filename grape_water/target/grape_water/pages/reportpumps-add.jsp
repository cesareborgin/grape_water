<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/5/8
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>水泵报表信息添加</title>
    <!-- 页面meta -->
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,repumps-scalable=no" name="viewport">
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
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
    <!--页面头部-->
    <jsp:include page="header.jsp"></jsp:include>
    <!--页面头部/-->
    <!-- 导航侧栏 -->
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- 内容区域 -->
    <div class="content-wrapper">
        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                报表统计 <small>泵类表单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="glyphicon glyphicon-home"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/reports/formsA.do">泵类监测</a></li>
                <li class="active">泵类表单</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <form action="${pageContext.request.contextPath}/reports/save.do" method="post" name="add-pumps" id="pumps">
            <!-- 正文区域 -->
            <section class="content"> <!--产品信息-->

                <div class="panel panel-default">
                    <div class="panel-heading">表单信息</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">初次检定时间</div>
                        <div class="col-md-4 data">
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="datepicker-a1" name="monitorfirstDate">
                            </div>
                        </div>
                        <div class="col-md-2 title">二次检定时间</div>
                        <div class="col-md-4 data">
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="datepicker-a2" name="monitorsecondDate">
                            </div>
                        </div>
                        <div class="col-md-2 title">系统编号</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="modelCode" placeholder="匹配电机编号" value="">
                        </div>
                        <div class="col-md-2 title">泵入口压力(MPa)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="inletPressure" placeholder="保留两位小数" value="">
                        </div>
                        <div class="col-md-2 title">泵出口压力(MPa)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="outletPressure" placeholder="保留两位小数" value="">
                        </div>
                        <div class="col-md-2 title">泵进、出口温差(℃)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="temperature" placeholder="保留两位小数" value="">
                        </div>
                        <div class="col-md-2 title">泵实际扬程(m)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="headDelivery" placeholder="扬程" value="">
                        </div>
                        <div class="col-md-2 title">泵实际流量(m³/h)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="rateFlow" placeholder="流量" value="">
                        </div>
                        <div class="col-md-2 title">泵运行效率(%)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="operateEfficiency" placeholder="效率" value="">
                        </div>
                        <div class="col-md-2 title">传送效率(%)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="transferEfficiency" placeholder="效率" value="">
                        </div>
                        <div class="col-md-2 title">吸水高度(m)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="suctionHeight" placeholder="吸水高度" value="">
                        </div>
                        <div class="col-md-2 title">排水高度(m)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="drainageHeight" placeholder="排水高度" value="">
                        </div>
                        <div class="col-md-2 title">工艺所需压力(MPa)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="craftPressure" placeholder="工艺所需压力" value="">
                        </div>
                        <div class="col-md-2 title">系统回水末端压力(MPa)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="backwaterPressure" placeholder="系统回水末端压力" value="">
                        </div>
                        <div class="col-md-2 title">表位差(m)</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="potentialDifference" placeholder="表位差" value="">
                        </div>

                    </div>
                </div>
                <!--订单信息/--> <!--工具栏-->
                <div class="box-tools text-center">
                    <button type="submit" class="btn bg-maroon">保存</button>
                    <button type="button" class="btn bg-default"
                            onclick="history.back(-1);">返回</button>
                </div>
                <!--工具栏/-->
            </section>
            <!-- 正文区域 /-->
        </form>
    </div>
    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2020 <a href="#">明月创作</a>.</strong> All rights reserved.
    </footer>
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
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
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
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#datepicker-a1').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#datepicker-a2').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
        $('#datepicker-a3').datetimepicker({
            format : "yyyy-mm-dd hh:ii",
            autoclose : true,
            todayBtn : true,
            language : "zh-CN"
        });
    });
</script>
<script type="text/javascript">
        $('#pumps').bootstrapValidator({
            live:'enabled',
            message: 'This value is not valid',
            //提供输入验证图标提示
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields:{
                inletPressure:{
                    massage:'验证失败!',
                    validators:{
                        notEmpty:{
                            message:'泵入口压力不能为空'
                        },
                        digits:{
                            message:'泵入口压力必须为数值'
                        }
                    }
                },
                outletPressure:{
                    massage:'验证失败!',
                    validators:{
                        notEmpty:{
                            message:'泵出口压力不能为空'
                        },
                        digits:{
                            message:'泵出口压力必须为数值'
                        }
                    }
                },
                temperature:{
                    massage:'验证失败!',
                    validators:{
                        notEmpty:{
                            message:'泵进、出口温差不能为空'
                        },
                        digits:{
                            message:'泵进、出口温差必须为数值'
                        }
                    }
                },
                modelCode:{
                    validators:{
                        notEmpty:{
                            message:'系统编码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '系统编码必须在6到30位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '系统编码只能包含大写、小写字母、数字和下划线'
                        }
                    }
                },
                headDelivery:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'扬程保留两位'
                        }
                    }
                },
                rateFlow:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'流量保留两位小数'
                        }
                    }
                },
                operateEfficiency:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'泵运行效率保留两位'
                        }
                    }
                },
                transferEfficiency:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'传输效率值保留两位'
                        }
                    }
                },
                suctionHeight:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'吸水高度保留两位'
                        }
                    }
                },
                drainageHeight:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'排水高度保留两位'
                        }
                    }
                },
                craftPressure:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'工艺所需压力保留两位'
                        }
                    }
                },
                backwaterPressure:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'系统回水末端压力保留两位'
                        }
                    }
                },
                potentialDifference:{
                    validators:{
                        notEmpty:{
                            message:'输入不能为空'
                        },
                        numeric:{
                            message:'表位差保留两位'
                        }
                    }
                }
            }
        });
</script>
</body>
</html>

