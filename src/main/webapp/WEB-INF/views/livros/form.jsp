<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<tag:template cabecalho="Cadastro de Livros" title="Cadastro de Livros">

	<jsp:body>
		
		<form:form action="${spring:mvcUrl('LC#save').build()}" 
				commandName="livro" method="post">

			<div class="container">
				
				<div class="form-group">
					<label for="title">Título</label>
					<form:input path="title" cssClass="form-control" />
					<form:errors path="title" cssClass="input-error" />
				</div>

				<div class="form-group">
					<label for="summaryPath">Sumário</label>
					<form:textarea rows="5" path="summaryPath" cssClass="form-control" />
					<form:errors path="summaryPath" cssClass="input-error" />
				</div>

				<div class="form-group">
					<label for="description">Descrição</label>
					<form:textarea rows="5" path="description" cssClass="form-control" />
					<form:errors path="description" cssClass="input-error" />
				</div>
				
				<div class="form-group">
					<label for="pages">Número de páginas</label>
					<form:input path="pages" cssClass="form-control" />
					<form:errors path="pages" cssClass="input-error" />
				</div>	

				<div class="form-group">
					<label for="releaseDate">Data de lançamento</label>
					<form:input type="date" path="releaseDate" cssClass="form-control" />
					<form:errors path="releaseDate" cssClass="input-error" />
				</div>

				<div class="form-group">
					<label for="label-file">Capa do livro</label>
					<label class="btn btn-primary" for="imagem" id="label-file">
					    <form:input type="file" cssStyle="display:none" path="imagem" 
					    		onchange="$('#upload-file-info').html(this.files[0].name)" />
					    Escolher
					</label>
					<form:errors path="imagem" cssClass="input-error" />
					<span class='label label-info' id="upload-file-info"></span>
				</div>
				
				<div class="row">
					<c:forEach items="${types}" var="bookType" varStatus="status">
						<div class="col-md-4 col-xs-1">
							<div class="form-group">
								<label for="prices[${status.index}].value">VALOR ${bookType}</label>
								<form:input path="prices[${status.index}].value" cssClass="form-control" />
								<form:errors path="prices[${status.index}].value" cssClass="input-error" />
								<input type="hidden" name="prices[${status.index}].bookType"
										value="${bookType}" />
							</div>
						</div>
					</c:forEach>
				</div>
				
				
				<input type="submit" value="Salvar" class="btn btn-primary">
				
			</div>
		
		</form:form>
		
	</jsp:body>

</tag:template>