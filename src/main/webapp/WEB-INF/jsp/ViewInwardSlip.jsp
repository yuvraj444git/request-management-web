<%-- 
    Document   : ViewInwardSlip
    Created on : Dec 28, 2019, 10:12:46 AM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Inward</title>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

        <link href="css/style.css" rel="stylesheet" type="text/css">

        <script>
            function printContent(el) {
                var restorepage = document.body.innerHTML;
                var printcontent = document.getElementById(el).innerHTML;
                document.body.innerHTML = printcontent;
                window.print();
                document.body.innerHTML = restorepage;
            }



            $(document).ready(function () {
                nicEditors.allTextAreas();
                convert_amount_into_amttotal_paisa();
                $("#dialogmailDetail").hide();

                //code written to display mail comment box begin here
                $("#mailclick").click(function (e) {
                    e.preventDefault();
                    //get customer email in the textbox of comment dialog
                    var customerEmail = $("#customeremail").val();
                    $("#emailList").val(customerEmail);

                    var invoicehistoryid = $(this).attr('href');
                    $("#dialogmailDetail").dialog({
                        modal: true,
                        effect: 'drop',
                        width: 925,
                        height: 300,
                        show: {
                            effect: "drop"
                        },
                        hide: {
                            effect: "drop"
                        }
                    });
                    $("#comments").val("");
                    $("#sendcomments").prop("disabled", false);
                });
                //code written to display mail comment box ends! here
            });
        </script> 
        <style>
            .button, .button-group > li > a, .button-group > li > label, .button-group > li > button {
                /*display: inline-block;*/
                border: 0;
                text-align: center;
                line-height: 1;
                cursor: pointer;
                -webkit-appearance: none;
                -webkit-font-smoothing: antialiased;
                transition: background 0.25s ease-out;
                vertical-align: middle;
            }
            a{
                text-decoration: none;
            }
            .button {
                font-size: 0.9rem;
                display: inline-block;
                width: auto;
                padding: 0.8rem 2rem;
                margin: 0 1rem 1rem 0;
                background: #0195db;
                border-radius: 3px;
                color: #fff;
            }
        </style>
    </head>
    <body style="margin-left: 50px;">

        <a href="#" class="button" onclick="printContent('sendmailDiv1')">Print</a>

        <a href="viewServiceRequestGrid" style="float: right;" class="button" >Back</a>
        <div id="sendmailDiv1">

            <div id="printdivinside" style="
                 font-family: sans-serif;
                 /* 1 */
                 -ms-text-size-adjust: 100%;
                 /* 2 */
                 -webkit-text-size-adjust: 100%;
                 /* 2 */
                 ">
                <div id="dialog-form" title="Preview" style="overflow-x:hidden;width: 1000px">
                    <!--<p class="validateTips"><br>-->
                    <div class="grid-block" style=".grid-block {
                             overflow: visible !important;
                             display: -ms-flexbox;
                             display: flex;
                             height: auto;
                             position: relative;
                             overflow: hidden;
                             backface-visibility: hidden;
                             -ms-flex: 1 1 auto;
                             flex: 1 1 auto;
                             -ms-flex-flow: row wrap;
                             flex-flow: row wrap;
                             -ms-flex-wrap: nowrap;
                             flex-wrap: nowrap;
                             -ms-flex-align: stretch;
                             align-items: stretch;
                             -ms-flex-pack: start;
                             justify-content: flex-start;
                             -ms-flex-order: 0;
                             order: 0;
                             -webkit-overflow-scrolling: touch;
                             -ms-overflow-style: -ms-autohiding-scrollbar;
                             display: block;
                         }">
                        <div class="left-panel-pre" style="display: block;line-height: 26px;
                             font-size: 14px;
                             color: #666;">
                            <img style="width: 120px; max-width: 100%;
                                 height: auto;
                                 -ms-interpolation-mode: bicubic;
                                 display: inline-block;
                                 vertical-align: middle; 
                                 border: 0;" src="assets/images/logo.png">                                 

                        </div>
                    </div>
                    <hr>
                    <table border="1" class="tablepop" style="border-collapse: collapse;
                           border-spacing: 0; 
                           border-top-width: 1px;
                           border-right-width: 1px;
                           border-bottom-width: 1px;
                           border-left-width: 1px;
                           display: table;
                           border-color: grey;
                           width: 100%;" >
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <th style="text-align: left;width: 50%;">
                                Service Details
                            </th>
                            <th style="text-align: left;width: 50%;">
                                Provide Details
                            </th>
                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <td>
                                <table style="width:100%">
                                    <tr style="width: 100%">
                                        <td style="width:30%">Date</td>
                                        <td style="width:70%">${servicerequest.request_date}</td>
                                    </tr>
                                    <tr>
                                        <td style="">Service ID</td>
                                        <td style="">${servicerequest.ref_id}</td>
                                    </tr>
                                    <tr>
                                        <td style="">Customer Name</td>
                                        <td style="">${servicerequest.custname}</td>
                                    </tr>
                                    <tr>
                                        <td style="">Conatct No.</td>
                                        <td style="">${servicerequest.contact_no}</td>
                                    </tr>
                                    <tr>
                                        <td style="">Address</td>
                                        <td style="">${servicerequest.address}</td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table style="width:100%">
                                    <tr style="width: 100%">
                                        <td style="width:30%">Name</td>
                                        <td style="width:70%">AVR</td>
                                    </tr>
                                    <tr>
                                        <td style="">Contact Person</td>
                                        <td style=""></td>
                                    </tr>
                                    <tr>
                                        <td style="">Conatct no.</td>
                                        <td style=""></td>
                                    </tr>
                                    <tr>
                                        <td style="">Address</td>
                                        <td style=""></td>
                                    </tr>
                                    <tr>
                                        <td style="">Address</td>
                                        <td style=""></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <th style="text-align: left;width: 50%;">
                                Product Details
                            </th>
                            <th style="text-align: left;width: 50%;">
                                Inward Check
                            </th>
                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <td style=" vertical-align: text-top;">
                                <table style="width:100%">
                                    <tr style="width: 100%">
                                        <td style="width:30%">Serial No.</td>
                                        <td style="width:70%">${servicerequest.serialno}</td>
                                    </tr>
                                    <tr>
                                        <td style="">Product Name</td>
                                        <td style="">${servicerequest.product_name}</td>
                                    </tr>
                                    <tr>
                                        <td style="">Model Name</td>
                                        <td style="">${servicerequest.model_name}</td>
                                    </tr>
                                </table>
                            </td>
                            <td rowspan="3" style="vertical-align: text-top;">
                                <table style="width:100%">
                                    <tr style="width: 100%">
                                        <th style="width:30%;text-align: left;">Component</th>
                                        <th style="width:70%;text-align: left;">Desc.</th>
                                    </tr>
                                    <c:forEach var="ob" items="${servicerequestinward}">
                                        <tr>
                                            <td style="">${ob.component}</td>
                                            <td style="">${ob.description}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </td>
                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <th style="text-align: left;width: 50%;">
                                Issues Reported By Customer
                            </th>
                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <td style=" vertical-align: text-top;">
                                <textarea readonly="" style="width: 98%;height: 100%;margin: 0px;" name="accessories_recd" rows="5" class="form-control" placeholder="" required="">${servicerequest.issue_by_cust}</textarea>
                                <!--                                <table style="width:100%">
                                                                    <tr style="width: 100%">
                                                                        <td style="width:100%">${servicerequest.issue_by_cust}</td>
                                                                    </tr>
                                
                                                                </table>-->
                            </td>
                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <th style="text-align: left;width: 50%;">
                                Condition Of Product
                            </th>
                            <th style="text-align: left;width: 50%;">
                                Accessories Received
                            </th>
                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <td style=" vertical-align: text-top;">
                                <textarea readonly="" style="width: 98%;height: 100%;margin: 0px;" name="accessories_recd" rows="5" class="form-control" placeholder="" required="">${servicerequest.condtion_product}</textarea>
                                <!--                                <table style="width:100%">
                                                                    <tr style="width: 100%;vertical-align: top;">
                                                                        <td style="width:100%">${servicerequest.condtion_product}</td>
                                                                    </tr>
                                                                </table>-->
                            </td>
                            <td style=" vertical-align: text-top; ">
                                <textarea readonly="" style="width: 98%;height: 100%;margin: 0px;" name="accessories_recd" rows="5" class="form-control" placeholder="" required="">${servicerequest.accessories_recd}</textarea>
                                <!--                                <table style="width:100%">
                                                                    <tr style="width: 100%">
                                                                        <td style="width:100%">
                                ${servicerequest.accessories_recd}
                                
                            </td>
                        </tr>
                    </table>-->
                            </td>
                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <th colspan="2" style=" vertical-align: text-top;width: 100%;">

                            </th>

                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <th style=" vertical-align: text-top;width: 50%;">

                            </th>
                            <th style=" vertical-align: text-top;width: 50%;">
                                Authority Signature
                            </th>
                        </tr>
                        <tr style="display: table-row;
                            vertical-align: inherit;
                            border-color: inherit;">
                            <td style=" vertical-align: text-top;width: 50%;">

                            </td>
                            <td style=" vertical-align: text-top;width: 50%;height: 50px">

                            </td>
                        </tr>
                    </table>


                </div>

                </body>
                </html>
