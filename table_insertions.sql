-- Active: 1706006653571@@127.0.0.1@3306@first_db
INSERT INTO publishers (name, address, phone_number, website, email, publications_number) VALUES
    ('Penguin Random House', '1745 Broadway, New York, NY 10019, USA', '+1 212-782-9000', 'www.penguinrandomhouse.com', 'info@penguinrandomhouse.com', 1000),
    ('HarperCollins Publishers', '195 Broadway, New York, NY 10007, USA', '+1 212-207-7000', 'www.harpercollins.com', 'info@harpercollins.com', 700),
    ('Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020, USA', '+1 212-698-7000', 'www.simonandschuster.com', 'info@simonandschuster.com', 500),
    ('Hachette Book Group', '1290 Avenue of the Americas, New York, NY 10104, USA', '+1 212-364-1100', 'www.hachettebookgroup.com', 'info@hachettebookgroup.com', 400),
    ('Macmillan Publishers', '120 Broadway, New York, NY 10271, USA', '+1 212-226-7520', 'us.macmillan.com', 'info@macmillan.com', 300),
    ('Scholastic Corporation', '557 Broadway, New York, NY 10012, USA', '+1 212-343-6100', 'www.scholastic.com', 'info@scholastic.com', 200),
    ('Bloomsbury Publishing', '1385 Broadway, New York, NY 10018, USA', '+1 212-419-5800', 'www.bloomsbury.com', 'info@bloomsbury.com', 150);

SELECT * FROM publishers;

INSERT INTO customers (name, address, phone_number, email, password) VALUES
    ('John Doe', '123 Main St, Anytown, USA', '+1 555-123-4567', 'john.doe@example.com', 'johndoe123'),
    ('Alice Smith', '456 Elm St, Anycity, USA', '+1 555-987-6543', 'alice.smith@example.com', 'alicesmith456'),
    ('Robert Johnson', '789 Oak St, Anyville, USA', '+1 555-567-8901', 'robert.johnson@example.com', 'robertjohnson789'),
    ('Emily Brown', '101 Pine St, Anystate, USA', '+1 555-234-5678', 'emily.brown@example.com', 'emilybrown101'),
    ('Michael Wilson', '222 Maple St, Anycity, USA', '+1 555-876-5432', 'michael.wilson@example.com', 'michaelwilson222'),
    ('Sarah Martinez', '333 Oak St, Anytown, USA', '+1 555-345-6789', 'sarah.martinez@example.com', 'sarahmartinez333'),
    ('David Miller', '444 Pine St, Anystate, USA', '+1 555-987-6543', 'david.miller@example.com', 'davidmiller444');


SELECT * FROM customers;

INSERT INTO authors (name, birth, biography, nationality, awards, website, blog) VALUES
    ('J.K. Rowling', '1965-07-31', 'British author best known for the "Harry Potter" series.', 'British', 'Multiple awards including the Hugo Award and British Book Awards', 'www.jkrowling.com', 'www.jkrowling.com/blog'),
    ('Stephen King', '1947-09-21', 'American author known for his horror, supernatural fiction, suspense, and fantasy novels.', 'American', 'Multiple awards including Bram Stoker Awards and World Fantasy Awards', 'www.stephenking.com', 'www.stephenking.com/news'),
    ('Agatha Christie', '1890-09-15', 'British writer known for her detective novels, particularly those featuring Hercule Poirot and Miss Marple.', 'British', 'Multiple awards including the Edgar Award and Agatha Award', NULL, NULL),
    ('George R.R. Martin', '1948-09-20', 'American novelist and short story writer, best known for his series of epic fantasy novels, "A Song of Ice and Fire," which was adapted into the television series "Game of Thrones."', 'American', 'Hugo, Nebula, and Bram Stoker Awards', 'www.georgerrmartin.com', 'www.georgerrmartin.com/notablog'),
    ('Toni Morrison', '1931-02-18', 'American novelist, essayist, editor, and professor, known for her novels exploring the African American experience.', 'American', 'Nobel Prize in Literature, Pulitzer Prize for Fiction', NULL, NULL),
    ('Neil Gaiman', '1960-11-10', 'British author known for his works of fantasy and horror fiction, graphic novels, and comics.', 'British', 'Multiple awards including Hugo, Nebula, and Bram Stoker Awards', 'www.neilgaiman.com', 'www.neilgaiman.com/journal'),
    ('Margaret Atwood', '1939-11-18', 'Canadian poet, novelist, literary critic, and essayist, known for her works of fiction and poetry.', 'Canadian', "Booker Prize, Arthur C. Clarke Award, and Governor General's Award", 'www.margaretatwood.ca', 'www.margaretatwood.ca/news');
INSERT INTO authors (name, birth, biography, nationality, awards, website, blog) VALUES
    ('Terry Pratchett', '1948-04-28', 'English author known for his Discworld series, combining humor and fantasy elements.', 'English', 'Multiple awards including the Carnegie Medal and British Fantasy Award', 'www.terrypratchett.co.uk', NULL),
    ('Peter Straub', '1943-03-02', 'American author specializing in horror fiction, known for his collaborations with Stephen King.', 'American', 'Multiple awards including Bram Stoker Awards and World Fantasy Awards', 'www.peterstraub.net', NULL),
    ('Brent Weeks', '1977-03-07', 'American author known for his epic fantasy series such as the Night Angel Trilogy and the Lightbringer Series.', 'American', 'NYT Bestselling Author', 'www.brentweeks.com', NULL),
    ('Peter V. Brett', '1973-02-08', 'American author best known for his Demon Cycle series, blending fantasy and horror elements.', 'American', 'NYT Bestselling Author', 'www.petervbrett.com', NULL);

SELECT * FROM authors;

INSERT INTO genres (name, description) VALUES
    ('Fiction', 'Literature created from the imagination, not based on real events or people.'),
    ('Mystery', 'Novels focused on solving a crime or puzzle, often involving a detective or amateur sleuth.'),
    ('Romance', 'Novels primarily focusing on the romantic relationship between characters, often with a happy ending.'),
    ('Fantasy', 'Novels featuring magical or supernatural elements, often set in imaginary worlds with their own rules and mythology.'),
    ('Science Fiction', 'Exploring speculative concepts such as futuristic technology, space exploration, and alternate realities.'),
    ('Thriller', 'Characterized by tension, suspense, and excitement, often involving danger and high stakes.'),
    ('Horror', 'Aiming to evoke fear, dread, and suspense, often featuring supernatural elements, monsters, or psychological terror.'),
    ('Historical Fiction', 'Set in the past and seeking to recreate the atmosphere, events, and characters of a particular time period.'),
    ('Young Adult', 'Novels aimed at readers aged 12 to 18, often exploring themes relevant to teenagers, such as identity, relationships, and coming-of-age.'),
    ('Mystery Thriller', 'Combining elements of mystery and thriller genres, featuring suspenseful plots with a focus on solving a crime or unraveling a mystery.'),
    ('Contemporary', 'Set in the present time and dealing with current issues and themes relevant to modern society.'),
    ('Adventure', 'Involving exciting journeys, quests, or expeditions, often featuring daring feats, exploration, and challenges.'),
    ('Drama', 'Focusing on realistic portrayals of human emotions, relationships, and conflicts, often exploring complex themes and character development.'),
    ('Poetry', 'Using language to evoke emotions and express ideas, often characterized by rhythm, meter, and vivid imagery.'),
    ('Biography', 'Telling the life story of a real person, often focusing on significant events, achievements, and experiences.');

SELECT * FROM genres;

INSERT INTO books (isbn, title, edition, year_published, price, pages, genre_id, publisher_id, reviews, rating, status) VALUES
    ('9780590353427', "Harry Potter and the Philosopher\'s Stone", 1, 1997, 10.99, 320, 1, 1, 10000, 4.7, 'Available'),
    ('9780439064866', 'Harry Potter and the Chamber of Secrets', 1, 1998, 11.99, 352, 1, 1, 9500, 4.6, 'Available'),
    ('9780439136365', 'Harry Potter and the Prisoner of Azkaban', 1, 1999, 12.99, 448, 1, 1, 9200, 4.8, 'Available'),
    ('9780439139601', 'Harry Potter and the Goblet of Fire', 1, 2000, 13.99, 640, 1, 1, 8700, 4.9, 'Available'),
    ('9780439358071', 'Harry Potter and the Order of the Phoenix', 1, 2003, 14.99, 896, 1, 1, 8500, 4.8, 'Available'),
    ('9780439784542', 'Harry Potter and the Half-Blood Prince', 1, 2005, 15.99, 672, 1, 1, 8200, 4.8, 'Available'),
    ('9780545010221', 'Harry Potter and the Deathly Hallows', 1, 2007, 16.99, 784, 1, 1, 8100, 4.9, 'Available'),
    ('9781501175466', 'The Shining', 1, 1977, 9.99, 688, 7, 2, 9500, 4.5, 'Available'),
    ('9780307743657', 'The Stand', 1, 1978, 10.99, 1152, 7, 2, 9200, 4.6, 'Available'),
    ('9780451169532', 'Misery', 1, 1987, 11.99, 368, 7, 2, 8900, 4.7, 'Available'),
    ('9781501166273', 'It', 1, 1986, 12.99, 1168, 7, 2, 8600, 4.8, 'Available'),
    ('9781501142970', 'The Girl on the Train', 1, 2015, 13.99, 336, 2, 3, 9300, 4.4, 'Available'),
    ('9781594634024', 'Gone Girl', 1, 2012, 14.99, 432, 2, 3, 9200, 4.5, 'Available'),
    ('9780385349956', 'The Da Vinci Code', 1, 2003, 15.99, 592, 2, 3, 9000, 4.6, 'Available'),
    ('9780062315007', 'Crazy Rich Asians', 1, 2013, 16.99, 544, 3, 4, 9500, 4.3, 'Available'),
    ('9780525555713', 'The Hating Game', 1, 2016, 17.99, 384, 3, 4, 9400, 4.4, 'Available'),
    ('9780345535527', 'The Notebook', 1, 1996, 18.99, 256, 3, 4, 9100, 4.5, 'Available'),
    ('9780143135169', 'The Silent Patient', 1, 2019, 19.99, 352, 7, 5, 9600, 4.2, 'Available'),
    ('9780446675536', 'Big Little Lies', 1, 2014, 20.99, 480, 7, 5, 9500, 4.3, 'Available'),
    ('9781538718466', 'The Woman in the Window', 1, 2018, 21.99, 448, 7, 5, 9400, 4.4, 'Available'),
    ('9781982123966', 'The Night Circus', 1, 2011, 22.99, 512, 4, 6, 9300, 4.1, 'Available'),
    ('9780062073459', 'The Starless Sea', 1, 2019, 23.99, 512, 4, 6, 9200, 4.2, 'Available'),
    ('9780061854149', 'Neverwhere', 1, 1996, 24.99, 448, 4, 6, 9000, 4.3, 'Available'),
    ('9780385472579', 'The Testaments', 1, 2019, 25.99, 432, 14, 7, 9900, 4.0, 'Available'),
    ('9780525559063', "The Handmaid's Tale", 1, 1985, 26.99, 311, 14, 7, 9800, 4.1, 'Available'),
    ('9781444767465', 'The Blind Assassin', 1, 2000, 27.99, 637, 14, 7, 9700, 4.2, 'Available'),
    ('9780062273092', 'American Gods', 1, 2001, 28.99, 635, 6, 1, 9500, 4.0, 'Available'),
    ('9780062457738', 'Norse Mythology', 1, 2017, 29.99, 304, 6, 1, 9400, 4.1, 'Available'),
    ('9780060735273', 'Stardust', 1, 1999, 30.99, 288, 6, 1, 9300, 4.2, 'Available'),
    ('9780385671753', 'Oryx and Crake', 1, 2003, 31.99, 374, 6, 1, 9200, 4.3, 'Available'),
    ('9780385475723', "Cat's Eye", 1, 1988, 32.99, 446, 6, 1, 9100, 4.4, 'Available'),
    ('9780385544337', 'The Testaments', 1, 2019, 33.99, 432, 14, 1, 9000, 4.5, 'Available'),
    ('9780385544290', "The Handmaid's Tale", 1, 1985, 34.99, 311, 14, 1, 8900, 4.6, 'Available'),
    ('9780385653453', 'The Blind Assassin', 1, 2000, 35.99, 637, 14, 1, 8800, 4.7, 'Available');

INSERT INTO books (isbn, title, edition, year_published, price, pages, genre_id, publisher_id, reviews, rating, status) VALUES
    ('9780140277444', 'Good Omens: The Nice and Accurate Prophecies of Agnes Nutter, Witch', 1, 1990, 17.99, 432, 6, 1, 9100, 4.6, 'Available'), -- Neil Gaiman and Terry Pratchett
    ('9780553296988', 'The Talisman', 1, 1984, 16.99, 921, 7, 2, 8900, 4.7, 'Available'), -- Stephen King and Peter Straub
    ('9780345353144', 'The Black Prism', 1, 2010, 18.99, 688, 6, 1, 9200, 4.5, 'Available'); -- Brent Weeks and Peter V. Brett

SELECT * FROM books;

INSERT INTO book_authors (book_id, author_id) VALUES
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), -- J.K. Rowling
    (8, 2), (9, 2), (10, 2), (11, 2), -- Stephen King
    (12, 3), (13, 3), (14, 3), (15, 3), -- Agatha Christie
    (16, 4), (17, 4), (18, 4), (19, 4), -- George R.R. Martin
    (20, 5), -- Toni Morrison
    (21, 6), (22, 6), (23, 6), -- Neil Gaiman
    (24, 7), -- Margaret Atwood
    (25, 8), (25, 9), -- Terry Pratchett and Neil Gaiman
    (26, 9), (26, 2), -- Peter Straub and Stephen King
    (27, 11), (27, 10), -- Brent Weeks and Peter V. Brett
    (29, 6), (29, 8), -- Neil Gaiman and Terry Pratchett
    (30, 2), (30, 11), -- Stephen King and Peter V. Brett
    (31, 10), (31, 11); -- Brent Weeks and Peter V. Brett


INSERT INTO loans (customer_id) VALUES
    (1),
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (1),
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (1);

    INSERT INTO loan_books (loan_id, book_id) VALUES
    (1, 1),
    (2, 2),
    (3, 31),
    (4, 23),
    (5, 15),
    (6, 34),
    (7, 24),
    (8, 14),
    (9, 18),
    (10, 6),
    (11, 27),
    (12, 9),
    (13, 12),
    (14, 6),
    (15, 11),
    (15, 17),
    (15, 18),
    (16, 3),
    (16, 4),
    (17, 5),
    (17, 7),
    (18, 32),
    (19, 27),
    (20, 24),
    (20, 16),
    (20, 13),
    (21, 18),
    (21, 15),
    (21, 22),
    (22, 20),
    (22, 13),
    (23, 26),
    (23, 8),
    (24, 25),
    (24, 7),
    (24, 3),
    (25, 31),
    (25, 5),
    (26, 29),
    (26, 30);

SELECT * FROM loans;
