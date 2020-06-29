<%--
  Created by IntelliJ IDEA.
  User: CesareBorgia
  Date: 2020/4/25
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统简介</title>
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
         <!-- Content Wrapper. Contains page content -->
         <div class="content-wrapper">
             <!-- Content Header (Page header) -->
             <section class="content-header">
                 <h1>
                     系统简介
                 </h1>
                 <ol class="breadcrumb">
                     <li><a href="${pageContext.request.contextPath}/firm/getIndex.do"><i class="fa fa-dashboard"></i>首页</a></li>
                     <li><a href="#">系统简介</a></li>
                 </ol>
             </section>

             <!-- Main content -->
             <section class="content">

                 <div class="row">
                     <div class="col-md-3">

                         <!-- Profile Image -->
                         <div class="box box-primary">
                             <div class="box-body box-profile">
                                 <img class="profile-user-img img-responsive img-circle" src="../img/power.png" alt="User profile picture">

                                 <h3 class="profile-username text-center">循环水系统</h3>

                                 <ul class="list-group list-group-unbordered">
                                     <li class="list-group-item">
                                         <b>采集设备</b> <a class="pull-right">${collectors}</a>
                                     </li>
                                     <li class="list-group-item">
                                         <b>传感器设备</b> <a class="pull-right">${sensors}</a>
                                     </li>
                                     <li class="list-group-item">
                                         <b>计量器设备</b> <a class="pull-right">${meters}</a>
                                     </li>
                                 </ul>

                             </div>
                             <!-- /.box-body -->
                         </div>
                         <!-- /.box -->

                         <!-- About Me Box -->
                         <div class="box box-primary">
                             <div class="box-header with-border">
                                 <h3 class="box-title">关于作者</h3>
                             </div>
                             <!-- /.box-header -->
                             <div class="box-body">
                                 <strong><i class="fa fa-book margin-r-5"></i>受教育程度</strong>
                                 <br>
                                 <br>
                                 <p>
                                     &emsp;毕业于浙江理工大学信息学院 &emsp;&emsp;
                                 </p>
                                 <p>
                                     &emsp;电子信息科学与技术&emsp;&emsp;
                                 </p>
                                 <p>
                                     &emsp;本科学士学位&emsp;&emsp;
                                 </p>

                                 <hr>

                                 <strong><i class="fa fa-map-marker margin-r-5"></i> 工作地址</strong>
                                 <br>
                                 <br>
                                 <p class="text-muted">浙江省, 杭州市</p>

                                 <hr>

                                 <strong><i class="fa fa-pencil margin-r-5"></i> 技能储备</strong>
                                 <br>
                                 <br>
                                 <p>
                                     <span class="label label-danger">Java</span>
                                     <span class="label label-success">C</span>
                                     <span class="label label-info">Javascript</span>
                                     <span class="label label-warning">软件测试</span>
                                     <span class="label label-primary">英语4级</span>
                                     <span class="label label-primary">Linux</span>
                                 </p>

                                 <hr>

                                 <strong><i class="fa fa-file-text-o margin-r-5"></i> 说说</strong>
                                 <br>
                                 <br>
                                 <p>不以物喜，不以己悲。</p>
                             </div>
                             <!-- /.box-body -->
                         </div>
                         <!-- /.box -->
                     </div>
                     <!-- /.col -->
                     <div class="col-md-9">
                         <div class="nav-tabs-custom">
                             <ul class="nav nav-tabs">
                                 <li class="active"><a href="#activity" data-toggle="tab">物联网</a></li>
                                 <li><a href="#timeline" data-toggle="tab">能源管理</a></li>
                                 <li><a href="#settings" data-toggle="tab">循环水系统</a></li>
                             </ul>
                             <div class="tab-content">
                                 <div class="active tab-pane" id="activity">
                                     <!-- Post -->
                                     <div class="post">
                                         <div class="user-block">
                                             <img class="img-circle img-bordered-sm" src="../img/IOT.jpg" alt="user image">
                                             <span class="username">
                          <a href="#">物联网的概念.</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                                         </div>
                                         <!-- /.user-block -->
                                         <br/>
                                         <p>
                                             &emsp;&emsp;物联网指的是将无处不在（Ubiquitous）的末端设备
                                             （Devices）和设施（Facilities），包括具备“内在智能”的传感器、
                                             移动终端、工业系统、楼控系统、家庭智能设施、视频监控系统等、和“外在使能”(Enabled)的，如贴上RFID的各种资产（Assets）、
                                             携带无线终端的个人与车辆等等“智能化物件或动物”或“智能尘埃”（Mote），
                                             通过各种无线和/或有线的长距离和/或短距离通讯网络连接物联网域名实现互联互通（M2M)、应用大集成（Grand Integration)、
                                             以及基于云计算的SaaS营运等模式，在内网（Intranet）、专网（Extranet）、和/或互联网（Internet）环境下，
                                             采用适当的信息安全保障机制，提供安全可控乃至个性化的实时在线监测、定位追溯、报警联动、调度指挥、预案管理、远程控制、安全防范、
                                             远程维保、在线升级、统计报表、决策支持、领导桌面（集中展示的Cockpit Dashboard)等管理和服务功能，实现对“万物”的“高效、节能、安全、环保”的“管、控、营”一体化。
                                         </p>
                                         <br/>
                                         <p>
                                             &emsp;&emsp;物联网，作为当下高新技术蓬勃发展之中新兴产业的一员，也是新一代信息技术的重要组成部分。物联网使用信息设备实时采集与监控、连接、交互的对象（实体）等用户需要的信息,
                                             跟互联网结合聚成智能的网络。我们从而达到物与物、物与人，所有涉及的开发的信息都要与网络连接，以便于我们进行管理、控制、识别。基于物联网的循环水能效管理系统我们可以较为准确的采集所相关的数据，
                                             监测循环水在生产过程中参数变化的具体情况，能够给企业找出生产的缺陷，促进企业管理水平质量的提升还有就是降低能源的损耗进而降低运营成本，为设计该系统提供节能降耗提供直观的科学依据[2]。
                                             从这种认识中，提高对循环水的管理水平，更能做好低耗又高效的管理工作，针对高耗能企业的能源管理水平，设计一套基于物联网的循环水能效管理系统，主要包括循环水的监控，
                                             采集数据层，根据数据集和标准进行对循环水运行状态进行预估和评判，系统网络的展示，根据运行的数据（包括温度、压力、流量、流速等）做出相应的预警和告警功能，最后系统做出报表展示。
                                             基于物联网技术开发循环水管理平台是利用了软件技术、自动化技术、网络技术、数据库技术等手段[3],来解决循环水流动传输过程中企业需要巨大的采集、传输、存储和计算。相比传统的管理方式，
                                             比如我们人工去记录数据，检测对象的各个指标等，我们需要过多的财力和物力管理，造成资源浪费，使用物联网技术进行管理更具有优势。
                                         </p>

                                     </div>
                                     <!-- /.post -->


                                     <!-- Post -->
                                     <div class="post">
                                         <div class="user-block">
                                             <img class="img-circle img-bordered-sm" src="../img/water.png" alt="User Image">
                                             <span class="username">
                          <a href="#">图片</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                                             <span class="description"><small ><div id="times" style="width: 250px;height: 25px;color: #EE7621;margin: auto"></div></small></span>
                                         </div>
                                         <!-- /.user-block -->
                                         <div class="row margin-bottom">
                                             <div class="col-sm-6">
                                                 <img class="img-responsive" src="../img/5.jpeg" alt="Photo">
                                             </div>
                                             <!-- /.col -->
                                             <div class="col-sm-6">
                                                 <div class="row">
                                                     <div class="col-sm-6">
                                                         <img class="img-responsive" src="../img/circle.jpg" alt="Photo">
                                                         <br>
                                                         <img class="img-responsive" src="../img/circle2.jpg" alt="Photo">
                                                     </div>
                                                     <!-- /.col -->
                                                     <div class="col-sm-6">
                                                         <img class="img-responsive" src="../img/2.jpg" alt="Photo">
                                                         <br>
                                                         <img class="img-responsive" src="../img/3.jpg" alt="Photo">
                                                     </div>
                                                     <!-- /.col -->
                                                 </div>
                                                 <!-- /.row -->
                                             </div>
                                             <!-- /.col -->
                                         </div>
                                         <!-- /.row -->

                                         <ul class="list-inline">
                                             <li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>
                                             <li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>
                                             </li>
                                             <li class="pull-right">
                                                 <a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments
                                                     (5)</a></li>
                                         </ul>

                                         <input class="form-control input-sm" type="text" placeholder="Type a comment">
                                     </div>
                                     <!-- /.post -->
                                 </div>
                                 <!-- /.tab-pane -->
                                 <div class="tab-pane" id="timeline">
                                     <!-- The timeline -->
                                     <ul class="timeline timeline-inverse">
                                         <!-- timeline item -->
                                         <li>
                                             <i class="fa fa-envelope bg-blue"></i>

                                             <div class="timeline-item">

                                                 <h3 class="timeline-header"><a href="#">能源系统概述</a></h3>
                                                 <div class="timeline-body">
                                                     <br/>
                                                    <p>&emsp;&emsp;我们需要对一些重要研究领域进行深入研究，如提高能源利用效率，将电力输送、
                                                        分配和存储系统与各种可再生能源进行有机整合等，以改善未来的能源供应状况。生物燃料、太阳能等技术依然处于研发阶段，尚不能真正满足人类的能源需求，
                                                        因而必须进行持续不断的创新，改进并完善现有技术或者开发全新的技术方案。 </p>
                                                     <br/>
                                                     <p>&emsp;&emsp;能源系统是将自然界的能源资源转变为人类社会生产和生活所需要的特定能量服务形式（有效能）的整个过程。
                                                         是为研究能源转换、使用规律的需要而抽象出来的社会经济系统的一个子系统。
                                                         通常由勘探、开采、运输、加工、分配、转换、储存、输配、使用和环境保护等一系列工艺环节及其设备所组成 。</p>
                                                 </div>
                                             </div>
                                         </li>
                                         <!-- END timeline item -->
                                         <!-- timeline item -->
                                         <li>
                                             <i class="fa fa-user bg-aqua"></i>

                                             <div class="timeline-item">

                                                 <h3 class="timeline-header no-border"><a href="#">能源系统管理</a></h3>
                                                 <div class="timeline-body">
                                                     <br/>
                                                     <p>&emsp;&emsp;能源系统管理是能源开发利用的决策与实施过程中形成的系统化和科学化的管理活动。
                                                         系统就是相互联系事物的集合。管理是对事物的疏导与控制，使之有序地运行。能源系统管理是使能源管理目标、管理内容、管理形式和管理手段达到统一协调和整体效能，它是系统论在能源工作中的运用。能源管理作为一个大系统，一般包括四个系统，
                                                         即能源的物资资源、能源的人力资源、能源的信息资源、能源的物资装备等方面的管理。能源系统管理的目标任务和基本要求是，使能源资源合理开发和利用、合理的能源投资、节能的实施、能源的环境保护、能源创新和新能源的开发等等，以达到能源的总体平衡，能源与其他经济部门的相互促进、共同发展。管理形式包括有经济的、技术的、行政的和法律的等方面。
                                                         能源系统管理在发达国家达到了较高的程度，是发达国家实现高度能源利用率的社会因素。</p>
                                                 </div>
                                             </div>
                                         </li>
                                         <!-- END timeline item -->
                                         <!-- timeline item -->
                                         <li>
                                             <i class="fa fa-comments bg-yellow"></i>

                                             <div class="timeline-item">

                                                 <h3 class="timeline-header"><a href="#">能源系统模型</a></h3>

                                                 <div class="timeline-body">
                                                     <br/>
                                                    <p>&emsp;&emsp;能源系统模型以各种能源为对象，研究能源的需求与供应之间关系的数学模型。利用各种能源之间具有可替代性的特点，把各种能源放在一起进行整体研究，进行各能源品种的合理分配，选择合理的能源工艺，合理改造能源设备，从而获得满足供求平衡的最佳的能源系统。能源系统模型对于制定一个国家或地区的能源发展规划、节能规划以及评价能源分配政策、能源技术政策和能源技术装备政策等方面均起着十分重要的作用 [3]  。
                                                        能源模型系统亦称“能源模型体系”。由若干个涉及到能源技术经济的相对独立而又彼此关联的模型所构成的体系。自20世纪70年代中期以后逐渐流行。一般由客观经济模型、产业部门关联模型（即投入产出模型）、能源系统模型、能源工业及市场模型等若干个模型耦合而成。通过各个模型之间的信息传递与反馈，进行多次迭代可达到整个系统的平衡，提供最优方案。能源模型系统可用以全面地、定量地研究一个国家或地区的能源经济问题，是进行能源系统分析的有力工具 [3]  。</p>
                                                 </div>
                                             </div>
                                         </li>
                                         <li>
                                             <i class="glyphicon glyphicon-th bg-blue"></i>

                                             <div class="timeline-item">

                                                 <h3 class="timeline-header"><a href="#">源系统网络图</a></h3>

                                                 <div class="timeline-body">
                                                     <br/>
                                                     <p>&emsp;&emsp;源系统网络图根据各种能源从开采至最终消费的全过程中各个环节的实际能量流向，经简化、抽象而成的描述能源系统的一种图示模型。
                                                         是表示能源系统结构关系的网络状流向图。图中常用直线段表示各相邻环节之间的实过程；当两相邻环节之间的中间过程不存在时，则用虚线段表示。
                                                         线段上的箭头表示能源流向；线段上方和下方则标有过程能流量、过程效率、过程成本及过程环境污染因子等数据。
                                                         能源系统网络图可描述一个国家、地区、部门或企业的能源系统的全貌，确切地表示系统的各种构成和主要特征，并可用以进行定量分析，是建立能源模型和进行系统仿真分析的重要工具。
                                                     </p>
                                                 </div>
                                             </div>
                                         </li>
                                         <!-- /.timeline-label -->
                                         <!-- timeline item -->
                                         <li>
                                             <i class="fa fa-camera bg-purple"></i>

                                             <div class="timeline-item">

                                                 <h3 class="timeline-header"><a href="#">图示</a></h3>

                                                 <div class="timeline-body">
                                                     <!-- /.col -->
                                                     <div class="row" style="width: 100%;height: 80%">
                                                         <div class="box box-solid">
                                                             <div class="box-header with-border">
                                                                 <h3 class="box-title">幻灯片效果</h3>
                                                             </div>
                                                             <!-- /.box-header -->
                                                             <div class="box-body">
                                                                 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                                                     <ol class="carousel-indicators">
                                                                         <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                                                         <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                                                                         <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                                                                         <li data-target="#carousel-example-generic" data-slide-to="3" class=""></li>
                                                                         <li data-target="#carousel-example-generic" data-slide-to="4" class=""></li>
                                                                     </ol>
                                                                     <div class="carousel-inner" >
                                                                         <div class="item active" >
                                                                             <img src="../img/f.jpg" alt="..." class="img-responsive" style="height: 80%;width: 100%">

                                                                             <div class="carousel-caption">
                                                                                 图1
                                                                             </div>
                                                                         </div>
                                                                         <div class="item" >
                                                                             <img src="../img/energy01.png" alt="..." class="img-responsive" style="height: 80%;width: 100%">

                                                                             <div class="carousel-caption">
                                                                                 图2
                                                                             </div>
                                                                         </div>
                                                                         <div class="item" >
                                                                             <img src="../img/energy03.png" alt="..." class="img-responsive" style="height: 80%;width: 100%">

                                                                             <div class="carousel-caption">
                                                                                 图3
                                                                             </div>
                                                                         </div>
                                                                         <div class="item" >
                                                                             <img src="../img/energy02.jpeg" alt="..." class="img-responsive" style="height: 80%;width: 100%">

                                                                             <div class="carousel-caption">
                                                                                 图4
                                                                             </div>
                                                                         </div>
                                                                         <div class="item" >
                                                                             <img src="../img/41.jpg" alt="..." class="img-responsive" style="height: 80%;width: 100%">

                                                                             <div class="carousel-caption">
                                                                                 图5
                                                                             </div>
                                                                         </div>
                                                                     </div>
                                                                     <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                                                         <span class="fa fa-angle-left"></span>
                                                                     </a>
                                                                     <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                                                         <span class="fa fa-angle-right"></span>
                                                                     </a>
                                                                 </div>
                                                             </div>
                                                             <!-- /.box-body -->
                                                         </div>
                                                         <!-- /.box -->
                                                     </div>
                                                     <!-- /.col -->
                                                 </div>
                                             </div>
                                         </li>
                                         <!-- END timeline item -->
                                         <!-- timeline item -->
                                         <li>
                                             <i class="fa fa-video-camera bg-maroon"></i>

                                             <div class="timeline-item">

                                                 <h3 class="timeline-header"><a href="#">视频介绍</a> </h3>

                                                 <div class="timeline-body">
                                                     <div class="embed-responsive embed-responsive-16by9">
                                                             <video width="100%" height="100%" controls>
                                                                 <source src="../upload/energy.mp4" type="video/mp4">
                                                             </video>
                                                     </div>
                                                 </div>
                                                 <div class="timeline-footer">
                                                     <a href="#" class="btn btn-xs bg-maroon">See comments</a>
                                                 </div>
                                             </div>
                                         </li>
                                         <!-- END timeline item -->
                                         <li>
                                             <i class="fa fa-clock-o bg-gray"></i>
                                         </li>
                                     </ul>
                                 </div>
                                 <!-- /.tab-pane -->

                                 <div class="tab-pane" id="settings">
                                     <div class="row">
                                         <div class="col-md-12">
                                             <div class="box box-solid">
                                                 <!-- /.box-header -->
                                                 <div class="box-body">
                                                     <div class="box-group" id="accordion">
                                                         <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                                         <div class="panel box box-primary">
                                                             <div class="box-header with-border">
                                                                 <h3 class="box-title">
                                                                     <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                                         <b>系统简介</b>
                                                                     </a>
                                                                 </h3>
                                                             </div>
                                                             <div id="collapseOne" class="panel-collapse collapse in">
                                                                 <div class="box-body">
                                                                     <p>&emsp;&emsp;循环水系统的功能是将冷却水（海水）送至高低压凝气器去冷却汽轮机低压缸排汽，以维持高低压凝气器的真空，使汽水循环得以继续。另外，它还向开式水系统和冲灰系统提供用水。</p>
                                                                     <p>&emsp;&emsp;循环水冷却系统主要由冷却塔、循环水池、循环水泵、旁滤系统、加药系统、控制仪表系统及管道、阀门等组成。</p>
                                                                     <p>&emsp;&emsp;循环冷却水分为封闭式(密闭式)和敞开式两种。封闭式冷却水系统中，冷却水不暴露于空气中，水量损失很少，水中各种矿物质和离子含量一般不发生变化。敞开式循环水系统中，水的再冷却是通过冷却塔进行的，因此冷却水再循环过程中要与空气接触，部分水在通过冷却塔时还会不断被蒸发损失掉，因而水中各种矿物质和离子含量也不断被浓缩增加 。
                                                                         循环水由循环泵、控制系统、单向阀等组成，它与热水器、热水主管、热水回管组成一套完整的热水循环系统；工作原理是控制系统给信号循环泵，循环泵带动水在内部循环启动热水器加热，达到设定时间或温度时停止工作，热水使用点即开既有热水。</p>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                         <div class="panel box box-danger">
                                                             <div class="box-header with-border">
                                                                 <h3 class="box-title">
                                                                     <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                                         <strong>工作原理</strong>
                                                                     </a>
                                                                 </h3>
                                                             </div>
                                                             <div id="collapseTwo" class="panel-collapse collapse">
                                                                 <div class="box-body">
                                                                     <p>&emsp;&emsp;循环水与工艺装置区经热交换后温度升高，然后分别进入冷却水塔，在塔内与空气进行热交换后滴入塔下冷却水池流入集水池，集水池出水经过双层格栅进入吸水井，再经循环水泵加压后送往各装置区。部分循环水回水进入旁滤系统，以降低循环水的悬浮物浓度。为减少循环冷却水对管道及设备产生腐蚀、结垢，系统设置了一套全自动加药设施。</p>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                         <div class="panel box box-success">
                                                             <div class="box-header with-border">
                                                                 <h3 class="box-title">
                                                                     <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                                         <strong>自动控制</strong>
                                                                     </a>
                                                                 </h3>
                                                             </div>
                                                             <div id="collapseThree" class="panel-collapse collapse">
                                                                 <div class="box-body">
                                                                     <p>&emsp;&emsp;自动控制系统的几个关键因素包括温度、压力、排污、补水处理几方面。</p>
                                                                     <br>
                                                                     <h4 style="color: #00CD00">温度</h4>
                                                                     <p>&emsp;&emsp;循环水的温度通过循环水回水母管上的温度在线检测仪表测量和显示，并通过冷却塔的变频风机和旁通管（根据需要设置）的温度调节阀进行控制；冷却塔风机的速度应该与循环水的要求和气候条件的变化接近，如果循环水回水干管上测出的温度偏高，风机加速，反之则减速，如果循环水回水温度持续下降，而所有的风机均已停止，则部分循环水回水将通过旁通管直接进入集水池，使循环水的温度不至于太低，此循环水的旁通量由温度调节阀进行控制。冬季或检修时循环水可通过温度调节阀直接排入集水池。</p>
                                                                     <br>
                                                                     <h4 style="color: #00CD00">压力</h4>
                                                                     <p>&emsp;&emsp;循环水的供水压力通过循环水供水干管上的压力在线检测仪表测量和显示。当循环水泵采用定速泵时，可在循环水供水干管处设置装有压力调节阀的旁通管控制循环水供水压力，压力过高时，部分循环水通过旁通管直接回流至循环水池。当循环水泵采用变频泵时，可通过变频电机调节循环水供水压力。如 果 循 环 水 供 水 管 的 压 力 持 续 过高，而压力调节阀已达到最大开度或循环水泵的转速已达到最低状态，则可以停止一台至几台循环水泵，直至压力满足系统要求。循环水泵出口还接有一条增湿塔管，在冷却塔停用时可以使塔内填料保持湿润。由于湿塔线允许的压力不能超过0.2MPa，在此管线采用减压孔板减压。</p>
                                                                     <br>
                                                                     <h4 style="color: #00CD00">排污</h4>
                                                                     <p>&emsp;&emsp;在敞开式循环冷却水系统中，由于循环冷却水在循环过程中不断蒸发而浓缩导致水质恶化，不能达到冷却水水质标准，此时必须不断补充新鲜水并将盐分含量较高的浓水排放，使水中的含盐量维持在一定的浓度，以平衡水质。循环水的排污通过安装于循环水回水干管上的电导率仪在线检测和显示，并通过循环水回水干管上设置的电导率调节阀控制，用以控制循环水的溶解固体含量，排污管上还设有在线流量计，显示排污量。</p>
                                                                     <br>
                                                                     <h4 style="color: #00CD00">补水</h4>
                                                                     <p>&emsp;&emsp;集水池上装有液位计在线检测和显示，并通过控制补充水管上设有的液位调节阀来控制补充水量，从而使集水池保持一定的液位。由于集水池的液位对于系统的稳定运行有很大关系，设置了2台液位计，2台液位计测量的液位读数偏差值超过200mm时需要运行人员到现场检查。</p>
                                                                     <br>
                                                                     <h4 style="color: #00CD00">水处理</h4>
                                                                     <p>&emsp;&emsp;温度、压力、液位、排污和水处理系统均由、DCS分散控制系统控制，水处理系统由专业的水处理厂家进行设计、施工和运行，根据补充水水质采用加酸、缓蚀阻垢剂、次 氯 酸 钠 等 药 剂 控 制 循 环 水 浓 缩 倍 率 在4-6 倍。加药系统采用DCS自动控制，根据循环水质自动加药，如果所有的循环水泵停止，那么所有的加药泵都应该停止。</p>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                         <div class="panel box box-primary">
                                                             <div class="box-header with-border">
                                                                 <h3 class="box-title">
                                                                     <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                                                         <strong>设计要点</strong>
                                                                     </a>
                                                                 </h3>
                                                             </div>
                                                             <div id="collapseFour" class="panel-collapse collapse">
                                                                 <div class="box-body">
                                                                     <br>
                                                                     <p>&emsp;&emsp;大型循环水站的水泵出水管应由应力专业进行应力分析，计算出需使用伸缩节的位置及伸缩节的各方向上的伸缩量及各管道支架的设置位置和类型（使用滑动支架、固定支架还是弹簧支架），并计算出支架在三维方向上的受力情况，以使结构专业跟进支架的结构设计。</p>
                                                                     <p>&emsp;&emsp;埋地管道（特别是小口径管道）应考虑管顶在冰冻线以下（循环水管至少应有一半在冰冻线以下）。根据多年经验，地上敷设的大口径循环水管道（直径大于300mm）基本不结冰，小管道非常容易结冰，所以小管道采用电伴热，本工程加药管、取样管均设置电伴热。</p>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                         <div class="panel box box-success">
                                                             <div class="box-header with-border">
                                                                 <h3 class="box-title">
                                                                     <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                                                         <strong>现状</strong>
                                                                     </a>
                                                                 </h3>
                                                             </div>
                                                             <div id="collapseFive" class="panel-collapse collapse">
                                                                 <div class="box-body">
                                                                     <br>
                                                                     <p>&emsp;&emsp;循环水系统是工艺生产的生命线，遍布工业生产的诸多行业。循环水泵系统能耗巨大，但是其效率却很低，与国外相比，产品效率低2% ～ 4%，系统运行效率低近20%。针对循环水系统的能耗评估方法匮乏，企业节能意识较差，改造比例依然很低，而且改造措施多局限于单体节能，没有从整个系统出发制定彻底节能策略，系统运行效率低下的情况并没有得到改善。</p>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                     </div>
                                                 </div>
                                                 <!-- /.box-body -->
                                             </div>
                                             <!-- /.box -->
                                         </div>
                                         <!-- /.col -->
                                 </div>
                                 </div>
                                 <!-- /.tab-pane -->
                             </div>
                             <!-- /.tab-content -->
                         </div>
                         <!-- /.nav-tabs-custom -->
                     </div>
                     <!-- /.col -->
                 </div>
                 <!-- /.row -->
             </section>
             <!-- /.content -->
         </div>
         <!-- /.content-wrapper -->
         <!-- 内容区域 /-->
         <!-- 底部导航 -->
         <footer class="main-footer">
             <div class="pull-right hidden-xs">
                 <b>Version</b> 1.0.0
             </div>
             <strong>Copyright &copy; 2020 <a
                     href="#">明月创作</a>.
             </strong> All rights reserved. </footer>
         <!-- 底部导航 /-->
     </div>
     <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
     <script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
     <script>
         $.widget.bridge('uibutton', $.ui.button);
     </script>
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
</body>
</html>
