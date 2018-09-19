package com.vartanbeno.model;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class BookOperations {

    private static final String BOOKS_XML = BookOperations.class.getClassLoader().getResource("books.xml").getFile();

    private static Books getListOfBooks() throws JAXBException, FileNotFoundException {
        JAXBContext context = JAXBContext.newInstance(Books.class);
        Unmarshaller unmarshaller = context.createUnmarshaller();
        return (Books) unmarshaller.unmarshal(new FileReader(BOOKS_XML));
    }

    public static List<Book> getBooks() {
        List<Book> bookList = new ArrayList<>();
        try {
            bookList = getListOfBooks().getBookList();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return bookList;
    }

    public static Book getBookById(int id) {
        Book book;
        try {
            book = getBooks().stream().filter(theBook -> theBook.getId() == id).collect(Collectors.toList()).get(0);
        }
        catch (IndexOutOfBoundsException e) {
            System.out.println("Book with id " + id + " does not exist.");
            book = null;
        }
        return book;
    }

    public static List<Book> getBooksByTitle(String title) {
        return getBooks().stream().filter(book -> book.getTitle().toLowerCase().contains(title.toLowerCase())).collect(Collectors.toList());
    }

    public static List<Book> getBooksByAuthor(String author) {
        return getBooks().stream().filter(book -> book.getAuthor().toLowerCase().contains(author.toLowerCase())).collect(Collectors.toList());
    }

    public static List<Book> getBooksByPublisher(String publisher) {
        return getBooks().stream().filter(book -> book.getPublisher().toLowerCase().contains(publisher.toLowerCase())).collect(Collectors.toList());
    }

    public static List<Book> getBooksByGenre(String genre) {
        return getBooks().stream().filter(book -> book.getGenre().toLowerCase().contains(genre.toLowerCase())).collect(Collectors.toList());
    }

    public static List<Book> getBooksByDescription(String description) {
        return getBooks().stream().filter(book -> book.getDescription().toLowerCase().contains(description.toLowerCase())).collect(Collectors.toList());
    }

    @XmlRootElement(name = "books")
    private static class Books {

        @XmlElement(name = "book")
        public List<Book> books;

        public List<Book> getBookList() {
            return books;
        }

        public void setBookList(List<Book> books) {
            this.books = books;
        }
    }
}
