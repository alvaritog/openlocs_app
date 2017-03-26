namespace :db do

  desc "Rebuild the DB by executing drop, create, migrate and seed"
  task :rebuild => :environment do
    puts "========\n DROP\n========\n\n"
    begin
      Rake::Task["db:drop"].invoke
    rescue Exception => e
      "Error in db:drop => " + e.message
    end
    [:create,:migrate,:seed].each {|task|
      puts "========\n  #{task.upcase}\n========\n\n"
      Rake::Task["db:#{task.to_s}"].invoke
    }
    puts "\nREBUILD DONE\n\n"
  end

end
