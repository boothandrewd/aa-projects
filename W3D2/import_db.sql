-- DATABASE SCHEMA
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT,
  lname TEXT
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  user_id INTEGER NOT NULL
);

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT
);

CREATE TABLE likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL
);

-- DATABASE SEEDS
INSERT INTO users (fname, lname)
VALUES
  ('Andrew', 'Booth'),
  ('Casey', 'Fritsch'),
  ('Anastassia', 'Bobakolonova'),
  ('Howard', 'Feger'),
  ('Ali', 'Haq');

INSERT INTO questions (title, body, user_id)
VALUES
  ('How do I use my computer?', 'How am I even typing this?', (SELECT id FROM users WHERE fname = 'Andrew')),
  ('What time is lunch?', 'Is it at 12 or 12:15?', (SELECT id FROM users WHERE fname = 'Casey')),
  ('When can I go home?', 'I just wanna nap now.', (SELECT id FROM users WHERE fname = 'Casey'));

INSERT INTO replies (question_id, parent_id, user_id, body)
VALUES
  (
    (SELECT id FROM questions WHERE title = 'What time is lunch?'),
    NULL,
    (SELECT id FROM users WHERE fname = 'Andrew'),
    '12:15 duh.'
  );

INSERT INTO likes (user_id, question_id)
VALUES
  (
    (SELECT id FROM users WHERE fname = 'Casey'),
    (SELECT id FROM questions WHERE title = 'How do I use my computer?')
  ),
  (
    (SELECT id FROM users WHERE fname = 'Ali'),
    (SELECT id FROM questions WHERE title = 'What time is lunch?')
  ),
  (
    (SELECT id FROM users WHERE fname = 'Andrew'),
    (SELECT id FROM questions WHERE title = 'When can I go home?')
  ),
  (
    (SELECT id FROM users WHERE fname = 'Howard'),
    (SELECT id FROM questions WHERE title = 'When can I go home?')
  );

INSERT INTO question_follows (user_id, question_id)
VALUES
(4,2),
(5,2),
(4,1);
