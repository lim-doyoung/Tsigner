<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- font -->
<link
   href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
   rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<!-- Font Awesome -->

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">

$(document).ready(function(){
   $('#noticeadd').hide();

   

   $('#addBtn>button').click(function(){
      $('#noticelist').hide();
      $('#noticeadd').show();

   });
   
   
});

//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
function list(page){
   location.href="notice?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
}
</script>

<style type="text/css">
      #pageNum {
         text-align: center;
      }
      
      #addBtn {
         text-align: right;
      }
      #addBtns {
         text-align: center;
      }
      
      #updateBtns {
         text-align: center;
      }
      
      
      #addFile {
         text-align: right;
      }
      .detailList{
         display: block;
      }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   <jsp:include page="../template/header.jsp"></jsp:include>
   <br>
   <%
      String root = request.getContextPath();
   %>
   <!-- 여기서부터 컨텐츠입니다 -->
   <div class="container">
         <!-- 컨텐츠의 내용을 입력하세요 -->
            
               <div class="page-header">
                  <h1>
                     Notice <small> 공지사항</small>
                  </h1>
               </div>
         
               <ul class="nav nav-pills nav-justified">
                  <li role="presentation" class="active"><a href="<%=root %>/notice">공지사항</a></li>
                  <li role="presentation"><a href="<%=root %>/howtouse">이용방법</a></li>
		          <li role="presentation"><a href="<%=root %>/event">이벤트</a></li>
		          <li role="presentation"><a href="<%=root %>/update">업데이트</a></li>
                  
               </ul>
<div id="noticelist">      <!-- 자유게시판 리스트 시작-->   
               
               <div class="row">
                  <br>
                  <br>
                  
               </div>
               <div class="form-group">
               <form name="form1" method="post" action="notice" class="navbar-form navbar-right">
                  <select name="searchOption" class="form-control">
                     <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
                     <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >전체</option>
                     <option value="noti_writer_id" <c:out value="${map.searchOption == 'noti_writer_id'?'selected':''}"/> >이름</option>
                     <option value="noti_content" <c:out value="${map.searchOption == 'noti_content'?'selected':''}"/> >내용</option>
                     <option value="noti_title" <c:out value="${map.searchOption == 'noti_title'?'selected':''}"/> >제목</option>
                  </select>
                  <input name="keyword" value="${map.keyword}" class="form-control">
                  <input class="btn btn-default" type="submit" value="조회">
                  
               </form>
          </div>     

               
               <!-- 레코드의 갯수를 출력 -->
               
               <div class="detaillist">
                  <table class="table table-bordered">
                      <tr>
                         <th>글 번호</th>
                         <th>제목</th>
                         <th>작성자</th>
                         <th>작성일</th>
                         <th>조회수</th>
                      </tr>
                       <c:forEach items="${map.list }" var="bean"> 
                      
                         <tr>
                            
                            <td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_seq }</a></td>
                            <td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_title }</a></td>
                            <td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_writer_id }</a></td>
                            <td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.regi_date }</a></td>
                            <td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_hits }</a></td>
                         </tr>
                      </c:forEach>
                      
                  </table>
               </div>
               
            
                  <div id="addBtn">
                     <!-- 관리자 로그인만 글쓰기 버튼 활성화 -->
                        <button class="btn btn-default" type="submit">글쓰기</button>
                  </div>
               
               <div id="pageNum">
                     <nav aria-label="Page navigation">
                       <ul class="pagination">
                         <li>
                            <!-- 이전 페이지 블록으로 이동 :현재 페이지 블럭이 1보다 크면 Previous 버튼을 화면에 출력-->
                         <c:if test="${map.boardPager.curBlock > 1}">
                            <a href="javascript:list('${map.boardPager.prevPage}')" aria-label="Previous">
                                  <span aria-hidden="true">&laquo;</span>
                              </a>
                         </c:if>
                         </li>
                         </li>
                        
                         <!-- 하나의 블럭에서 반복문 수행 시작페이지 부터 끝 페이지까지  -->
                         <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                            <!-- 현재페이지면 하이퍼링크 제거 -->
                            <c:choose>
                               <c:when test="${num == map.boardPager.curPage}">
                                  <li><span style="color: red">${num }</span></li>&nbsp;
                               </c:when>
                               <c:otherwise>
                                  
                                  <li><a href="javascript:list('${num}')">${num }</a></li>&nbsp;
                                  
                               </c:otherwise>
                            </c:choose>
                         </c:forEach>
                         
                         <!-- 다음 페이지 블록으로 이동 : 현재 페이지 블록이 전체 페이지 블럭보다 작거나 같으면 이 버튼을 화면에 출력 -->  
                         <li>
                            <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock }">
                               <a href="javascript:list('${map.boardPager.nextPage}')" aria-label="Next">
                               
                                   <span aria-hidden="true">&raquo;</span>
                                   
                                 </a>
                            </c:if>  
                           
                         </li>
                       </ul>
                     </nav>
               
               </div>
</div>      <!-- 자유게시판 리스트 끝-->   



<div id="noticeadd">   <!-- 글쓰기 페이지 -->
         
         
            <h1>글쓰기</h1>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">플래너
            </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 자유게시판
            </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 투게더
            </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option4"> 여행후기
            </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="option5"> 질문
            </label>
            
      <!-- 첨부파일 시작 -->   
      <form action="notice/add" method="post" enctype="multipart/form-data">
         <div id="addFile">
            <label>
               <input type="file" name="upload_files" />
            </label>   
            
         </div>
      <!-- 첨부파일 끝 -->
      
      <div>
            <input type="text" name="noti_title" class="form-control" placeholder="제목을 입력해주세요">
            
         </div>
         <div>
            <textarea class="form-control" name="noti_content" placeholder="내용을 입력해주세요" rows="20"></textarea>
         </div>
         
         <div id="addBtns">
            <button class="btn btn-primary" type="submit">등록하기</button>
            <button class="btn btn-default" type="reset">취소</button>
            
         </div>
      
      </form>
      
      </div>  <!-- 글쓰기 페이지 끝-->
      
      </div>
            
            
      
   <!-- 여기까지 컨텐츠입니다 -->
   <div class="jumbotron2">
      <%@ include file="../template/footer.jsp"%>
   </div>


</body>
</html>