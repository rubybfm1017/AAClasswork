DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
  -- FOREIGN KEY (id) REFERENCES questions(author_id)
);

DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  q_title TEXT NOT NULL,
  q_body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Arthur', 'Miller'),
  ('John', 'Smith'),
  ('Adam', 'Miller'),
  ('Julie', 'Black'),
  ('Eugene', 'Neill');


INSERT INTO
  questions (q_title, q_body,author_id)
VALUES
  ('ready_for_sql', 'are we ready to code some sql?', ( SELECT id FROM users WHERE users.lname = 'Black' AND users.fname = 'Julie' )),
  ('sqlite3', 'are we ready to code some sqlite3?', ( SELECT id FROM users WHERE users.lname = 'Neill' AND users.fname = 'Eugene' ));


DROP TABLE if exists question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id TEXT NOT NULL,
  user_id TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (user_id) REFERENCES users(id)

);

INSERT INTO
  question_follows ( question_id, user_id)
VALUES
  (( SELECT id FROM questions WHERE q_title = 'ready_for_sql' ), ( SELECT id FROM users WHERE users.lname = 'Black' AND users.fname = 'Julie' )),
  (( SELECT id FROM questions WHERE q_title = 'sqlite3' ), ( SELECT id FROM users WHERE users.lname = 'Smith' AND users.fname = 'John' ));


-- DROP TABLE if exists replies;

-- CREATE TABLE replies (
--   replies_id INTEGER PRIMARY KEY,
--   reply TEXT NOT NULL,
--   author TEXT NOT NULL,

--   FOREIGN KEY (q_f_title) REFERENCES questions(q_title)
--   FOREIGN KEY (q_f_body) REFERENCES questions(q_body)

-- );


