def select_books_titles_and_years_in_first_series_order_by_year
  "select title, year  from books where series_id=1 order by year"
end

def select_name_and_motto_of_char_with_longest_motto
  "select name, motto
    from characters
    order by length(motto) desc
    limit 1;"
end


def select_value_and_count_of_most_prolific_species
  "select species, count(1)
    from characters
    group by species
    order by count(1) desc
    limit 1;"
end

def select_name_and_series_subgenres_of_authors
"select authors.name, subgenres.name
  from authors, subgenres, series
  where authors.id = series.author_id
  and   subgenres.id = series.subgenre_id"
end

def select_series_title_with_most_human_characters
  "select title from series
    where series.id = (
      select series_id from (
        select series_id, count(1)
        from characters
        where species = 'human'
        group by series_id
        limit 1
      )
    )
  "
end

def select_character_names_and_number_of_books_they_are_in
  "select characters.name, count(1)
  from character_books, characters
  where characters.id = character_books.character_id
  group by character_id
  order by count(1) desc, name asc"
end
