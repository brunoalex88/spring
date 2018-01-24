package com.obruno.spring.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
public class Livro {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@NotBlank(message="Título é obrigatório")
	private String title;
	
	@Lob
	@NotBlank(message="Descrição é obrigatória")
	private String description;
	
	@NotBlank(message="Sumário é obrigatório")
	private String summaryPath;
	
	@Min(value=30, message="O número mínimo de páginas é {1}")
	private int pages;
	
	@NotNull(message="Data de lançamento é obrigatória")
	@DateTimeFormat(iso=ISO.DATE)
	private Calendar releaseDate;
	
	@NotBlank(message="Imagem da capa é obrigatória")
	private String imagem;
	
	@ElementCollection
	@Valid
	private List<Price> prices = new ArrayList<Price>();
	
	public BigDecimal priceFor(BookType bookType) {
		return prices
				.stream()
				.filter(price -> price.getBookType().equals(bookType))
				.findFirst().get().getValue();
	}
	
	public String getImagem() {
		return imagem;
	}
	
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	
	public List<Price> getPrices() {
		return prices;
	}
	
	public void setPrices(List<Price> prices) {
		this.prices = prices;
	}
	
	public Calendar getReleaseDate() {
		return releaseDate;
	}
	
	public void setReleaseDate(Calendar releaseDate) {
		this.releaseDate = releaseDate;
	}

	public void setSummaryPath(String summaryPath) {
		this.summaryPath = summaryPath;
	}
	
	public String getSummaryPath() {
		return summaryPath;
	}
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	@Override
	public String toString() {
		return "Livro [title=" + title + ", description=" + description + ", pages=" + pages + "]";
	}

}
