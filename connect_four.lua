function init_game()
	local tab = {}
	local columns
	local lines
	local valid_input = false

	repeat
		io.write("Choose a number of columns: [4-42]\n")
    columns = tonumber(io.read())
    if columns == nil or columns < 4 or columns > 42 then
    	io.write("Error: must be a number betwin 4 and 42\n\n")
    else
    	valid_input = true
    end
  until valid_input == true
  valid_input = false
  repeat
		io.write("Choose a number of line: [4-42]\n")
    lines = tonumber(io.read())
    if lines == nil or lines < 4 or lines > 42 then
    	io.write("Error: must be a number betwin 4 and 42\n\n")
    else
    	valid_input = true
    end
  until valid_input == true
  io.write("This will be a ", columns, "x", lines, " game.\n")
  for i=1,lines do
  	tab[i] = {}
  	for j=1,columns do
	  	tab[i][j] = " "
  	end
  end
  return tab
end

function display_tab(tab)
	os.execute("clear")
	for i=1, #tab do
		for j=1, #tab[1] do
			io.write("|")
			if tab[i][j] == "1" then
				io.write("\27[41m__")
			elseif tab[i][j] == "2" then
				io.write("\27[44m__")
			else
				io.write("  ")
			end
			io.write("\27[00m")
		end
			io.write("|\n")
	end
	for i=1, #tab[1] do
			io.write(" ")
			if i < 10 then
				io.write("0")
			end
			io.write(i)
	end
	io.write("\n")
end

function get_column_to_play()
	io.write("\nChoose a column to play:\n")
  return tonumber(io.read())
end

function check_value_to_play(value, columns_max)
	if value == nil or value <= 0 or value > columns_max then
		io.write("You must choose a column betwin 1 and ", columns_max, ".\n")
		return false				
	end
	return true
end

function check_column_to_play(value, tab)
	if tab[1][columns] == '1' or tab[1][columns] == '2' then
		io.write("This column is full, try an other.\n")
		return false
	end
	return true
end

function play(tab, id_player)
	local valid_input = false
	local column = 10
	local i = 1

	display_tab(tab)
	
	repeat
		column = get_column_to_play()
		if check_value_to_play(column, #tab[1]) == true then
			if check_column_to_play(column, tab) == true then
				valid_input = true
			end
		end
  until valid_input == true

	while i <= #tab and tab[i][column] == " " do
		if i > 1 then
			tab[i - 1][column] = ' '
		end
		tab[i][column] = id_player
		display_tab(tab)
		os.execute("sleep " .. tonumber(0.2))
		i = i + 1
	end
end

tab = init_game()
play(tab, "1")
play(tab, "1")
play(tab, "1")
play(tab, "2")
play(tab, "1")