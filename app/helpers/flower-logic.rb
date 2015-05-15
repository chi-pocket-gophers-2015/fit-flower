helpers do

  def calculate_flower_id
    #takes the client info, and calculates the current id
    #that should be displayed
    activities = client.activities_on_date "today"
    calories_burned = activities["summary"]["caloriesOut"]
    goal = activities["goals"]["caloriesOut"] || 2000
    percentage = calories_burned.to_f / goal
    percentage = 1 if percentage > 1
    percentage = 0.1 if percentage < 0.1
    puts "calories burned: #{calories_burned}, goal: #{goal}"
    id = (percentage / 0.1).to_i
    return {id: id, goal: goal, burned: calories_burned}
  end


  # def calculate_flower_id(num, goal)
  #   #takes the client info, and calculates the current id
  #   #that should be displayed
  #   # activities = client.activities_on_date "today"
  #   calories_burned = num
  #   # goal = activities["goals"]["caloriesOut"] || 2000
  #   percentage = calories_burned.to_f / goal
  #   percentage = 1 if percentage > 1
  #   percentage = 0.1 if percentage < 0.1
  #   id = (percenta  ge / 0.1).to_i
  # end

end
