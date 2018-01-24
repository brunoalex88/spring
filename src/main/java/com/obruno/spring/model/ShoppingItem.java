package com.obruno.spring.model;

import java.math.BigDecimal;

public class ShoppingItem {

	private Livro livro;
	private BookType bookType;
	private Integer livroId;

	public ShoppingItem(Livro livro, BookType bookType) {
		this.livro = livro;
		this.bookType = bookType;
		this.livroId = livro.getId();
	}

	public BigDecimal getTotal(Integer quantity) {
		return getPrice().multiply(new BigDecimal(quantity));
	}
	
	public BigDecimal getPrice() {
		return livro.priceFor(bookType);
	}
	
	public Livro getLivro() {
		return livro;
	}

	public void setLivro(Livro livro) {
		this.livro = livro;
	}

	public BookType getBookType() {
		return bookType;
	}

	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}

	public Integer getLivroId() {
		return livroId;
	}

	public void setLivroId(Integer livroId) {
		this.livroId = livroId;
	}

}
