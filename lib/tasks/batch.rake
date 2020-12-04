namespace :batch do
  desc "Update databases from external API"
  task db_update: :environment do
    # senators
    @response = Faraday.get 'https://api.propublica.org/congress/v1/116/senate/members.json' do |req|
      req.headers['X-API-KEY'] = Rails.application.credentials[:propublica_api_key]
    end

    senate_data = JSON.parse(@response.body)
    senators = senate_data['results'][0]['members']

    senators.each do |senator|
      Senator.find_or_create_by(
        chamber: 'senate',
        member_id: senator['id'],
        title: senator['title'],
        short_title: senator['short_title'],
        first_name: senator['first_name'],
        last_name: senator['last_name'],
        date_of_birth: senator['date_of_birth'],
        gender: senator['gender'],
        party: senator['party'],
        twitter_account: senator['twitter_account'],
        facebook_account: senator['facebook_account'],
        youtube_account: senator['youtube_account'],
        website: senator['url'],
        contact_form: senator['contact_form'],
        seniority: senator['seniority'],
        next_election: senator['next_election'],
        office: senator['office'],
        phone: senator['phone'],
        state: senator['state'],
        missed_votes_pct: senator['missed_votes_pct'],
        votes_with_party_pct: senator['votes_with_party_pct'],
        )
    end

    # house members
    @response = Faraday.get 'https://api.propublica.org/congress/v1/116/house/members.json' do |req|
      req.headers['X-API-KEY'] = Rails.application.credentials[:propublica_api_key]
    end

    house_data = JSON.parse(@response.body)
    representatives = house_data['results'][0]['members']

    # update seeds w/o adding duplicates/ dropping db
    representatives.each do |representative|
      Representative.find_or_create_by(
        chamber: 'house',
        member_id: representative['id'],
        title: representative['title'],
        short_title: representative['short_title'],
        first_name: representative['first_name'],
        last_name: representative['last_name'],
        date_of_birth: representative['date_of_birth'],
        gender: representative['gender'],
        party: representative['party'],
        twitter_account: representative['twitter_account'],
        facebook_account: representative['facebook_account'],
        youtube_account: representative['youtube_account'],
        website: representative['url'],
        contact_form: representative['contact_form'],
        seniority: representative['seniority'],
        next_election: representative['next_election'],
        office: representative['office'],
        phone: representative['phone'],
        state: representative['state'],
        missed_votes_pct: representative['missed_votes_pct'],
        votes_with_party_pct: representative['votes_with_party_pct'],
        district: representative['district']
      )
    end
  end

end
