<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<tag:template cabecalho="Detalhes do Livro" title="Detalhes do Livro">

	<jsp:body>
		
		<div class="container">
			
			<div class="row">
				<div class="col-md-3">
					<img src="<c:url value="/resources/images/${livro.imagem}" />">
				</div>
				<div class="col-md-9">
					<div class="row">
						<h1 style="margin-top: 0;">
							<font face="Tahoma" color="#0033cc">
								${livro.title}					 
							</font>
						</h1>
						
					</div>
					<div class="row">
						<p style="text-indent: 4em; text-align: justify;">
							<font size="3" face="Lucida Sans Unicode">
								${livro.description}
							</font>
						</p>
					</div>
					<div class="row">
						<p>
							<font face="Tahoma">
								Número de páginas: ${livro.pages}
							</font>							
						</p>							
					</div>
					
				</div>
			</div>
				
		</div>
		
		<div class="container-flex buy">
			
			<form action="<c:url value="/shopping" />" method="post">
			
				<div class="container">
					<div class="row">
						<div class="col-md-7">
							<div class="row">
							
								<input type="hidden" value="${livro.id}" name="livroId">
								<div class="col-md-3">
									<div class="buy-item">
										<label class="radio-inline">
											<input type="radio" name="bookType" 
													value="${livro.prices[0].bookType}">Ebook
										</label>
										<p align="right">R$ ${livro.prices[0].value}</p>									
									</div>								
								</div>
	
								<div class="col-md-3">
									<div class="buy-item">
										<label class="radio-inline">
											<input type="radio" name="bookType"
													value="${livro.prices[1].bookType }">Impresso
										</label>
										<p align="right">R$ ${livro.prices[1].value}</p>									
									</div>								
								</div>
								
								<div class="col-md-3">
									<div class="buy-item">
										<label class="radio-inline">	
											<input type="radio" name="bookType"
													value="${livro.prices[2].bookType}">Combo
										</label>
										<p align="right">R$ ${livro.prices[2].value}</p>									
									</div>								
								</div>									
				
							</div>
						</div>
						<div class="col-md-5" id="comprar">
							<div>
								<input type="submit" class="btn btn-lg" value="Comprar">
							</div>
						</div>	
					</div>
				</div>
			</form>
		</div>
	
	</jsp:body>

</tag:template>