<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="JQueryUploadDemo.WebForm1" %>

<html>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//en"
"http://www.w3. org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head id="Head1">
	<title></title>
	<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
	<script src="JS/jquery/jquery.iframe-transport.js"></script>
	<script src="JS/jquery/jquery.ui.widget.js"></script><!--xdr那个是在ie下才需要的-->
	<script src="JS/jquery/jquery.xdr-transport.js"></script>
	<script src="JS/jquery/jquery.fileupload.js"></script>
	<style>

body{padding:10px}
/* 上传控件 */
.upload
{
	margin-top:10px;
	width:280px;
	height:30px;
}
.upload .uploadbtnBox
{
	float:left;
	height:30px;
	margin-right:8px;
}
.upload .progress
{
	height:4px;
	line-height:4px;
	*zoom:1;
	background:#fff;
	float:left;
	width:200px;
	border:1px #ccc solid;
	overflow:hidden; text-overflow:ellipsis; white-space:nowrap;

	display:none;
}
.upload .filestate
{
	float:left;
	height:20px;
	text-align:left;
	width:150px;
	line-height:20px;
	display:none;
	color:#333;
	overflow:hidden;
}
.upload .progresspercent
{
	float:right;
	padding-top:5px;
	height:15px;
	text-align:right;
	font-size:9px;
	line-height:15px;
	color:#333;
}

.upload .uploadbtnBox .a-upload {
	height:28px;
	background:#4090c0;
	border:1px solid #dddddd;color:#ffffff;
	line-height:28px;
	padding:0 6px;
    font-size:0.9em;
    overflow: hidden;
    display: inline-block;
    text-decoration:none;
    *display: inline;
    *zoom: 1
}

.upload .uploadbtnBox .a-upload  input {
	position: absolute;
    width:70px;
    height:30px;
    overflow:hidden;
    margin-left:-10px;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}

.upload .progress .bar
{
	height:4px;
	line-height:4px;
	background:#4090c0;
	*zoom:1; 
}

.clearfix:after {
	content: ".";
	display: block;
	height: 0;
	visibility: hidden;
	clear: both;
}
.clearfix {
	_zoom: 1;
}
.clearfix {
*zoom:1;
}

	</style>
	<script type="text/javascript">

		function CheckFile(obj) {
			var array = new Array('gif', 'jpeg', 'png', 'jpg');  //可以上传的文件类型  
			if (obj.value == '') {
				alert("让选择要上传的图片!");
				return false;
			}
			else {
				var fileContentType = obj.value.match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用：）  
				var isExists = false;
				for (var i in array) {
					if (fileContentType.toLowerCase() == array[i].toLowerCase()) {
						isExists = true;
						return true;
					}
				}
				if (isExists == false) {
					obj.value = null;
					alert("上传图片类型不正确!");
					return false;
				}
				return false;
			}
		}
		$(function () {
			$("input[type=file]").fileupload({
				done: function (e, result) {
					//done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
					//注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
					//返回的数据在result.result中，假设我们服务器返回了一个json对象
					//json对象{"newName": "sss", "oldName": "sdf"}
					
					var resultJson = $.parseJSON(result.result)
					$(e.target).attr("value", resultJson.newName);
					var uploadDiv = $(e.target).parent().parent().parent();
					uploadDiv.find(".filestate").show().text(resultJson.oldName);
				},
				progressall: function (e, data) {
					var maxWidth = 200;
					var percent = (data.loaded / data.total * 100).toFixed(2);
					var progress = parseInt(data.loaded / data.total * maxWidth, 10);
					var uploadDiv = $(e.target).parent().parent().parent();
					uploadDiv.find(".progress").show();
					uploadDiv.find(".bar").css("width", progress);
					uploadDiv.find(".progresspercent").show().text(percent + "%");

				}
			})
		});
    
	</script>
</head>
<body>
	<div class="upload clearfix">
		<div class="uploadbtnBox clearfix">
			<a href="javascript:;" class="a-upload">
				<input type="file" data-url="uploadHandler.ashx" name="files" value="" id="file7"
					onchange="CheckFile(this)" />点击上传 </a>
		</div>
		<div class="filestate">
			文件名</div>
		<div class="progresspercent">
		</div>
		<div class="progress" style="height: 4px;">
			<div class="bar" style="width: 0%;">
			</div>
		</div>
	</div>
	<div class="upload clearfix">
		<div class="uploadbtnBox clearfix">
			<a href="javascript:;" class="a-upload">
				<input type="file" data-url="uploadHandler.ashx" name="files" value="" id="file1"
					onchange="CheckFile(this)" />点击上传 </a>
		</div>
		<div class="filestate">
			文件名</div>
		<div class="progresspercent">
		</div>
		<div class="progress">
			<div class="bar" style="width: 0%;">
			</div>
		</div>
	</div>
	<div class="upload clearfix">
		<div class="uploadbtnBox clearfix">
			<a href="javascript:;" class="a-upload">
				<input type="file" data-url="uploadHandler.ashx" name="files" value="" id="file2"
					onchange="CheckFile(this)" />点击上传 </a>
		</div>
		<div class="filestate">
			文件名</div>
		<div class="progresspercent">
		</div>
		<div class="progress">
			<div class="bar" style="width: 0%;">
			</div>
		</div>
	</div>
	<div class="upload clearfix">
		<div class="uploadbtnBox clearfix">
			<a href="javascript:;" class="a-upload">
				<input type="file" data-url="uploadHandler.ashx" name="files" value="" id="file3"
					onchange="CheckFile(this)" />点击上传 </a>
		</div>
		<div class="filestate">
			文件名</div>
		<div class="progresspercent">
		</div>
		<div class="progress">
			<div class="bar" style="width: 0%;">
			</div>
		</div>
	</div>
</body>
</html>
