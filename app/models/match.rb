class Match < ActiveRecord::Base


  def get_all_maches(num)
    all_characters = RestClient.get('http://worldcup.sfg.io/teams/')
    character_arr = JSON.parse(all_characters)

    results = character_arr

    results.map {|x|  p country = x["country"] if x["id"] == num}
  end


  # get_character_movies(19)



  def get_team_stats(stat)
    all_characters = RestClient.get('http://worldcup.sfg.io/matches')
    character_arr = JSON.parse(all_characters)

    results = character_arr

    results.map do|x|
      x.map do |key,val|
        # binding.pry
        if val.kind_of?(Array)
          val.map do |y|
            puts y
              # binding.pry

          end
        end
      end
    end.flatten.compact
  end


  def has_builder(name, val)
    hash = Hash.new
    name.each_with_index do |na, index|
      hash[na] = val[index]
    end
    hash
  end

  # ret = get_team_stats("yellow-card")
  # res = []
  # p res << Hash[ret.map {|x| ["Name", x]}]
  # p endre = ret.map{ |v| ["name", v] }.to_h
  #
  # p foo = ret.each_with_object({name}) do |user, memo| # note object and memo reversed from #inject
  #     memo[name] = user
    # end



end
