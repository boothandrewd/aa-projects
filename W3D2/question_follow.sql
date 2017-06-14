SELECT
  users.id, users.fname, users.lname
FROM
  questions
  JOIN
    question_follows ON questions.id = question_follows.question_id
    JOIN users ON question_follows.user_id = users.id
    WHERE
      questions.id = 2
    ;
