package com.vartanbeno.controller;

import com.vartanbeno.model.Book;
import com.vartanbeno.model.BookOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

@Controller
@RequestMapping("/")
public class LibraryController {

    private final Logger logger = Logger.getLogger(getClass().getName());

    private List<Book> books;
    private static final String[] searchByOptions = { "title", "author", "publisher", "genre", "description" };

    @GetMapping("/")
    public String showSearchPage(Model model) {
        model.addAttribute("searchByOptions", searchByOptions);
        return "search-form";
    }

    @GetMapping("/search")
    public String searchBooks(
            @RequestParam("by") String searchBy,
            @RequestParam("q") String query,
            Model model
    ) {
        boolean validOption = Arrays.asList(searchByOptions).stream().anyMatch(option -> option.equalsIgnoreCase(searchBy));
        if (!validOption) {
            logger.warning("Make sure your searchBy variable is equal to one of the options in the searchByOptions array (case insensitive).");
            return "redirect:/";
        }

        if (query.trim() == "") {
            logger.warning("You need to include something in your search query.");
            return "redirect:/";
        }

        // Would've used a switch statement but it was giving me an error.
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

        return "search-results";
    }

}
