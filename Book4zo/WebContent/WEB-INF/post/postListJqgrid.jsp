<%@page import="kr.or.book4zo.dto.PostDto"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>


<%
   List<PostDto> postList=(List<PostDto>)request.getAttribute("postlist");
   int listcount=(Integer)request.getAttribute("listcount");
   int nowpage=(Integer)request.getAttribute("page");
   int maxpage=(Integer)request.getAttribute("maxpage");
   int startpage=(Integer)request.getAttribute("startpage");
   int endpage=(Integer)request.getAttribute("endpage");
   
   System.out.println(listcount + "/ " + nowpage + " / " + maxpage + " / ");
   System.out.println(startpage + " / " + endpage);
   
   JSONArray jsonArray = JSONArray.fromObject(postList);
%>

<html>
<head>
	<title>MVC 게시판</title>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" type="text/css" media="screen" href="resources/css/ui.jqgrid.css" />
	<script src="resources/js/jquery.jqGrid.min.js" type="text/javascript"></script>
	<script src="resources/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			var updateDialog = {
	                url: ''
	                , closeAfterAdd: true
	                , closeAfterEdit: true
	                , modal: true
	                , onclickSubmit: function (params) {
	                    var ajaxData = {};
	                    var list = $("#list");
	                    var selectedRow = list.getGridParam("selrow");
	                    rowData = list.getRowData(selectedRow);
	                    ajaxData = { dirId: rowData.dirId };
	                    return ajaxData;
	                }
	                , width: "400"
	            };
			
			console.log(<%= jsonArray %>);
			$.jgrid.nav.addtext = "추가";
            $.jgrid.nav.edittext = "편집";
            $.jgrid.nav.deltext = "삭제";
            $.jgrid.edit.addCaption = "게시물 추가";
            $.jgrid.edit.editCaption = "게시물 편집";
            $.jgrid.del.caption = "게시물 삭제";
            $.jgrid.del.msg = "정말 삭제하실거에요?";
			jQuery("#list").jqGrid(
					{
						data: <%= jsonArray %>,
				        datatype: "local",
						colNames : [ '번호', '제목', '작성자', '날짜', '조회수' ],
						colModel : [ {
							name : 'post_seq',
							index : 'post_seq',
							width : 100,
						}, {
							name : 'post_title',
							index : 'post_title',
							width : 200,
							editable: true, 
							edittype: 'text', 
							editrules: { required: true }, 
							formoptions: { elmsuffix: ' *'}
						}, {
							name : 'user_id',
							index : 'user_id',
							width : 140,
							editable: true, 
							edittype: 'text', 
							editrules: { required: true }, 
							formoptions: { elmsuffix: ' *'}
						}, {
							name : 'post_date',
							index : 'post_date',
							width : 140,
							align : "center",
						}, {
							name : 'post_views',
							index : 'post_views',
							width : 140,
							align : "right",
						}],
						rowNum : 3,
						rowList : [ 3, 6, 9 ],
						pager : '#pager',
						sortname : 'post_seq',
						viewrecords : true,
						sortorder : "desc",
						caption : "JSON 게시판",
		                ondblClickRow: function (rowid, iRow, iCol, e) {
		                    $("#list").editGridRow(rowid, updateDialog);
		                }
					}).navGrid('#pager',
			                {
	                    edit: true, add: true, del: true, search: false, refresh: true
	                },
	                updateDialog,
	                updateDialog,
	                updateDialog
	            );
			
			$.jgrid.edit = {
				    addCaption: "Add Record",
				    editCaption: "Edit Record",
				    bSubmit: "Submit",
				    bCancel: "Cancel",
				    bClose: "Close",
				    processData: "Processing...",
				    msg: {
				        required:"Field is required",
				        number:"Please, enter valid number",
				        minValue:"value must be greater than or equal to ",
				        maxValue:"value must be less than or equal to",
				        email: "is not a valid e-mail",
				        integer: "Please, enter valid integer value",
				        date: "Please, enter valid date value"
				    }
				};
				$.jgrid.del = {
				    caption: "Delete",
				    msg: "Delete selected record(s)?",
				    bSubmit: "Delete",
				    bCancel: "Cancel",
				    processData: "Processing..."
				};
				$.jgrid.nav = {
				    edittext: " ",
				    edittitle: "Edit selected row",
				    addtext:" ",
				    addtitle: "Add new row",
				    deltext: " ",
				    deltitle: "Delete selected row",
				    searchtext: " ",
				    searchtitle: "Find records",
				    refreshtext: "",
				    refreshtitle: "Reload Grid",
				    alertcap: "Warning",
				    alerttext: "Please, select row"
				};
		});
	</script>
</head>

<body>

	<table id="list"></table>
	<div id="pager"></div>

</body>
</html>