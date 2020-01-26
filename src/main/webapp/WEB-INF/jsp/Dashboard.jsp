<%-- 
    Document   : Dashboard
    Created on : Dec 14, 2019, 8:41:15 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <body>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Dashboard</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="#">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>Dashboard</span></li>
                    </ol>

                    <!--                    <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>-->
                    <a class="sidebar-right-toggle"></a>
                </div>
            </header>


            <!-- start: page -->
            <div class="row">

                <div class="col-md-6 col-lg-12 col-xl-6">
                    <div class="row">
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-primary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-primary">
                                                <i class="fa fa-life-ring"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Total Service Requests</h4>
                                                <div class="info">
                                                    <strong class="amount">${TotalServiceRequest[0].totalcount}</strong>
                                                    <span class="text-primary"></span>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-secondary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-secondary">
                                                <i class="fa fa-life-ring"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Inward Requests</h4>
                                                <div class="info">
                                                    <strong class="amount">${InwardServiceRequest[0].totalcount}</strong>
                                                    <span class="text-primary"></span>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-tertiary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-tertiary">
                                                <i class="fa fa-life-ring"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Inprogress Requests</h4>
                                                <div class="info">
                                                    <strong class="amount">${InprogressServiceRequest[0].totalcount}</strong>
                                                    <span class="text-primary"></span>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-quartenary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-quartenary">
                                                <i class="fa fa-life-ring"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Outward Requests</h4>
                                                <div class="info">
                                                    <strong class="amount">${OutwardServiceRequest[0].totalcount}</strong>
                                                    <span class="text-primary"></span>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>

                        <div class="col-md-12 col-lg-6 col-xl-6">
                            <section class="panel panel-featured-left panel-featured-quartenary">
                                <div class="panel-body">
                                    <div class="widget-summary">
                                        <div class="widget-summary-col widget-summary-col-icon">
                                            <div class="summary-icon bg-quartenary">
                                                <i class="fa fa-user"></i>
                                            </div>
                                        </div>
                                        <div class="widget-summary-col">
                                            <div class="summary">
                                                <h4 class="title">Customers</h4>
                                                <div class="info">
                                                    <strong class="amount">${TotalCustomers[0].totalcount}</strong>
                                                </div>
                                            </div>
                                            <div class="summary-footer">
                                                <a class="text-muted text-uppercase"></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>




        </section>
    </body>
</html>
