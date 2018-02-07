package com.obruno.spring.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.obruno.spring.dao.LivroDAO;
import com.obruno.spring.model.BookType;
import com.obruno.spring.model.Livro;

@Controller
@Transactional
@RequestMapping("/livros")
public class LivroController {
	
	@Autowired
	private LivroDAO livroDAO;
	
	@RequestMapping("/form")
	public ModelAndView form(@ModelAttribute Livro livro) {
		return new ModelAndView("livros/form")
				.addObject("types", BookType.values());
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView save(@Valid Livro livro, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		
		if (bindingResult.hasErrors())
			return form(livro);
		
		livroDAO.save(livro);
		redirectAttributes.addFlashAttribute("tipoMensagem", "Sucesso!");
		redirectAttributes.addFlashAttribute("mensagem", "Livro cadastrado com sucesso");
		return new ModelAndView("redirect:/livros/form");
	}
	
	@RequestMapping(value="/list")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("livros/list");
		modelAndView.addObject("livros", livroDAO.list());
		return modelAndView;
	}
	
	@RequestMapping(value="/show")
	public ModelAndView show(Integer id) {
		ModelAndView view = new ModelAndView("livros/show");
		view.addObject("livro", livroDAO.find(id));
		return view;
	}
	
	
}
