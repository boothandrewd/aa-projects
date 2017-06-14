
SELECT SUM(like_count) / COUNT(*)
FROM (
  SELECT
    COUNT(likes.user_id) AS like_count
  FROM
    likes
  JOIN
    questions ON likes.question_id = questions.id
  WHERE
    questions.user_id = 2
  GROUP BY
    question_id
);
