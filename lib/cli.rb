require 'pry'
class CommandLineInterface
  def start
    greet
    show_stylist_options
  end

  def greet
    puts "Welcome to Dry Bar! The Premier Blowout Salon and Dry Bar!"
  end

  def show_stylist_options
    #puts
    puts "Welcome to the stylist screen"
    puts "Enter 1 to view client list"
    puts "Enter 2 to view appointments"
    puts "Enter 3 to create a new client"
    puts "Enter 4 to update client"
    puts "Enter 5 to delete client"
    puts "Enter 6 to exit the program"
    puts "Enter 10 to create a new stylist"
    puts "Enter 11 to create an appointment"
    puts "Enter 12 to update an appointment"
    puts "Enter 13 to get stylist location"




    action = gets.chomp.to_i
    if action == 1
      client_list
    elsif action == 2
      appointment_list
    elsif action == 3
      create_client
    elsif action == 4
      update_client
    elsif action == 5
      delete_client
    elsif action == 6
      exit
    elsif action == 10
      create_stylist
    elsif action == 11
      create_appointment
    elsif action == 12
      update_appointment
    elsif action == 13
      stylist_location
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
    #prompt the user for a client name
    #take their response and store it in a local variable 'client_name'
    #prompt the user for the client's gender
    #will store their response as a local variable 'client_gender'
    #invoke create method on Client class
    #create new client by assigning 'client_name' and 'client_gender'
    #to Client attributes name and new_gender
    #let user know they have successfully create a new Client
    #instance by reporting back to the user the new client_id
    puts "Please enter client name"
    client_name = gets.chomp
    puts "Please enter client gender (F/M)"
    client_gender = gets.chomp.upcase
    client = Client.create(name: client_name, gender: client_gender)
    puts "Successfully created client with ID #{client.id}" #+ client.id.to_s
    #interpolating the client.id as a string within the larger response is the same
    #as adding the client.id.to_s to the original string that we're outputting to the terminal
    show_stylist_options
  end

  def update_client
    # binding.pry
    puts "Please enter client ID"
    client_id = gets.chomp
    client = Client.find(client_id)
    puts "Please enter new name"
    new_name = gets.chomp
    puts "Please enter new gender F/M"
    new_gender = gets.chomp.upcase
    updated_client = client.update(name: new_name, gender: new_gender)
    #binding.pry
    puts "Successfully updated client!" + " "  + new_name + " " + new_gender
    show_stylist_options
  end

  def delete_client
    puts "Please enter client ID"
    client_id = gets.chomp.to_i
    client = Client.find(client_id)
    puts "Are you sure you want to delete?  Please type Y for yes and N for no"
    answer = gets.chomp.upcase
    if answer == "Y"
      client.destroy
      puts "Successfully deleted client: #{client.name}"
    else
      show_stylist_options
    end
    show_stylist_options
  end

  def create_stylist
    puts "Please enter a stylist name"
    stylist_name = gets.chomp
    puts "Please enter a location"
    location = gets.chomp
    Stylist.create(name: stylist_name, location: location)
    puts "Great, you've successfuly created a new stylist: #{stylist_name}, #{location}"
    show_stylist_options
  end

    def create_appointment
      puts "Please enter a stylist id"
      stylist_id = gets.chomp.to_i
      # binding.pry
      puts "please enter a client_id"
      client_id = gets.chomp.to_i
      Appointment.create(stylist_id: stylist_id, client_id: client_id)
      puts "Great, you've created an appointment: #{stylist_id}, #{client_id}"
      show_stylist_options
    end

    def update_appointment
      puts "Please enter your appointment number"
        appointment_number = gets.chomp.to_i
      Appointment.find(appointment_number)
      puts "Please enter your new appointment number"
      new_appointment_number = gets.chomp.to_i
      puts "Great, your new appointment number is: #{new_appointment_number}"
      show_stylist_options
    end
end

  def stylist_location
    puts "Please enter your stylist ID"
    stylist_id = gets.chomp.to_i
    #binding.pry
    stylist = Stylist.find(stylist_id)
    stylist_location = stylist.location
    puts "Great, your stylist location is #{stylist_location}"
    show_stylist_options
  end
