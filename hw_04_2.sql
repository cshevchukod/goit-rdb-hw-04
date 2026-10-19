USE LibraryManagement;
INSERT INTO authors (author_name)
VALUES
    ('George Orwell'),
    ('J.R.R. Tolkien');
INSERT INTO genres (genre_name)
VALUES
    ('Dystopian Fiction'),
    ('Fantasy');
INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES
    ('1984', 1949, 1, 1),
    ('The Hobbit', 1937, 2, 2);
INSERT INTO users (username, email)
VALUES
    ('alex_morgan', 'alex@example.com'),
    ('emma_wilson', 'emma@example.com');
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES
    (1, 1, '2026-10-01', '2026-10-15'),
    (2, 2, '2026-10-05', '2026-10-19');