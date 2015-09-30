require 'rails_helper'

describe User do

  describe 'identification type ' do
    let(:user) { User.new(name: 'Sample', last_name: 'My Last name')}

    it 'retorn cedula_ciudadania si identification_type es 0' do
      user.identification_type = 0
      expect(user.identification_type).to eq 'cedula_ciudadania'
    end

    it 'retorn tarjeta_de_identidad si identification_type es 1' do
      user.identification_type = 1
      expect(user.identification_type).to eq 'tarjeta_de_identidad'
    end

    it 'retorn cedula_ciudadania si cedula_extranjeria es 2' do
      user.identification_type = 2
      expect(user.identification_type).to eq 'cedula_extranjeria'
    end

    it 'retorn cedula_ciudadania si pasaporte es 3' do
      user.identification_type = 3
      expect(user.identification_type).to eq 'pasaporte'
    end
  end

  describe 'gender enum' do
    let(:user) { User.new(name: 'Sample', last_name: 'My Last name')}

    it 'retorna masculino si gender es 0' do
      user.gender = 0
      expect(user.gender).to eq 'masculino'
    end

    it 'retorna femenino si gender es 1' do
      user.gender = 1
      expect(user.gender).to eq 'femenino'
    end

    it 'retorna indefinido si gender es 2' do
      user.gender = 2
      expect(user.gender).to eq 'indefinido'
    end
  end

  describe '#authenticate' do
    before :each do
      @user = User.create(name: 'sample', last_name: 'some',
                          password: '1234', email: 'sample@email.com')
    end

    it 'Retorna false si el email es malo' do
      expect(User.authenticate('sample1@email.com', '1234')).to eq false
    end

    it 'Retorna false si la clave es mala' do
      expect(User.authenticate('sample@email.com', '12345')).to eq false
    end

    it 'Retorna un usuario si clave y email son correctos' do
      authenticated_user = User.authenticate('sample@email.com', '1234')
      expect(authenticated_user).to an_instance_of User
      expect(authenticated_user.name).to eq @user.name
    end
  end

end