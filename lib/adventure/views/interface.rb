# This file contains all human input and interface logic. It will likely be
# extended into a class, or perhaps two, one may be an output/display class

def input_prompt(prompt)
  print prompt + ': '
  input = gets.strip.downcase
  puts ''
  return input
  # parse_input(input)
end

def parse_input(input)
  input = input.split(/\W+/)
  input -= %w{up to at in}
  return_command = { command: input[0],
                     target: input[1] }
end
