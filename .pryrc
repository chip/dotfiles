begin
  require 'awesome_print' 
  ## If you want awesome_print without automatic pagination, use below:
  Pry.config.print = proc { |output, value| output.puts value.ai }
  Pry.pager = false

rescue LoadError => err
  puts "no awesome_print :("
end
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
else
  puts "no PryByebug :("
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
