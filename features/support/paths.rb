
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (Calumni )?home\s?page$/ then home_path(":email")

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    when /^(.*)'s profile page$/i
      showprofile_path($1)


    when /^(.*)'s conversation page$/i
      @conversation = Conversation.find($1)
      conversation_messages_path(@conversation)

    when /^the Profile page$/i
      profile_path()
  
    when /^the Decision Role page$/i
      signup_path()

    when /^google_callback$/i
      google_callback_path()

    when /^the Create New Mentor page$/i
      create_mentor_path()
      
    when /^the search page for "(.+)"$/i
      search_path()

      else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
