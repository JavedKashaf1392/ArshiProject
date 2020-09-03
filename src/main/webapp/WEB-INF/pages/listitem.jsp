<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
  
  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%> 
    
 <html>
 <head>
 <meta charset="utf-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <title>Basket</title>
</head>

<body>
<div class="container">


	<c:if test="${not empty message}">
		
		<div class="alert alert-info">
			<h3 class="text-center">${message}</h3>
		</div>		
	
	</c:if>
	
	<c:choose>
		<c:when test="${not empty listItem}">
	        <table id="cart" class="table table-hover table-condensed">
			   	<thead>
					<tr>
						<th style="width:50%">Product</th>
						<th style="width:10%">Price</th>
						<th style="width:8%">Quantity</th>
						<th style="width:22%" class="text-center">Subtotal</th>
						<th style="width:10%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listItem}" var="item">
					<c:if test="${item.available == false}">
						<c:set var="availableCount" value="${availableCount - 1}"/>
					</c:if>
					
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
<spring:url value="/images" var="images"/>
<img src="${images}/${item.product.imageName}" alt="${item.product.productName}" class="img-responsive dataTableImg"/></div>
								<div class="col-sm-10">
									<h4 class="nomargin">${item.product.productName} 
										<c:if test="${cartLine.available == false}">
											<strong style="color:red">(Not Available)</strong> 
										</c:if>
									</h4>
									<p>Description : ${item.product.description}
								</div>
							</div>
						</td>
						<td data-th="Price"> &#8377; ${cartLine.buyingPrice} /-</td>
						<td data-th="Quantity">
							<input type="number" id="count_${cartLine.id}" class="form-control text-center" value="${cartLine.productCount}" min="1" max="3">
						</td>
						<td data-th="Subtotal" class="text-center">&#8377; ${cartLine.total} /-</td>
						<td class="actions" data-th="">
							<c:if test="${cartLine.available == true}">
								<button type="button" name="refreshCart" class="btn btn-info btn-sm" value="${cartLine.id}"><span class="glyphicon glyphicon-refresh"></span></button>
							</c:if>												
							<a href="${contextRoot}/cart/${cartLine.id}/remove" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a>								
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr class="visible-xs">
						<td class="text-center"><strong>Total &#8377; ${userModel.cart.grandTotal}</strong></td>
					</tr>
					<tr>
						<td><a href="${contextRoot}/show/all/products" class="btn btn-warning"><span class="glyphicon glyphicon-chevron-left"></span> Continue Shopping</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong>Total &#8377; ${userModel.cart.grandTotal}/-</strong></td>
						
						<c:choose>
							<c:when test="${availableCount != 0}">
								<td><a href="${contextRoot}/cart/validate" class="btn btn-success btn-block">Checkout <span class="glyphicon glyphicon-chevron-right"></span></a></td>
							</c:when>							
							<c:otherwise>
								<td><a href="javascript:void(0)" class="btn btn-success btn-block disabled"><strike>Checkout <span class="glyphicon glyphicon-chevron-right"></span></strike></a></td>
							</c:otherwise>
						</c:choose>						
					</tr>
				</tfoot>
			</table>
		
		</c:when>
		
		<c:otherwise>
			
			<div class="jumbotron">
				
				<h3 class="text-center">Your Cart is Empty!</h3>
			
			</div>
		
		</c:otherwise>
	</c:choose>




</div>
</body>
</html>