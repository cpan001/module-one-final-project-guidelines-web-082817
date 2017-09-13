require_relative '../config/environment'



pid = fork{ exec 'afplay', "/Users/cpan/Documents/Flatiron/Projects/module-one-final-project-guidelines-web-082817/lib/Music/happy_groovy.mp3" }
CLI.new.run
pid = fork{ exec 'killall afplay'}
