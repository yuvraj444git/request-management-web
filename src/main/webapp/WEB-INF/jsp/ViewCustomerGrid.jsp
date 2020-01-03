<%-- 
    Document   : ViewCustomerGrid
    Created on : Dec 14, 2019, 7:58:24 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer</title>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/manual_css/cdn_1_10_20_datatables.min.css">  
        <script type="text/javascript" charset="utf8" src="assets/manual_js/cdn_1_10_20_datatables.min.js"></script>

        <!--        <script src="assets/javascripts/tables/examples.datatables.default.js"></script>
                <script src="assets/javascripts/tables/examples.datatables.tabletools.js"></script>-->

        <script>
            $(document).ready(function () {
                $(".tbServiceCls").DataTable();
            });
        </script>
    </head>
    <body>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Customers</h2>

                <div class="right-wrapper pull-right">
                    <ol class="breadcrumbs">
                        <!--                        <li>
                                                    <a href="index.html">
                                                        <i class="fa fa-home"></i>
                                                    </a>
                                                </li>-->
                        <!--<li><span>Customers</span></li>-->
                    </ol>

                    <!--<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>-->
                </div>
            </header>

            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <button onclick="window.location.href = 'addCustomer'" type="button" class="mb-xs mt-xs mr-xs btn btn-primary">Add New</button>
                    </div>

                    <h2 class="panel-title">Customer</h2>
                </header>
                <div class="panel-body">
                    <table class="tbServiceCls table table-bordered table-striped mb-none table-responsive" >
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Contact No.</th>
                                <th>Address</th>
                                <th>Serial No.</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty customerlist}">
                                <tr>
                                    <td colspan="6">
                                        No Records found.
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="obj" items="${customerlist}">
                                <tr>
                                    <td>${obj.id}</td>
                                    <td>${obj.name}</td>
                                    <td>${obj.contact_no}</td>
                                    <td>${obj.address}</td>
                                    <td>${obj.allserials}</td>
                                    <td class="actions">
                                        <a href="editCustomer?id=${obj.id}"><i class="fa fa-pencil"></i></a>
                                        <!--<a href="" class="delete-row"><i class="fa fa-trash-o"></i></a>-->
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </section>
        <!--<script src="assets/javascripts/tables/examples.datatables.row.with.details.js"></script>-->
    </body>
</html>
