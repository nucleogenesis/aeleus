require "option_parser" 

aliases_file = File.expand_path("~/.bash_aliases")
alias_name = ""
command = ""

OptionParser.parse! do |parser|
  parser.banner = "Usage: aeleus [arguments]"
  parser.on("-f FILE", "--to=FILE", "Exact full path to the file where you want aliases added. (eg, /home/user/.bashrc) DEFAULT=~/.bash_aliases") { |file| aliases_file = file }
  parser.on("-a ALIAS", "--alias=ALIAS", "The alias name that you want to apply the command to.") { |a| alias_name = a }
  parser.on("-x COMMAND", "--command=COMMAND", "The command that you want to alias. If your command has spaces, put it between double-quotes. (eg, aelius -a sshproduction -x \"ssh -i ~/.ssh/key user@domain\")") { |c| command = c}
  parser.on("-h", "--help", "Show this help") { puts parser }
end

# Open configuration file
puts "\n---------Parsed Arguments---------"
puts "aliases_file => #{aliases_file}"
puts "alias_name => #{alias_name}"
puts "command => #{command}"
puts "----------------------------------\n"
# TODO REMOVE THIS BLOCK

if(alias_name == "" || command == "") 
  raise("Alias name and command are required.")
end

if(aliases_file != "") 
  begin
    File.open(aliases_file, "a+") do |file|
      text = "alias #{alias_name}=\"#{command}\"\n".bytes
      slice = Slice.new(text.size) { |i| text[i] }
      file.write(slice)
    end
  rescue exception
    puts exception
  end
end