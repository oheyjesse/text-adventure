# Adventure

**'Adventure'** is a (currently) Terminal-Based text-based adventure game, where you, the player, awake suddenly inside a strange and mysterious world of monsters and ruffians and other horrible things! You will need to carefully inspect and size up potential foes before engaging them, as you'll need stronger and stronger weapons and armour to progress through the world! Maybe there's a way out? Who knows...

This game was created by me, (Drew, @oheydrew!) as an experiment as a very newbie coder merely a month into their coder academy bootcamp. It stands as an exercise in Object Oriented Programming, and I've been trying to learn from guides such as [Sandi Metz](http://www.sandimetz.com) wonderful [Practical Object Oriented Programming in Ruby](http://www.poodr.com) to get me on the right path. It's very much a WIP, and it may never be fully realised, but it's all a bit of fun.

## Key ideas

- Randomly generated maps (and possibly enemies?)

- Inventory/Weapons system, intending to use D&D style dice rolls for combat

- Class based, OO-style design, attempting to stick to the Single Class Responsibility and Avoid Multiple Dependencies principles where possible

## Installation

You'll need [**Ruby 2.4.1**](https://www.ruby-lang.org/en/) and [**Bundler**](http://bundler.io/) to get started. You can download them on mac using [Homebrew](https://brew.sh/).

Once you've got that going, clone this repo using Git, or download and extract the .zip file.

Head to the root directory, and execute

```shell
bundle install
```

cd into the '/lib/' directory, and run

```shell
ruby adventure.rb
```

And you're on your adventure!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Adventure project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/oheydrew/adventure/blob/master/CODE_OF_CONDUCT.md).
