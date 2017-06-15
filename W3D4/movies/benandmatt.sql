SELECT
  COUNT(*)
FROM
  actors
LEFT OUTER JOIN
  castings ON castings.actor_id = actors.id
WHERE
  castings.actor_id IS null

-- SELECT
--   movies.title, movies.id
-- FROM
--   movies
-- JOIN
--   castings ON castings.movie_id = movies.id
-- JOIN
--   actors ON castings.actor_id = actors.id
-- WHERE
--   actors.name IN ('Ben Affleck', 'Matt Damon')
-- GROUP BY
--   movies.title, movies.id
-- HAVING
--   COUNT(castings.actor_id) = 2
-- ;

-- SELECT
--   yr / 10 * 10 AS decade
-- FROM
--   movies
-- GROUP BY
--   decade
-- ORDER BY
--   AVG(score) DESC LIMIT 1
-- ;
--
-- SELECT DISTINCT
--   actors.name
-- FROM
--   actors
-- JOIN
--   castings ON castings.actor_id = actors.id
-- WHERE
--   castings.movie_id IN (
--     SELECT
--       castings.movie_id
--     FROM
--       actors
--     JOIN
--       castings ON castings.actor_id = actors.id
--     WHERE
--       actors.name = 'Matt Damon'
--   )
--   AND actors.name != 'Matt Damon'
-- ;
