class CommandLineInterface
  def start
    greet
    show_stylist_options
  end

  def greet
    puts "Welcome to Dry Bar! The Premier Blowout Salon and Dry Bar!"
  end

  def show_stylist_options
    puts
    puts "Welcome to the stylist screen"
    puts "Enter 1 to view client list"
    puts "Enter 2 to view appointments"
    puts "Enter 3 to create a new client"
    puts "Enter 4 to exit the program"

    

    action = gets.chomp.to_i
    if action == 1
      client_list
    elsif action == 2
      appointment_list
    elsif action == 3
      create_client
    elsif action == 4
      exit
    end
  end

  def client_list
    puts "Please enter your stylist id."
    stylist_id = gets.chomp.to_i
    stylist = Stylist.find(stylist_id)
    if stylist.clients.length > 0
      stylist.clients.each do |client|
        puts client.name + ": " + client.gender
      end
    else
      puts "You have no clients/money!"
    end
    show_stylist_options
  end

  def appointment_list
    puts "Please enter your stylist id."
    stylist_id = gets.chomp.to_i
    stylist = Stylist.find(stylist_id)
    if stylist.appointments.length > 0
      stylist.appointments.each do |appointment|
        puts "You have an appointment with " + appointment.client.name
      end
    else
      puts "You have no appointments/money!"
    end
    show_stylist_options
  end

  def create_client
    puts "Please enter client name"
     client_name = gets.chomp
    puts "Please enter client gender (F/M)"
    client_gender = gets.chomp.upcase
    client = Client.create(name: client_name, gender: client_gender)
    puts "Successfully created client with ID " + client.id.to_s
    show_stylist_options
  end



end
