TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.
TRUNCATE TABLE users RESTART IDENTITY CASCADE;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email_address, username) VALUES ('h@b.com', 'h123');
INSERT INTO users (email_address, username) VALUES ('x@y.com', 'x000');

INSERT INTO posts (title, content, views, user_id) VALUES ('monday', 'hello', 15, '1');
INSERT INTO posts (title, content, views, user_id) VALUES ('tuesday', 'hello back', 15, '2');