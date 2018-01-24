package com.obruno.spring.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

@Embeddable
public class Price {
	
	@Column(scale=2)
	@NotNull(message="Valor é obrigatório")
	private BigDecimal value;
	private BookType bookType;
	
	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}
	
	public BookType getBookType() {
		return bookType;
	}
	
	public void setValue(BigDecimal value) {
		this.value = value;
	}
	
	public BigDecimal getValue() {
		return value;
	}
	
}
