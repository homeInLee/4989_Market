<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>

div#noticeWrite-container{
margin:0 auto; 
text-align:center;
/* padding: 0 130px; */
}

table,tr,td{
width: 80%;
border: 1px solid lightgray;
height: 50px;
border-left-width: 0;
border-right-width: 0;
text-align: center;
margin-left: 105px;
}

select{
width: 200px;
height: 45px;
border: 0 solid;
}

th{
width: 20%;
text-align: center;
}
.btn-writeEnd{
background: #1b5ac2;
color: white;
width: 75px;
height: 40px;
cursor: pointer;
border-radius: 5px;
}
.btn-cancel{
color: #1b5ac2;
width: 75px;
height: 40px;
cursor: pointer;
background: white;
border: 1px solid #1b5ac2;
border-radius: 5px;
}
div#noticeWrite-container select{
border: 1px solid lightgray;
}
#btn-del{
background: #1b5ac2; 
border: 1px solid #1b5ac2; 
border-radius: 5px; 
color: white; 
}
input#upFile1{
margin-left: -290px;
}
input#upFile2{
margin-left: -290px;
}
input#upFile3{
margin-left: -290px;
}
</style>
<br />
<br />
<h2 style="text-align: center; color:#1b5ac2; border: 1px solid #1b5ac2; height: 100px; padding-top: 27px; width: 800px; margin-left:115;">F A Q</h2>
<br />
<div id="noticeWrite-container">
	<form name="noticeWriteFrm" 
		  action="${pageContext.request.contextPath}/notice/noticeWriteEnd.do" 
		  method="post" 
		  enctype="multipart/form-data">
		<table>
			<tr>
				<td>제 목</td>
				<td>
					<input type="text" style="width: 90%;" class="form-control" name="noticeTitle" id="noticeTitle" required>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td >
					<input type="text" style="width: 200px;" class="form-control" readonly value="${memberLoggedIn.memberId}" name="noticeWriter" id="noticeWriter" required>
				</td>
			</tr>
			<tr>
				<td>분 류</td>
				<td style="text-align: left">
				<select name="noticeType" id="noticeType">
					<option value="m">회원관련</option>	
					<option value="p">결제관련</option>	
					<option value="s">중고거래관련</option>	
					<option value="a">경매관련</option>	
					<option value="o">기타</option>	
				</select>
				</td>
				</tr>
			<tr>
				<td>내 용</td>
				<td>	
				<textarea name="noticeContent" id="noticeContent" cols="78" rows="20" required></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<div id="attachFile" style="margin-left: 0.5px;">
					<input type="file" style="color: black; padding-left: 0;" name="upFile" id="upFile1" />
					<input type="button" style="background: white; border: 1px solid #1b5ac2; border-radius: 5px; color: #1b5ac2; " value="추가"  onclick="attachFile.add()"/>
					</div>
					<div id="attachFileDiv"></div>
				</td>
			</tr>
			
		</table>
		<br />
		<input class="btn-writeEnd" type="submit" value="등록" >
		&nbsp;&nbsp;&nbsp;
		<input class="btn-cancel" type="button" value="취소" >
	</form>
</div>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<script>
var cnt = 0;
attachFile = {
       idx:1,
       add:function(){ // 파일필드 추가
       	if(cnt>1){
       		alert("사진은 세장까지만 추가가 가능합니다.")
       		return;
       	}
       	cnt = cnt+1;
           var o = this;
           var idx = o.idx;
           
           var div = document.createElement('div');
           div.style.marginTop = '3px';
           div.id = 'file' + o.idx;
           div.className = "filebox";

           var dv = document.createElement('dv');
           dv.style.marginTop = '3px';
           dv.id = 'dv' + o.idx;
           
           var file = document.all ? document.createElement('<input name="upFile"') : document.createElement('input');
           file.type = 'file';
           file.name = 'upFile';
           file.size = '40';
           file.id = 'upFile' + (o.idx+1);
           file.onchange = function(){o.prev(this,'dv'+idx)};

           var btn = document.createElement('input');
           btn.type = 'button';
           btn.id = 'btn-del';
           btn.value = '삭제';
           btn.onclick = function(){o.del(idx)};
           btn.style.marginLeft = '5px';


           div.appendChild(file);
           div.appendChild(btn);
           document.getElementById('attachFileDiv').appendChild(div);
           document.getElementById('attachFileDiv').appendChild(dv);

           o.idx++;
       },
       del:function(idx){ // 파일필드 삭제
           if(document.getElementById('upFile' + idx).value != '' && !confirm('삭제 하시겠습니까?')){
               return;
           }
           cnt--;
           document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));
           document.getElementById('attachFileDiv').removeChild(document.getElementById('dv' + idx));
       }
}
$("input:button.btn-cancel").click(()=>{
	location.href='${pageContext.request.contextPath}/notice/noticeList.do';
})
$("#plusFile").click(()=>{
	var html = '<input type="file" name="upFile" id="upFile';
	html += '+zeroFill(i,5)+" />';
	$("div #plusFile").html(html);
})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>