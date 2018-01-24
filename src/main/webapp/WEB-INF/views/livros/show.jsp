<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<tag:template cabecalho="Detalhes do Livro" title="Detalhes do Livro">

	<jsp:body>
		
		<div class="container">
			
			<form:form action="#" commandName="livro">
			
				<div class="row">
					<div class="col-md-3">
						<img src="<c:url value="/resources/images/${livro.imagem}" />">
					</div>
					<div class="col-md-9">
						${livro.description}
					</div>
				</div>
			
			</form:form>
					
		</div>
	
	</jsp:body>

</tag:template>