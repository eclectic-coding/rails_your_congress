# senators
@response = Faraday.get 'https://api.propublica.org/congress/v1/116/senate/members.json' do |req|
  req.headers['X-API-KEY'] = Rails.application.credentials[:propublica_api_key]
end

senate_data = JSON.parse(@response.body)
senators = senate_data['results'][0]['members']

# empty string values are assigned in model
# update seeds w/o adding duplicates/ dropping db
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