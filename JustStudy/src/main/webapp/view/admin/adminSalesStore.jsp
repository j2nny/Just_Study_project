<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.BranchDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-18
  Time: 오후 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .admin-sales-store-bg{
    width: 100%;
    height: fit-content;
  }

  .admin-sales-store-headline {
    width: 1330px;
    height: 40px;
    background: #fff;
    border-bottom: 1px solid rgb(184, 177, 177);
    padding-top: 15px;
    padding-left: 20px;
    margin-top: 50px;
    margin-left: 239px;
    position: fixed;
    flex-direction: row;
  }

  .admin-sales-store-headline > b {
    width: 100px;
    font-size: 20px;
  }

  .admin-sales-store-main{
    width: 1700px;
    height: fit-content;
    margin: 0px 0px 0px 220px;
    padding: 120px 20px 20px 40px;
  }

  .admin-sales-store-table {
    width: 67%;
    border: 1px solid rgb(122, 115, 115);
    margin-top: 10px;
    table-layout: fixed;
    word-break: break-all;
  }

  .admin-sales-store-table th {
    border: 1px solid rgb(97, 88, 88);
    font-size: 13px;
  }

  .admin-sales-store-table td {
    border: 1px solid rgb(97, 88, 88);
    text-align: center;
    font-size: 13px;
    height: 30px;
    padding: 5px 5px 5px 5px;
  }

  .admin-sales-store-table tr:first-of-type{
    height: 50px;
    padding: 10px;
    color: white;
    background: rgba(83, 104, 167, 0.856);
  }

  .admin-sales-store-table tr:nth-of-type(2n) {
    background: rgba(227, 233, 240, 0.726);
  }

  select[name=branch]{
    width: 150px;
  }
</style>

<%
  ArrayList<BranchDTO> branchList = (ArrayList<BranchDTO>) request.getAttribute("branchList");
%>

<script type="text/javascript">
  window.onload = function (){

    $("select[name=city]").change(function (){
      $("select[name=branch]").html("<option>전체</option>")
      <%for(BranchDTO branchDTO : branchList){%>
          if($("select[name=city]").val() == "<%=branchDTO.getCity()%>"){
            $("select[name=branch]").append("<option><%=branchDTO.getName()%></option>")
          }
      <%}%>
    })
  }
</script>

<div class="admin-sales-store-bg">

  <div class="admin-sales-store-headline">
    <b>지점별 매출</b>
  </div>

  <div class="admin-sales-store-main">

    <div>
      <form action="AdminSalesStoreSearch">
        <select name="city">
          <option>전체</option>
          <c:forTokens items="서울,경기,부산,대구,인천,광주,대전,울산,세종,강원,충북,충남,전북,전남,경북,경남,제주" var="city" delims=",">
            <option value="city">${city}</option>
          </c:forTokens>
        </select>

        <select name="branch">
          <option value="branch">전체</option>
        </select>

        <input type="radio" name="admin-sales-store-period"/>일일
        <input type="radio" name="admin-sales-store-period"/>일간
        <input type="radio" name="admin-sales-store-period"/>월간
        <input type="radio" name="admin-sales-store-period"/>연간

        <input type="date" name="admin-sales-store-start"/>
        <input type="date" name="admin-sales-store-end"/>

        <select name="admin-sales-store-month">
          <c:forEach var="month" begin="1" end="12" step="1">
            <option value="month">${month}</option>
          </c:forEach>
        </select>
        <select name="admin-sales-store-year">
          <option value="year">2021</option>
          <option value="year">2022</option>
        </select>
        <button type="submit" class="admin-sales-store-search"><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
    </div>
      <div>총 매출:${storeTotalPay}</div>

    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-sales-store-table">
      <tr>
        <th>지역</th>
        <th>지점명</th>
        <th>영업일</th>
        <th>매출</th>
      </tr>
      <form action="">
        <c:forEach items="${salesStoreList}" var="salesStoreList">

          <tr>
            <td>${salesStoreList.city}</td>
            <td>${salesStoreList.branch}</td>
            <td>${salesStoreList.useDate}</td>
            <td>${salesStoreList.pay}</td>
          </tr>

        </c:forEach>
      </form>
    </table>
  </div>
</div>
