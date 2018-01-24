<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<tag:template cabecalho="Lista de Livros" title="Lista de Livros">

	<jsp:body>
		<div class="container">
			
			<c:forEach items="${livros}" var="livro" varStatus="status">
				
				<div class="col-md-4">
				  <div class="thumbnail">
				    <img src="<c:url value="/resources/images/${livro.imagem}" />" 
				    		alt="${livro.title}" style="height: 400px; width: 250px;">
				    <div class="caption">
				      <h3>${livro.title}</h3>
				      <p>${livro.summaryPath}</p>
				      <p><a href="#" class="btn btn-primary" role="button">Detalhes</a></p>
				    </div>
				  </div>
				</div>				
				
			</c:forEach>
		
		</div>
	</jsp:body>

</tag:template>