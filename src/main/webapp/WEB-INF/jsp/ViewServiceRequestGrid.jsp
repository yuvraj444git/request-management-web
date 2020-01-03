<%-- 
    Document   : ViewServiceRequestGrid
    Created on : Dec 15, 2019, 8:26:59 PM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

        <link rel="stylesheet" type="text/css" href="assets/manual_css/cdn_1_10_20_datatables.min.css">  
        <!--<link rel="stylesheet" type="text/css" href="assets/vendor/jquery-datatables-bs3/assets/css/datatables.css">-->  
        <script type="text/javascript" charset="utf8" src="assets/manual_js/cdn_1_10_20_datatables.min.js"></script>

        <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Request</title>
        <script>
            $(document).ready(function () {
                $(".tbServiceCls").DataTable();
            });
        </script>
    </head>
    <body>
        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Service Request</h2>

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
                        <button onclick="window.location.href = 'addNewServiceRequest'" type="button" class="mb-xs mt-xs mr-xs btn btn-primary">Add New</button>
                    </div>

                    <h2 class="panel-title">Service Request</h2>
                </header>
                <div class="panel-body">
                    <table class="tbServiceCls table table-bordered table-striped mb-none table-responsive" ><!--id="datatable-details"-->
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Ref-Id</th>
                                <th>Date</th>
                                <th>Customer</th>
                                <th>Contact No.</th>
                                <th>Serial No.</th>
                                <th>Status</th>
                                <th>Amount</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty servicerequestlist}">
                                <tr>
                                    <td colspan="9">
                                        No Records found.
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="obj" items="${servicerequestlist}">
                                <tr>
                                    <td>${obj.id}</td>
                                    <td>${obj.ref_id}</td>
                                    <td>${obj.request_date}</td>
                                    <td>${obj.custname}</td>
                                    <td>${obj.contact_no}</td>
                                    <td>${obj.currserialno}</td>
                                    <td>${obj.service_status}</td>
                                    <td>${obj.amount}</td>
                                    <td class="actions">
                                        <a href="editServiceRequest?id=${obj.id}" title="Edit"><i class="fa fa-pencil"></i></a>
                                        <a href="viewInwardSlip?id=${obj.id}" target="_blank" title="Inward"><i class="fa fa-download"></i></a>
                                        <a href="viewOutwardSlip?id=${obj.id}" target="_blank" title="Outward"><i class="fa fa-upload"></i></a>
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
