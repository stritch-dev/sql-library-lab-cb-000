update characters set species='Martian'
where id = (select max(id) from characters)
