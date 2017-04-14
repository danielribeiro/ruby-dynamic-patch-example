require 'set'

puts 'dynamic patch loaded'

hacked_classes_methods = Set.new
Class.__send__(:define_method, :inherited) do |newclazz|
  puts "===> new class: #{newclazz}"
  newclazz.__send__(:define_singleton_method, :method_added) do |method_name|
    puts "===> added #{method_name}"
    unless hacked_classes_methods.include?([newclazz, method_name])
      hacked_classes_methods << [newclazz, method_name]
      newclazz.__send__(:define_method, method_name) do |*args|
        puts "this method was hasked: #{method_name}. It was called with #{args.inspect}"
      end
    end
  end
end
