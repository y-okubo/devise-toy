class User < ActiveRecord::Base  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :encryptable, :encryptor => :md5,
         :authentication_keys => [:username]

  before_create do |user|
    # TODO: MUST execute to resque
    `sudo pw groupadd -q -n #{user.username}`
    `sudo pw useradd -n #{user.username} -G #{user.username} -s /usr/sbin/nologin -d /nonexistent`
  end
end
