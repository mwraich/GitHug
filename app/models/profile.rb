class ValidatesGender < ActiveModel::Validator
  def validate(profile)
    unless profile.male.present? || profile.female.present? || profile.other.present?
      profile.errors[:gender] << "can't be blank"
    end
  end
end

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :languages, :as => :languageable
  has_one :partner
  has_one :pair_programmer
  has_many :images
  has_many :sent_messages, class_name: :Message, foreign_key: :sender_id
  has_many :recipient_messages, class_name: :Message, foreign_key: :recipient_id
  has_many :blocked_users, through: :users
  has_many :enemies, through: :blocked_users, class_name: User
  has_many :sent_requests, class_name: :PullRequest, foreign_key: :requestor_id
  has_many :received_requests, class_name: :PullRequest, foreign_key: :requestee_id

  accepts_nested_attributes_for :images, :languages, :partner, :pair_programmer, allow_destroy: true
  before_create :location, :latitude  => :latitude, :longitude => :lon
  before_update :location, :latitude  => :lat, :longitude => :lon

  validates_presence_of :location, :birthday
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :about_me, presence: true, length: { minimum: 5, maximum: 500 }

  validates_presence_of :first_name, :last_name, :location, :birthday, :about_me
  # validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  validates_with ValidatesGender
  validate :legal_age
  validates :user_id, uniqueness: {message: "Error. Looks like you already have a profile. You can update your profile by clicking on update."}
  # phony_normalize :phone_number, default_country_code: 'CA'
  # validates ]:phone_number, phony_plausible: true
  # validates :phone_number, uniqueness: {message: "Error, looks like that phone number is already in use"}
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  acts_as_taggable_on :tags



  def self.search(search_params)
    m = search_params['male'].to_i.positive?
    f = search_params['female'].to_i.positive?
    o = search_params['other'].to_i.positive?
    min_age = search_params['min_age'].to_i.years.ago
    max_age = (search_params['max_age'].to_i + 1).years.ago
    part = search_params['date'].to_i.positive?
    pair = search_params['paired_programmer'].to_i.positive?
    location = (search_params['city'] + ', ' + search_params['province'])


    near(location).where('paired_programmer = ? OR date = ?', pair, part)
    .includes(:languages).where( male: m, female: f, other: o )
    .where('birthday BETWEEN ? AND ?', max_age, min_age)
    .where('languages.language = ? OR operating_system like ?',
    search_params['language'], search_params['operating_system'])
    .references(:languages)
  end

  def self.pref_search(search_params)
    m = search_params['male'].to_i.positive?
    f = search_params['female'].to_i.positive?
    o = search_params['other'].to_i.positive?
    min_age = search_params['min_age'].to_i.years.ago
    max_age = (search_params['max_age'].to_i + 1).years.ago
    part = search_params['date'].to_i.positive?
    pair = search_params['paired_programmer'].to_i.positive?

    a = near(search_params['location']).where('paired_programmer = ? OR date = ?', pair, part)
    .includes(:languages).where( male: m, female: f, other: o)
    .where('birthday BETWEEN ? AND ?', max_age, min_age)
    .where('operating_system like ?', search_params['operating_system'])

      match = a.select do |x|
        search_params['language'].each do |lang|
          x.languages == lang.language
        end
      end

  end

  def partnerReco
    if partner.present?
      Profile.pref_search(Profile.find(user).partner.tohash).reject {|x| x if x.id == self.id }
    end
  end

  def pairReco
    if pair_programmer.present?
      Profile.pref_search(Profile.find(user).pair_programmer.tohash).reject {|x| x if x.id == self.id }
    end
  end

  def self.validate_gender
    unless profile.male.present? || profile.female.present? || profile.other.present?
      profile.errors[:gender] << "can't be blank"
    end
  end


  def legal_age
    if birthday + 18.years >= Date.today
      errors.add(:birthday, "Must be over 18 to use this site")
    end
  end

  def blocked_by?(current_user)
    current_user.enemies.include?(self.user) #Have you blocked this person?
  end

  def send_text_message
  # number_to_send_to = profile.phone

  @twilio_sid = ENV["twilio_sid"]
  @twilio_token = ENV["twilio_token"]
  @twilio_phone_number = ENV["twilio_phone_number"]

  @twilio_client = Twilio::REST::Client.new @twilio_sid, @twilio_token

  @twilio_client.account.sms.messages.create(
    :from => "#{@twilio_phone_number}",
    :to => self.phone_number,
    :body => 'message'
  )
    puts "SMS from :#{@twilio_phone_number}"
    puts "SMS to : #{self.phone_number}"
    puts "Hey #{self.first_name}

    You just got a new message!
    Go to GitHug to check it out!!
    XOXO,
    Team GitHug"
  end

  def location
    [city, province].compact.join(', ')
  end

  def location_changed?
    city_changed? || province_changed?
  end

end
