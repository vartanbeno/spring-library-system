<%--
  Created by IntelliJ IDEA.
  User: vartanbeno
  Date: 2018-09-19
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.css">

<style>
    .ui.container {
        width: 75%;
    }

    .ui.container.body {
        margin-bottom: 3rem;
    }

    .main {
        display: flex;
        justify-content: center;
    }

    .column {
        width: 50%;
    }

    #header {
        padding: 3rem 0;
        background-color: black;
        margin-bottom: 2rem;
    }

    #header h1 {
        color: white;
        margin-bottom: 0;
    }

    .description > .book.info {
        text-decoration: underline;
    }

    .book.cover {
        cursor: pointer;
    }

    .book.description {
        min-height: 250px;
    }

    #grid-view {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-evenly;
    }

    div.book.cover {
        margin: 1rem 0;
        padding: 1rem 0.5rem;
        width: 220px;
        text-align: center;
        box-shadow: 0 0 20px -2px rgba(0, 0, 0, 0.25);
    }

    .book.title.and.author {
        text-align: center;
        font-size: 1.2rem;
    }

    .book.title.and.author > p.title {
        color: #4183C4;
        margin-bottom: 0;
        margin-top: 1rem;
    }

    .justify {
        text-align: justify;
    }

    .preline {
        white-space: pre-line;
    }

    .small.text {
        font-size: 1rem;
    }

    .grey.text {
        color: rgba(0, 0, 0, 0.4)
    }
</style>