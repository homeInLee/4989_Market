<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap&subset=korean" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
textarea {
border: 1px solid lightgray;
}
div#noticeWrite-container{
width:800px; 
margin:0 auto; 
text-align:center;
padding: 0 130px;
}
div#noticeWrite-container table tr,td{
margin-bottom:15px;
padding-left:100px;
}

div#noticeWrite-container input,
div#noticeWrite-container textarea{
margin-bottom:5px;
margin-top: 5px;
}

div#noticeWrite-container .log{
color: #1b5ac2;
width: 75px;
height: 40px;
}
div#noticeWrite-container select{
border: 1px solid lightgray;
}
input.log{
cursor: pointer;
}
</style>
<br />
<br />
<h2 style="text-align: center;">공지사항 글쓰기</h2>
<br />
<div id="noticeWrite-container">
	<form name="noticeWriteFrm" 
		  action="${pageContext.request.contextPath}/notice/noticeWriteEnd.do" 
		  method="post" 
		  enctype="multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" class="form-control" name="noticeTitle" id="noticeTitle" required>
				</td>
			</tr>
			<tr>
				<th>분류</th>
				<td style="text-align: left">
				<select name="noticeType" id="noticeType">
					<option value="m">회원관련</option>	
					<option value="p">결제관련</option>	
					<option value="s">중고거래관련</option>	
					<option value="d">경매관련</option>	
					<option value="o">기타</option>	
				</select>
				</td>
				</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" class="form-control" readonly value="${memberLoggedIn.memberId}" name="noticeWriter" id="noticeWriter" required>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>	
				<textarea name="noticeContent" id="noticeContent" cols="40" rows="10" required></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<div id="attachFile" style="margin-left: 0.5px;">
					<input type="file" name="upFile" id="upFile1" />
					<input type="button" value="추가"  onclick="attachFile.add()"/>
					</div>
					<div id="attachFileDiv"></div>
				</td>
			</tr>
			
		</table>
		<br />
		<input class="log" type="submit" value="등록" >
		&nbsp;&nbsp;&nbsp;
		<input class="log" type="button" value="취소" >
	</form>
</div>
<script>
var cnt = 0;
attachFile = {
       idx:0,
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
           file.id = 'upFile' + idx;
           file.onchange = function(){o.prev(this,'dv'+idx)};

           var btn = document.createElement('input');
           btn.type = 'button';
           btn.value = '삭제';
           btn.onclick = function(){o.del(idx)};
           btn.style.marginLeft = '5px';


           div.appendChild(file);
           div.appendChild(btn);
           document.getElementById('attachFileDiv').appendChild(div);
           document.getElementById('attachFileDiv').appendChild(dv);

           o.idx++;
       }
}
$("input:button.log").click(()=>{
	location.href='${pageContext.request.contextPath}/notice/noticeList.do'
})
$("#plusFile").click(()=>{
	var html = '<input type="file" name="upFile" id="upFile';
	html += '+zeroFill(i,5)+" />';
	$("div #plusFile").html(html);
})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>