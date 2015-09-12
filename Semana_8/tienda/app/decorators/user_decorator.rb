class UserDecorator < Decorator::Base

  def nombre_completo
    user.name + user.last_name
  end

  def identification_types
    User.identification_types.map { |name, _| [name.humanize, name] }
  end

  def genders
    User.genders.map { |name, _| [name.humanize, name] }
  end
end