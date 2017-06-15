def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  Movie
    .select(:title, :id)
    .joins(:actors)
    .where("actors.name IN (?)", those_actors)
    .group("movies.title", "movies.id")
    .having("COUNT(castings.actor_id) = 2")
end

def golden_age
  # Find the decade with the highest average movie score.

  Movie
    .group('yr / 10 * 10')
    .order('AVG(score) DESC')
    .limit(1)
    .pluck('yr / 10 * 10').first
end

def costars(name)
  # List the names of the actors that the named actor has ever appeared with.
  # Hint: use a subquery

  Actor
    .joins(:castings)
    .where("castings.movie_id IN (#{
      Actor
        .select("castings.movie_id")
        .joins(:castings)
        .where('actors.name = ?').to_sql})", name
    )
    .where("actors.name != ?", name)
    .distinct.pluck(:name)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  # .select("COUNT(*)")
  Actor
    .joins("LEFT OUTER JOIN castings ON castings.actor_id = actors.id")
    .where("castings.actor_id IS null")
    .pluck("COUNT(*)").first

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the letters in whazzername,
  # ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but not like "stallone sylvester" or "zylvester ztallone"
  Movie
    .select(:title)
    .joins(:actors)
    .where("actors.name LIKE ?", "%#{whazzername.chars.join('%')}%")
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of their career.

end
