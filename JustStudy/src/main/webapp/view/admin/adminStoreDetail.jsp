<%@ page import="model_p.BranchDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-16
  Time: 오후 7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
  #headline {
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

  #headline > b {
    width: 100px;
    font-size: 20px;
  }

  #headline > input {
    float: right;
    margin: 0px 10px 50px 0px;

  }

  #main {
    width: 2000px;
    height: 2000px;
    margin: 0px 0px 0px 220px;
    padding: 120px 20px 20px 40px;
  }

  .admin-store-detail-table {
    border: 1px solid rgb(97, 88, 88);
    margin-top: 10px;
  }

  .admin-store-detail-table > tbody > tr > th{
    width: 80px;
    height: 50px;
    border: 1px solid rgb(97, 88, 88);
    font-size: 13px;
  }

  .admin-store-detail-table th{
    padding: 10px;
    background: rgba(83, 104, 167, 0.856);
    color: white;
  }

  .admin-store-detail-table td{
    width: 400px;
    padding: 10px;
    font-size: 13px;
    border: 1px solid rgb(97, 88, 88);
  }
</style>

<script type="text/javascript">
  window.onload = function (){
    $(".admin-store-list").click(function (){
      location.href = "AdminStoreList"
    })
  }
</script>

<div id="headline">
  <b>지점관리 > 지점 상세보기</b>
  <input type="button" class="admin-store-list" value="목록으로">
  <input type="button" class="admin-store-modify" value="삭제">
  <input type="button" class="admin-store-modify" value="수정">
</div>

<%
  BranchDTO branchDTO = (BranchDTO) request.getAttribute("branchDTO");
%>

<div id="main">
  <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-store-detail-table">
    <tr>
      <th>지역</th>
      <td><%=branchDTO.getCity()%></td>
    </tr>
    <tr>
      <th>지점명</th>
      <td><%=branchDTO.getName()%></td>
    </tr>
    <tr>
      <th>룸타입</th>
      <td><%=branchDTO.getRooms() != null ? branchDTO.getRooms().replaceAll(",", "</br>") : ""%></td>
    </tr>
    <tr>
      <th>1시간 당<br/>가격</th>
      <td><%=branchDTO.getPrice()%>원</td>
    </tr>
    <tr>
      <th>운영 시간</th>
      <td>
        <%
        String openTime = (branchDTO.getOpen() > 9 ? "" : "0") + branchDTO.getOpen() + ":00";
        String closeTime = (branchDTO.getClose() > 9 ? "" : "0") + branchDTO.getClose() + ":00";
      %>
        <%=openTime%> ~ <%=closeTime%>
      </td>
    </tr>
    <tr>
      <th>매장 주소</th>
      <td><%=branchDTO.getAddress() != null ? branchDTO.getAddress() : ""%></td>
    </tr>
    <tr>
      <th>전화번호</th>
      <td><%=branchDTO.getPhone() != null ? branchDTO.getPhone() : ""%></td>
    </tr>
    <tr>
      <th>편의 시설</th>
      <td><%=branchDTO.getFacilities() != null ? branchDTO.getFacilities().replaceAll(",", "</br>") : ""%></td>
    </tr>
  </table>
</div>