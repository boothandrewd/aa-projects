SELECT
  answer_choices.*, COUNT(responses.id)
FROM
  answer_choices
JOIN
  questions ON questions.id = answer_choices.question_id
LEFT JOIN
  responses ON answer_choices.id = responses.answer_choice_id
WHERE
  questions.id = :v1
GROUP BY
  answer_choices.id
;
