package com.obruno.spring.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.obruno.spring.model.Livro;

@Repository
public class LivroDAO {

	@PersistenceContext
	private EntityManager entityManager;
	
	public void save(Livro livro) {
		entityManager.persist(livro);
	}
	
	public List<Livro> list() {
		return entityManager
				.createQuery("select distinct(l) from Livro l join fetch l.prices", Livro.class)
				.getResultList();
	}
	
	public Livro find(Integer id) {
		TypedQuery<Livro> query = entityManager
							.createQuery("select distinct(l) from Livro l join fetch l.prices where l.id = :id",
										Livro.class).setParameter("id", id);
		
		return query.getSingleResult();
	}
	
}
