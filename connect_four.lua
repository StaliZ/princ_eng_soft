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

tab = init_game()
