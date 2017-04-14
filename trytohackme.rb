module TryToHackMe
  class InnerClass
    def run(cool)
      puts "I am running #{cool} stuff"
    end
  end
end

TryToHackMe::InnerClass.new.run("with stuff")