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
  a.name, x.num, x.company, x.pos, y.num, y.company, y.pos, b.name
FROM
  stops a
JOIN
  routes x ON (a.id = x.stop_id)
JOIN
  routes y ON (x.num = y.num AND x.company = y.company)
JOIN
  stops b ON (y.stop_id = b.id)
WHERE
  a.name = 'Craiglockhart'
  -- AND y.pos BETWEEN x.pos AND (x.pos + 1)
;
