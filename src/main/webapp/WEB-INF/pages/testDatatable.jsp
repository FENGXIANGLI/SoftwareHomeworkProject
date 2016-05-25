<%--
  Created by IntelliJ IDEA.
  User: fengxiangli
  Date: 16/5/22
  Time: 下午1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<html>
<head>
    <title></title>
  <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
  <script src="//code.jquery.com/jquery-1.12.3.min.js"></script>
  <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
</head>
<body>

<table id="tb" class="display">
  <thead>
  <tr>
    <th>col1</th>
    <th>col2</th>
  </tr>
  </thead>
  <tbody>
  </tbody>
</table>

<script type="text/javascript">
  $(document).ready(function() {
    $("#tb").dataTable({
      "bProcessing": false, // 是否显示取数据时的那个等待提示
      "bServerSide": true,//这个用来指明是通过服务端来取数据
      "sAjaxSource": "tableDemoAjax.html",//这个是请求的地址
      "fnServerData": retrieveData // 获取数据的处理函数
//      "columnDefs": [
//        {
//          "targets": [3],
//          "data": "id",
//          "render": function(data, type, full) {
//            return "<a href='/update?id=" + data + "'>Update</a>";
//          }
//        }
//      ]
    });


  });

  // 3个参数的名字可以随便命名,但必须是3个参数,少一个都不行
  function retrieveData( sSource111,aoData111, fnCallback111) {
    $.ajax({
      url : sSource111,//这个就是请求地址对应sAjaxSource
      data : {"aoData":JSON.stringify(aoData111)},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
      type : 'post',
      dataType : 'json',
      async : false,
      success : function(result) {
        fnCallback111(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
      },
      error : function(msg) {
      }
    });
  }
</script>

</body>
</html>
