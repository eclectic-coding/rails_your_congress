# house members
@response = Faraday.get 'https://api.propublica.org/congress/v1/117/house/members.json' do |req|
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
    in_office: representative['in_office'],
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

# leaving representatives
@leaving_response = Faraday.get 'https://api.propublica.org/congress/v1/117/house/members/leaving.json' do |req|
  req.headers['X-API-KEY'] = Rails.application.credentials[:propublica_api_key]
end

leaving_representative = JSON.parse(@leaving_response.body)['results'][0]['members']

leaving_representative.each do |representative|
  existing_representative = Representative.find_by(member_id: representative['id'])
  existing_representative.update_attributes!(begin_date: representative['begin_date'],
                          end_date: representative['end_date'],
                          status: representative['status'],
                          note: representative['note'])
end