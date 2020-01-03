<%-- 
    Document   : ViewEmployeeGrid
    Created on : Dec 14, 2019, 10:36:19 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <title>Employee</title>

        <!--        <script src="assets/javascripts/tables/examples.datatables.default.js"></script>
              
                <script src="assets/javascripts/tables/examples.datatables.tabletools.js"></script>-->
    </head>
    <body>
        <section role="main" class="content-body">

            <header class="page-header">
                <h2>Employees</h2>

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
                        <button onclick="window.location.href = 'addEmployee'" type="button" class="mb-xs mt-xs mr-xs btn btn-primary">Add New</button>
                    </div>

                    <h2 class="panel-title">Employee</h2>
                </header>
                <div class="panel-body">
                    <table class="table table-bordered table-striped mb-none" id="datatable-details">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Username</th>
                                <th>Contact No.</th>
                                <th>Type</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="obj" items="${employeelist}">
                                <tr <c:if test="${obj.isactive=='N'}">style="background-color: #ffc8c8;"</c:if>>
                                    <td>${obj.id}</td>
                                    <td>${obj.name}</td>
                                    <td>${obj.username}</td>
                                    <td>${obj.contact_no}</td>
                                    <td>${obj.type}</td>
                                    <td class="actions">
                                        <a href="editEmployee?id=${obj.id}"><i class="fa fa-pencil"></i></a>
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
