-- == Schema Information
--
-- Table name: stops
--  id          :integer      not null, primary key
--  name        :string
--
-- Table name: routes
--  num         :string       not null, primary key
--  company     :string       not null, primary key
--  pos         :integer      not null, primary key
--  stop_id     :integer
--

SELECT
  from_craiglockhart.num AS "First Bus Num",
  from_craiglockhart.company AS "First Bus Company",
  mid_stops.name AS "Transfer Stop Name",
  to_sighthill.num AS "Second Bus Num",
  to_sighthill.company AS "Second Bus Company"
FROM
  stops craiglockhart
JOIN
  routes from_craiglockhart ON craiglockhart.id = from_craiglockhart.stop_id
JOIN
  routes to_mid_stop ON from_craiglockhart.num = to_mid_stop.num
JOIN
  stops mid_stops ON to_mid_stop.stop_id = mid_stops.id
JOIN
  routes from_mid_stop ON mid_stops.id = from_mid_stop.stop_id
JOIN
  routes to_sighthill ON from_mid_stop.num = to_sighthill.num
JOIN
  stops sighthill ON to_sighthill.stop_id = sighthill.id
WHERE
  craiglockhart.name = 'Craiglockhart'
  AND sighthill.name = 'Sighthill'
;


-- SELECT
--   routes_from.num, ending_routes.num, sighthill.name, routes_from.num, routes_from.company, mid_stop.name, ending_routes.num, ending_routes.company
-- FROM
--   routes routes_from
-- JOIN
--   stops mid_stop ON routes_from.stop_id = mid_stop.id
-- JOIN
--   routes ending_routes ON ending_routes.stop_id = mid_stop.id
-- JOIN
--   stops sighthill ON ending_routes.stop_id = sighthill.id
-- WHERE
--   routes_from.num IN (
--     SELECT
--       routes_from.num
--     FROM
--       stops mid_stop
--     JOIN
--       routes routes_from ON (mid_stop.id = routes_from.stop_id)
--     WHERE
--       mid_stop.name = 'Craiglockhart'
--   )
--   AND sighthill.name = 'Sighthill'
-- ;

-- SELECT
--   mid_stop.name, routes_from.num
-- FROM
--   stops mid_stop
-- JOIN
--   routes routes_from ON (mid_stop.id = routes_from.stop_id)
-- WHERE
--   mid_stop.name = 'Craiglockhart';
