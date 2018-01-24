package com.obruno.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.obruno.spring.dao.LivroDAO;
import com.obruno.spring.model.BookType;
import com.obruno.spring.model.Livro;
import com.obruno.spring.model.ShoppingCart;
import com.obruno.spring.model.ShoppingItem;

@Controller
@RequestMapping("/shopping")
public class ShoppingCartController {

	@Autowired
	private LivroDAO livroDAO;

	@Autowired
	private ShoppingCart shoppingCart;

	public ModelAndView add(Integer livroId, @RequestParam BookType bookType) {
		ShoppingItem item = createItem(livroId, bookType);
		shoppingCart.add(item);
		return new ModelAndView("redirect:/shopping");
	}

	private ShoppingItem createItem(Integer productId, BookType bookType) {
		Livro product = livroDAO.find(productId);
		ShoppingItem item = new ShoppingItem(product, bookType);
		return item;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/{productId}")
	public String remove(@PathVariable("productId") Integer productId, BookType bookType) {
		shoppingCart.remove(createItem(productId, bookType));
		return "redirect:/shopping";
	}

}
