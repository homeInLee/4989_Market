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
div#noticeUpdate-container{
width:500px; 
margin:0 auto; 
text-align:center;
padding: 10px;
}
div#noticeUpdate-container table th,tr,td{
margin-bottom:15px;
padding:5px;
}

div#noticeUpdate-container input,
div#noticeUpdate-container textarea{
margin-bottom:5px;
margin-top: 5px;
}

div#noticeUpdate-container .log{
color: #1b5ac2;
width: 75px;
height: 40px;
}
div#noticeUpdate-container select{
border: 1px solid lightgray;
}
input.log{
cursor: pointer;
}
</style>
<br />
<br />
<h2 style="text-align: center;">공지사항 수정</h2>
<br />
<div id="noticeUpdate-container">
	<form name="noticeUpdateFrm" action="${pageContext.request.contextPath}/notice/noticeUpdateEnd.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" 
					class="form-control" 
					name="noticeTitle" 
					id="noticeTitle" 
					value="${notice.noticeTitle }"
					required>
					<input type="hidden" name="noticeNo" value="${noticeNo}"/>
				</td>
			</tr>
			<tr>
				<th>분류</th>
				<td style="text-align: left;">
				<c:if test="${not empty notice.noticeType}">
				<select name="noticeType" id="noticeType" >
					<option value="m" >회원관련</option>	
					<option value="p" >결제관련</option>	
					<option value="s" >중고거래관련</option>	
					<option value="a" >경매관련</option>	
					<option value="o" >기타</option>	
				</select>
				</c:if>
				</td>
				</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" 
							class="form-control" 
							readonly 
							value="${notice.noticeWriter}" 
							name="noticeWriter" 
							id="noticeWriter" 
							required>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>	
				<textarea name="noticeContent" id="noticeContent" cols="40" rows="10" required>${notice.noticeContent }</textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<div id="attachFile" style="margin-left: 0.5px;">
					<input type="file" name="upFile" id="upFile" />
					<input type="button" value="추가"  onclick="attachFile.add()"/>
					</div>
					<div id="attachFileDiv"></div>
					<c:forEach items="${attachMap}" var="a" varStatus="status">
					<div>
					<input type="text" readonly="readonly" name="oldOName" id="oldOName${status.index}" value="${a['originalfileName']}"/>
					<input type="hidden" name="oldRName" id="oldRName${status.index}" value="${a['renamedfileName']}"/>
					<input type="button" id="btn-attachDel${status.index}" value="삭제" />
					<br />
					</div>
					</c:forEach>
					<input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>
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

$("input:button.log").click(()=>{
	location.href='${pageContext.request.contextPath}/notice/noticeList.do'
})

$("#noticeType").val("${notice.noticeType}").attr("selected","selected");

var cnt = 0;

$("input:button[id^=btn-attachDel]").on("click",(e)=>{
	if(confirm('삭제 하시겠습니까?')){
		$(e.target).parent("div").hide();
		cnt = cnt-1;
		var delOName = $(e.target).siblings("input:text[id^=oldOName]").val();
		var delRName = $(e.target).siblings("input:hidden[id^=oldRName]").val();
		console.log(delOName);
		console.log(delRName);
		$("table").before($("<input type='hidden' name='delOName' value="+delOName+">"));
		$("table").before($("<input type='hidden' name='delRName' value="+delRName+">"));
	}
});
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

$("#plusFile").click(()=>{
	var html = '<input type="file" name="upFile" id="upFile';
	html += '+zeroFill(i,5)+" />';
	$("div #plusFile").html(html);
})

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>