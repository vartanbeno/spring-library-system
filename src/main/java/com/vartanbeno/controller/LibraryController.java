package com.vartanbeno.controller;

import com.vartanbeno.model.Book;
import com.vartanbeno.model.BookOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/")
public class LibraryController {

    private List<Book> books;
    private static final String[] searchByOptions = { "title", "author", "publisher", "genre", "description" };

    @GetMapping("/")
    public String showSearchPage(Model model) {
        model.addAttribute("searchByOptions", searchByOptions);
        return "search-page";
    }

    @GetMapping("/library")
    public String showLibrary(Model model) {
        books = BookOperations.getBooks();
        model.addAttribute("books", books);

        return "library";
    }

    @GetMapping("/search")
    public String searchBooks(
            @RequestParam("by") String searchBy,
            @RequestParam("q") String query,
            Model model
    ) {

        if (searchBy.equalsIgnoreCase(searchByOptions[0])) {
            books = BookOperations.getBooksByTitle(query);
        }
        else if (searchBy.equalsIgnoreCase(searchByOptions[1])) {
            books = BookOperations.getBooksByAuthor(query);
        }
        else if (searchBy.equalsIgnoreCase(searchByOptions[2])) {
            books = BookOperations.getBooksByPublisher(query);
        }
        else if (searchBy.equalsIgnoreCase(searchByOptions[3])) {
            books = BookOperations.getBooksByGenre(query);
        }
        else if (searchBy.equalsIgnoreCase(searchByOptions[4])) {
            books = BookOperations.getBooksByDescription(query);
        }

        model.addAttribute("books", books);
        model.addAttribute("searchingBy", searchBy.toLowerCase());

        return "search";
    }

}
