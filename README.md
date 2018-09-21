# Library System

This is a simple library system containing various books. It is built using the [Spring Web MVC](https://docs.spring.io/spring/docs/3.2.x/spring-framework-reference/html/mvc.html) framework. The system consists of users and books, which are stored in XML files.
- Users are stored in `src/main/resources/users.xml`
- Books are stored in `src/main/resources/books.xml`

### Installation

1. Download [Apache Tomcat](http://tomcat.apache.org/).
2. Open your favourite Java IDE, such as [Eclipse](https://www.eclipse.org/) or [IntelliJ](https://www.jetbrains.com/idea/).
3. Import the project as a Maven project.
4. Deploy the project to the Tomcat server.
5. Go to [localhost:8080](localhost:8080).
    - **Note:** you might have to go to [localhost:8080/spring-library-system](localhost:8080/spring-library-system).

### Usage

1. The user will land on the `/login` page.
2. Log in with valid credentials, e.g. username `hello` and password `world`.
3. Fill in the keywords input box with what you want to search.
4. Choose the filtering option for the search (e.g. title, author, etc.).
5. Click on `Search`.
6. Once on the search results page, you can switch between list/grid views, and click on a book to get a more detailed description of it.
7. At anytime after logging in, you can go back to the search page or log out.
