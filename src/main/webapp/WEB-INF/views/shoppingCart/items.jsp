<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<tag:template cabecalho="Carrinho - Checkout" title="Carrinho - Checkout">

	<div class="container">
		
		<h1>Seu Carrinho</h1>
	
		<div class="row">
		
			<table class="table table-striped">
				<tr>
					<th>Título</th>
					<th>Valor</th>
					<th>Quantidade</th>
					<th>Total</th>
				</tr>
				
				<c:forEach items="${shoppingCart.list}" var="item">
					<tr>
						<td class="td-70">
							<c:out value="${item.livro.title} - ${item.bookType}" /></td>			
						<td class="td-10">
							<c:out value="${item.price}" /></td>
						<td class="td-10">
							<c:out value="${shoppingCart.getQuantity(item)}" /></td>
						<td class="td-10">
							<c:out value="${shoppingCart.getTotal(item)}" /></td>
					</tr>
				</c:forEach>
				
				<tr class="active">
					<td colspan="5">
						<button class="btn btn-primary" type="submit">
							<span class="glyphicon glyphicon-shopping-cart"></span> Finalizar
						</button>
					</td>
				</tr>					
			</table>
			
		</div>
	</div>

</tag:template>