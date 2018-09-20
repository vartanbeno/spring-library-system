package com.vartanbeno.controller;

import com.vartanbeno.model.Book;
import com.vartanbeno.model.BookOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.logging.Logger;

@Controller
public class LibraryController {

    private final Logger logger = Logger.getLogger(getClass().getName());

    private List<Book> books;
    private static final String[] searchByOptions = { "title", "author", "publisher", "genre", "description" };

    @GetMapping("/")
    public String showSearchPage(Model model, HttpServletRequest request) {
        if (LoginController.loggedIn(request)) {
            model.addAttribute("searchByOptions", searchByOptions);
            return "search-form";
        }
        else {
            return "redirect:/login";
        }
    }

    @GetMapping("/search")
    public String searchBooks(
            @RequestParam(value = "by", required = false) String searchBy,
            @RequestParam(value = "q", required = false) String query,
            Model model,
            HttpServletRequest request
    ) {
        if (!LoginController.loggedIn(request)) {
            return "redirect:/login?warning";
        }

        boolean validOption = Arrays.asList(searchByOptions).stream().anyMatch(option -> option.equalsIgnoreCase(searchBy));
        if (!validOption) {
            logger.warning("Make sure your searchBy variable is equal to one of the options in the searchByOptions array (case insensitive).");
            return "redirect:/?instruction";
        }

        query = query.trim();
        if (query == "") {
            logger.warning("You need to include something in your search query.");
            return "redirect:/?instruction";
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

    /*
    Made it so that if the id parameter isn't defined,
    or is just not in the 'database', the user will be
    show a random book from the collection.
     */
    @GetMapping("/book")
    public String getBook(
            @RequestParam(value = "id", required = false) String bookId,
            Model model,
            HttpServletRequest request
    ) {
        if (!LoginController.loggedIn(request)) {
            return "redirect:/login?warning";
        }

        int id;
        List<Book> books = BookOperations.getBooks();

        try {
            id = Integer.parseInt(bookId);
        }
        catch (NumberFormatException e) {
            Random random = new Random();
            id = books.get(random.nextInt(books.size())).getId();
        }

        Book book = BookOperations.getBookById(id);
        model.addAttribute("book", book);

        return "book";
    }

}
