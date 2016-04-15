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
		for j=1, #tab[1]-1 do
			io.write("|")
			if tab[i][j] == "1" then
				io.write("\27[41m")
			elseif tab[i][j] == "2" then
				io.write("\27[44m")
			end
			io.write("  ", "\27[00m")
		end
			io.write("|\n\n")
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

tab = init_game()
tab[2][3]= "1"
display_tab(tab)
