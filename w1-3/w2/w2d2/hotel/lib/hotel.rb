require_relative "room"

class Hotel

  attr_reader :rooms
  def initialize(name_s, room_name_h)
    @name = name_s
    @room_name_h = room_name_h
    @rooms = {}
    @room_name_h.each {|k, v| @rooms[k] = Room.new(v) }
  end

  def name

    caps_name_a = []
    @name.split(' ').each do |e|
      caps_name_a << e.capitalize
    end

    caps_name_a.join(' ')
  end

  def room_exists?(room_name)

    @rooms.key?(room_name)
  end

  def check_in(person, room_name)
    if !self.room_exists?(room_name)
      p 'sorry, room does not exist'
      
    elsif @rooms[room_name].add_occupant(person)
      p 'check in successful'
    else
      p 'sorry, room is full'
    end
  end
  
  def has_vacancy?
    @rooms.each {|r_name,room| return true if !room.full? }
    false
  end

  def list_rooms
    @rooms.each do |r_name,room|
      puts "#{r_name} #{room.available_space}"
    end
  end 

end
