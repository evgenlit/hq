class User < ActiveRecord::Base
  include Nameable

  self.table_name = 'user'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, # :validatable,
         authentication_keys: [:username]

  alias_attribute :id,       :user_id
  alias_attribute :username, :user_login
  alias_attribute :password, :user_password
  alias_attribute :email,    :user_email
  alias_attribute :phone,    :user_phone

  belongs_to :fname, class_name: Dictionary, primary_key: :dictionary_id, foreign_key: :user_fname
  belongs_to :iname, class_name: Dictionary, primary_key: :dictionary_id, foreign_key: :user_iname
  belongs_to :oname, class_name: Dictionary, primary_key: :dictionary_id, foreign_key: :user_oname

  has_many :positions, foreign_key: :acl_position_user
  has_many :roles,       through: :positions
  has_many :departments, through: :positions
  
  # has_many :subject_teachers
  # has_many :subjects, :through => :subject_teachers

  has_many :marks, class_name: Study::Mark
  has_many :subjects, class_name: Study::Subject

  def full_name(form = :ip)
    # TODO Убрать после того, как все имена будут перенесены в словарь.
    if last_name.nil? then user_name else super(form) end
  end

  def update_name(parts)
    fname_params = { ip: parts['last_name_ip'], rp: parts[:last_name_rp],
                     dp: parts[:last_name_dp], vp: parts[:last_name_vp],
                     tp: parts[:last_name_tp], pp: parts[:last_name_pp] }
    iname_params = { ip: parts[:first_name_ip], rp: parts[:first_name_rp],
                     dp: parts[:first_name_dp], vp: parts[:first_name_vp],
                     tp: parts[:first_name_tp], pp: parts[:first_name_pp] }
    oname_params = { ip: parts[:patronym_ip], rp: parts[:patronym_rp],
                     dp: parts[:patronym_dp], vp: parts[:patronym_vp],
                     tp: parts[:patronym_tp], pp: parts[:patronym_pp] }

    self.fname = Dictionary.create(fname_params)
    self.iname = Dictionary.create(iname_params)
    self.oname = Dictionary.create(oname_params)
    self.save
  end

  def valid_password?(password)
    if self.password.present?
      if ::Digest::MD5.hexdigest(password) == self.user_password
        # self.password = password
        # self.client_password = nil
        # self.save!
        true
      else
        false
      end
    else
      super
    end
  end

  def is?(role)
    roles.inject(false) do |has_role, r|
      has_role = has_role || (r.name.to_sym == role)
      has_role
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if username = conditions.delete(:username)
      where(conditions).where(['lower(user_login) = :username', { username: username.downcase }]).first
    else
      where(conditions).first
    end
  end
end
